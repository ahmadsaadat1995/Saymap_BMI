using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using NewMellat.gam;
using OfficeAutomationServiceClient.LetterServiceProxy;
using System.Data;
using DataAccessLayer;
using System.Globalization;

namespace NewMellat.Content
{
    public partial class PageSooratAnswers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }
            sourceInfo.SelectParameters["prCode"].DefaultValue = Page.User.Identity.Name;

            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = " ارسال به تدارکات ";
        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            // return;
            if (e.DataColumn.FieldName == "paDate")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label3") as Label;
                try
                {
                    lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;

                }
                catch
                {

                }

            }

            if (e.DataColumn.FieldName == "paDate2")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label4") as Label;
                try
                {
                    lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;

                }
                catch
                {

                }

            }
        }

        protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "letter")
            {
                System.Net.ServicePointManager.ServerCertificateValidationCallback += (se, cert, chain, sslerror) => { return true; };
                ASPxGridView grid = (ASPxGridView)sender;
                string[] x = new string[] { "SoorathesbPrice", "Nazer1Name", "Nazer2Name", "OnvanTahvili", "pishId", "paNumber", "paDate", "companyName", "ProjectName", "ProjectGharardad", "Gharardad", "paNumber2", "paDate2", "paEdare", "paEdare2","id"};
                object[] fields = grid.GetRowValues(e.VisibleIndex, x) as object[];

                string price = fields[0].ToString();
                string pishId = fields[4].ToString();
                string dore = fields[3].ToString();
                string department = fields[1].ToString();
                string department2 = fields[2] != null ? fields[2].ToString() : "";
                string paNumber = fields[5] != null ? fields[5].ToString() : "";
                string paDate = fields[6] != null ? fields[6].ToString() : "";
                var company = fields[7].ToString();
                var projectName = fields[8].ToString();
                var projectNo = fields[9].ToString();
                var OnvanTahvili = fields[10].ToString();
                string paNumber2 = fields[11] != null ? fields[11].ToString() : "";
                string paDate2 = fields[12] != null ? fields[12].ToString() : "";
                string paEdare = fields[13] != null ? fields[13].ToString() : "";
                string paEdare2 = fields[14] != null ? fields[14].ToString() : "";
                string sooratId = fields[15].ToString() ;
                string naser2Matn = "";

                var cc = new string[] { company };


                string letterName = "PageSooratErsalSHerkat\\total";
                string subject = "", caption = "";
                switch (OnvanTahvili)
                {
                    case "استرداد-تضامین":
                        letterName = "PageSooratAnswers\\hosn";
                        caption = "استردادتضامین";
                        subject = "حسن انجام کار";
                        if (department2 != "")//2 ناظره هست
                        {

                            if (paEdare != "3" && paEdare2 != "3")
                            {
                                naser2Matn = "و تاییدیه *7* (نامه شماره *8* مورخ *9*) ".Replace("*7*", department2)
                                       .Replace("*8*", String.Join("/", paNumber2.Split('/').Reverse()))
                                       .Replace("*9*", String.Join("/", CommonClass.ShamsiDate(DateTime.Parse(paDate2)).Split('/').Reverse()));
                            }
                        }
                        break;
                    case "استرداد-حسن انجام کار":
                        caption = "استرداد 10% سپرده حسن انجام کار";
                        letterName = "PageSooratAnswers\\hosn";
                        subject = "حسن انجام کار";
                        if (department2 != "")//2 ناظره هست
                        {

                            if (paEdare != "3" && paEdare2 != "3")
                            {
                                naser2Matn = "و تاییدیه *7* (نامه شماره *8* مورخ *9*) ".Replace("*7*", department2)
                                       .Replace("*8*", String.Join("/", paNumber2.Split('/').Reverse()))
                                       .Replace("*9*", String.Join("/", CommonClass.ShamsiDate(DateTime.Parse(paDate2)).Split('/').Reverse()));
                            }
                        }
                        break;

                    default:
                        if (department2 != "")//2 ناظره هست
                        {
                            if (paEdare != "3" && paEdare2 != "3")
                            {
                                letterName = "PageSooratAnswers\\sorat";
                                naser2Matn = "و تاییدیه *7* (نامه شماره *8* مورخ *9*) ".Replace("*7*", department2)
                                    .Replace("*8*", String.Join("/", paNumber2.Split('/').Reverse()))
                                    .Replace("*9*",String.Join("/", CommonClass.ShamsiDate(DateTime.Parse(paDate2),"/").Split('/').Reverse()));
                               
                               
                            }
                            else if (paEdare != "3" && paEdare2 == "3")
                            {
                                letterName = "PageSooratAnswers\\sorat-1Replay";
                                naser2Matn = department2;
                                cc = cc.Concat(new string[] { department2 }).ToArray();
                            }
                            else if (paEdare == "3" && paEdare2 != "3")
                            {
                                letterName = "PageSooratAnswers\\sorat-1Replay";
                                naser2Matn = department;
                                cc = cc.Concat(new string[] { department }).ToArray();
                                department = department2;
                                paNumber = paNumber2;
                                paDate = paDate2;

                              
                            }
                            else
                                letterName = "PageSooratAnswers\\sorat-notReplay";
                            
                        }
                        else   //2 ناظره نیست
                        {
                            if (paEdare != "3")//اول نظر داده ناظر
                                letterName = "PageSooratAnswers\\sorat";
                            else
                            {
                                letterName = "PageSooratAnswers\\sorat-notReplay";
                                naser2Matn = department;
                            }
                                
                        }
                       
                        subject = "صورتحساب";
                        caption = String.Join("/", dore.Split('/').Reverse());
                        break;
                }


                BaseClientSymap bs = new BaseClientSymap(Page.User.Identity.Name);
                
                com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO[] signers = new com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO[1];
                signers[0] = new com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO() { personId = bs.pIdHadimanesh, departmentId = bs.depIdHadimanesh };
                com_gam_secretariat_webservice_complextypes_LetterWTO param1 = new com_gam_secretariat_webservice_complextypes_LetterWTO();
                param1.letAccessType = "1";
                param1.letDocTypeId = bs.GetDocTypeId();
                param1.letPriorityId = bs.GetPriorityId();
                param1.letTransfer = bs.TransferType;
                //  param1.letSenderPerId = 1234;
                // param1.letSenderDepId = 1234;
                param1.signers = signers;
                param1.letRegistrarDepId = bs.GetPersonDepartmentsID();



                var d = new string[] { "اداره کل تدارکات" };

                param1.receivers = bs.GetLetterReceivers(d);
                param1.ccReceivers = bs.GetLetterReceivers(cc);
                param1.letComment = projectName + " " + projectNo;

                DataAccessBase db = new DataAccessBase();
                DataTable dt2 = db.ReaderText("select * from  tbProjectPaper where paProject=" + pishId + " and paAct=1 and paType = 1001 ");
                string paNumber0 = "", paDate0 = "";
                if (dt2.Rows.Count > 0)
                {
                    paNumber0 = dt2.Rows[0]["PaNumber"] != null ? dt2.Rows[0]["PaNumber"].ToString() : "";
                    paDate0 = dt2.Rows[0]["PaDate"] != null ? CommonClass.ShamsiDate(DateTime.Parse(dt2.Rows[0]["PaDate"].ToString()), "/") : "";
                }

                var dic = new Dictionary<string, string>();
                dic.Add("*0*", naser2Matn);
                dic.Add("*1*", String.Join("/", paNumber0.Split('/').Reverse()));
                dic.Add("*2*", String.Join("/", paDate0.Split('/').Reverse()));
                dic.Add("*3*", company);
                dic.Add("*4*", String.Join("/", dore.Split('/').Reverse()));
                dic.Add("*5*", projectName);
                dic.Add("*6*", String.Join("-", projectNo.Split('-').Reverse()));
                dic.Add("*7*", department);
                dic.Add("*8*", String.Join("/", paNumber.Split('/').Reverse()));
                string z= paDate==""?"":String.Join("/", CommonClass.ShamsiDate(DateTime.Parse(paDate), "/").Split('/').Reverse());
                dic.Add("*9*", z);

                if (price == "")
                    price = "0";

                dic.Add("*11*", String.Format("{0:n0}", long.Parse(price)));
                dic.Add("*12*", HumanReadableInteger.NumberToText(long.Parse(price), Language.Persian));

                param1.body = new com_gam_secretariat_webservice_complextypes_FileWTO()
                {
                    content = bs.createFile(letterName, dic)
                };
                param1.subjectIds = bs.GetSubjectIds(subject);

                // var actual = "11122233";

                var actual = bs.LetterServiceClient.insertLetter(bs.SecurityContextWTOLetterService, param1);

                int result = db.NonQueryTxt("INSERT INTO [dbo].[tbGamLetterNumber]([entity],[letterNo],pishid,paProject)VALUES('PageSooratAnswers'," + actual + ",'" + pishId + "','"+sooratId+"')");

                Response.Write("<script>alert('پیش نویس نامه با موفقیت در سامانه گام ایجاد گردید. شماره نامه : " + actual + "')</script>");

            }
        }
    }
}
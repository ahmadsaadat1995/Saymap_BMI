using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Globalization;
using NewMellat.gam;
using OfficeAutomationServiceClient.LetterServiceProxy;
using System.Data;
using DataAccessLayer;

namespace NewMellat.Content
{
    public partial class PageSooratErsalSHerkat : System.Web.UI.Page
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
            panel.Text = "ارسال به شرکت";
        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.VisibleIndex == 9)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink1") as HyperLink;
                string[] strItembody = hp.NavigateUrl.Split('=');
                //hp.Attributes.Add("onclick", string.Format("loadDoc({0}); return false;", strItembody[1]));
            }
        }
        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {

            ASPxGridViewExporter1.WriteXlsxToResponse();
        }

        protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "letter")
            {
                System.Net.ServicePointManager.ServerCertificateValidationCallback += (se, cert, chain, sslerror) => { return true; };
                ASPxGridView grid = (ASPxGridView)sender;
                string[] x = new string[] { "paType", "Nazer1Name", "Nazer2Name", "pishDore", "pishId", "paNumber", "paDate", "companyName", "ProjectName", "ProjectGharardad", "Gharardad" };
                object[] fields = grid.GetRowValues(e.VisibleIndex, x) as object[];


                string pishId = fields[4].ToString();
                string dore = fields[3].ToString();
                string department = fields[1].ToString();
                if (fields[0].ToString() == "1004")
                    department = fields[2].ToString();
                string paNumber = fields[5] != null ? fields[5].ToString() : "";
                string paDate = fields[6] != null ? fields[6].ToString() : "";
                var company = fields[7].ToString();
                var projectName = fields[8].ToString();
                var projectNo = fields[9].ToString();
                var OnvanTahvili = fields[10].ToString();

                PersianCalendar pc = new PersianCalendar();
                DateTime thisDate = DateTime.Now.AddDays(7);


                string letterName = "PageSooratErsalSHerkat\\total";
                string subject = "",caption="";
                switch (OnvanTahvili)
                {
                    case "استرداد-تضامین":
                      //  letterName = "PageSooratErsalSHerkat\\tazamin";
                        caption = "استردادتضامین";
                        subject = "حسن انجام کار";
                        break;
                    case "استرداد-حسن انجام کار":
                        caption = "استرداد 10% سپرده حسن انجام کار";
                       // letterName = "PageSooratErsalSHerkat\\hosn";
                        subject = "حسن انجام کار";
                        break;
                    case "استرداد-مفصا حساب":
                        caption = "مفاصا حساب";
                        subject = "مفاصا حساب";
                        break;
                    default:
                     //   letterName = "PageSooratErsalSHerkat\\sayer";
                        subject = "صورتحساب";
                        caption = "صورت وضعیت مرحله " + String.Join("/", dore.Split('/').Reverse());
                        break;
                }


                BaseClientSymap bs = new BaseClientSymap(Page.User.Identity.Name);
                //Page.User.Identity.Name

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


                var d = new string[] { company };


                param1.receivers = bs.GetLetterReceivers(d);
                param1.letComment = projectName + " " + projectNo;

                DataAccessBase db = new DataAccessBase();
                DataTable dt2 = db.ReaderText("select * from  tbProjectPaper where paProject=" + pishId + " and paAct=1 and paType in( 1001,1006) order by paId desc");
                string paNumber2 = "", paDate2 = "";
                if (dt2.Rows.Count > 0)
                {
                    paNumber2 = dt2.Rows[0]["PaNumber"] != null ? dt2.Rows[0]["PaNumber"].ToString() : "";
                    paDate2 = dt2.Rows[0]["PaDate"] != null ? CommonClass.ShamsiDate(DateTime.Parse(dt2.Rows[0]["PaDate"].ToString()), "/") : "";
                }

                var dic = new Dictionary<string, string>();
                dic.Add("*0*", company);
                dic.Add("*1*", String.Join("/", paNumber2.Split('/').Reverse()));
                dic.Add("*2*", String.Join("/", paDate2.Split('/').Reverse()));
               
                dic.Add("*3*", projectName);
                dic.Add("*4*", String.Join("-", projectNo.Split('-').Reverse()));
                dic.Add("*5*", String.Join("/", paNumber.Split('/').Reverse()));
                dic.Add("*6*", String.Join("/", paDate.Split('/').Reverse()));
                dic.Add("*7*", department);
                dic.Add("*8*", String.Join("/", CommonClass.ShamsiDate(thisDate, "/").Split('/').Reverse()));


                dic.Add("*9*", caption);

                param1.body = new com_gam_secretariat_webservice_complextypes_FileWTO()
                {
                    content = bs.createFile(letterName, dic)
                };
                param1.subjectIds = bs.GetSubjectIds(subject);

              //  var actual = "11122233";

                var actual = bs.LetterServiceClient.insertLetter(bs.SecurityContextWTOLetterService, param1);
             //   lblLetterResult.Text = string.Format("پیش نویس نامه با موفقیت در سامانه گام ایجاد گردید. شماره نامه : " + actual);

                int result = db.NonQueryTxt("INSERT INTO [dbo].[tbGamLetterNumber]([entity],[letterNo],pishid)VALUES('PageSooratErsalSHerkat'," + actual + ",'" + pishId + "')");

                Response.Write("<script>alert('پیش نویس نامه با موفقیت در سامانه گام ایجاد گردید. شماره نامه : " + actual + "')</script>");

            }
        }
    }
}
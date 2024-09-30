using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Globalization;
using OfficeAutomationServiceClient.LetterServiceProxy;
using NewMellat.gam;
using System.Text;
using DataAccessLayer;
using System.Data;

namespace NewMellat.Content
{
    public partial class PageEstelamMohtavayi : System.Web.UI.Page
    {
        private int intSumPending = 0;

        private int intSumAnswers = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }


            sourceMohtava0.SelectParameters["prCode"].DefaultValue = Page.User.Identity.Name;


            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "استعلام محتوایی و قیمتی";


            //g1.Value = db.tbTarhPishnehadis.Where(n => n.thAct == 1).Count().ToString();

            //g2.Value = db.tbTemps.SingleOrDefault(n => n.tmId == 1).tmData.Value.ToString();

            //g4.Value = db.tbTemps.SingleOrDefault(n => n.tmId == 2).tmData.Value.ToString();

            //g5.Value = db.tbTemps.SingleOrDefault(n => n.tmId == 3).tmData.Value.ToString();

        }

        NewMellatEntities db = new NewMellatEntities();

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {

            if (e.DataColumn.VisibleIndex == 9)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink1") as HyperLink;
                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc7({0}); return false;", strItembody[1]));
            }



            if (e.DataColumn.VisibleIndex == 10)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink2") as HyperLink;
                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc5({0}); return false;", strItembody[1]));
            }

            if (e.DataColumn.VisibleIndex == 11)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink8") as HyperLink;
                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc6({0}); return false;", strItembody[1]));
            }



            if (e.DataColumn.VisibleIndex == 6)
            {
                HyperLink hp =
                    ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink4") as HyperLink;

                HiddenField hf =
                    ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HiddenField4") as
                        HiddenField;

                Image img1 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "img1") as Image;
                Image img2 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "img2") as Image;
                Image img3 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "img3") as Image;
                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc({0}); return false;", strItembody[1]));

                // محاسبه nitifications

                StringBuilder sb = new StringBuilder();

                // تعداد استعلام
                int intId = Convert.ToInt32(hf.Value);
                var estelam = db.tbProjectPapers.Where(n => n.paType == 8 && n.paProject == intId && n.paAct == 1);
                sb.AppendLine("تعداد استعلام: " + estelam.Count());

                if (estelam.Count() > 0)
                {
                    img1.Visible = true;
                }
                else
                {
                    img1.Visible = false;
                }


                // تعداد پاسخ استعلام
                int intAnswerCount = 0;
                foreach (var es in estelam)
                {
                    var estelamAnswer = db.tbNazars.Where(n => n.nzAct == 1 && n.nzType == 10 && n.nzParent == es.paId);
                    intAnswerCount += estelamAnswer.Count();
                    intSumAnswers += intAnswerCount;
                }
                if (intAnswerCount > 0)
                {
                    img2.Visible = true;

                    intSumPending += intAnswerCount;
                }
                else
                {
                    img2.Visible = false;
                }

                sb.AppendLine("تعداد پاسخ استعلام : " + intAnswerCount);


                // تعداد ارسال به شرکت
                int intSherkat = 0;
                foreach (var es in estelam)
                {
                    var estelamAnswer = db.tbNazars.Where(n => n.nzAct == 1 && n.nzType == 10 && n.nzParent == es.paId);
                    foreach (var answer in estelamAnswer)
                    {
                        int answerId = Convert.ToInt32(answer.nzId);
                        var inf =
                            db.tbProjectPapers.Where(n => n.paAct == 1 && n.paProject == answerId && n.paType == 50);
                        intSherkat += inf.Count();
                    }
                }



                if (intSherkat > 0)
                {
                    img3.Visible = true;
                }
                else
                {
                    img3.Visible = false;
                }

                sb.AppendLine("تعداد ارسال به شرکت : " + intSherkat);



                hp.ToolTip = sb.ToString();

                //  g3.Value = intSumAnswers.ToString();


            }

            if (e.DataColumn.VisibleIndex == 15)
            {

                HiddenField hf = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HiddenField1") as HiddenField;
                HiddenField hf2 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HiddenField2") as HiddenField;

                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink6") as HyperLink;
                int intId = Convert.ToInt32(hf.Value);

                // تعداد تدارکات
                int intTadarokCount =
                    db.tbProjectPapers.Where(n => n.paAct == 1 && n.paProject == intId && n.paType == 9)
                        .Count();
                hp.ToolTip = " تعداد تدارکات : " + intTadarokCount;


                // بررسی تایید
                var info = db.tbProjectPapers.Where(n => n.paAct == 1 && n.paProject == intId && n.paType == 8);


                foreach (var paper in info)
                {

                    // تایید بودن واحد اصلی
                    var answer = db.tbNazars.Where(n => n.nzType == 10 && n.nzParent == paper.paId && n.nzStatus == 195 && n.nzAct == 1);


                    //----------------- غیر فعال موفقت
                    //if (paper.paEdare == Convert.ToInt32(hf2.Value))
                    //{
                    //    if (answer.Count() > 0)
                    //    {
                    //        hp.Visible = true;
                    //    }
                    //    else
                    //    {
                    //        hp.Visible = false;
                    //    }

                    //}

                }

                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc2({0}); return false;", strItembody[1]));
            }

            if (e.DataColumn.VisibleIndex == 7)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink7") as HyperLink;


                HiddenField hf = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HiddenField3") as HiddenField;
                int intId = Convert.ToInt32(hf.Value);

                // تعداد پاسخ تدارکات
                hp.ToolTip = "تعداد پاسخ تدارکات : " +
                    db.tbProjectPapers.Where(n => n.paAct == 1 && n.paProject == intId && n.paType == 10).Count();


                // بررسی تایید
                var info = db.tbProjectPapers.Where(n => n.paAct == 1 && n.paProject == intId && n.paType == 9);


                if (info.Count() > 0)
                {
                    hp.Visible = true;
                }
                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc3({0}); return false;", strItembody[1]));
            }




        }


        protected void ASPxGridView1_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Delete)
            {

               // DataRow dr = ((DataRowView)(sender as ASPxGridView).GetRow(e.VisibleIndex)).Row;
                if (!SecurityClass.IsAccess(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath), 1))
                {
                    e.Visible = false;
                }
            }


            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Edit)
            {
               // DataRow dr = ((DataRowView)(sender as ASPxGridView).GetRow(e.VisibleIndex)).Row;
                if (!SecurityClass.IsAccess(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath), 3))
                {
                    e.Visible = false;
                }
            }
        }


        protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "letter")
            {
                System.Net.ServicePointManager.ServerCertificateValidationCallback += (se, cert, chain, sslerror) => { return true; };
                ASPxGridView grid = (ASPxGridView)sender;
                string[] x = new string[] { "SanadTypeName", "Nazer1Name", "Nazer2Name", "companyName", "paNumber0", "paDate0", "paPDate", "paNumber", "prTitle", "thIsElhaghie", "prId",
                    "thId", "prVahed", "TechnicalSuvisor", "paType", "ghSdate", "ghEdate" };
                object[] fields = grid.GetRowValues(e.VisibleIndex, x) as object[];

                string SanadType = fields[0].ToString();
                string department1 = fields[1].ToString();
                string department2 = fields[2].ToString();
                string company = fields[3].ToString();
                string paNumber0 = fields[4].ToString();
                var paDate0 = fields[5].ToString();
                var paDate = fields[6].ToString();
                var paNumber = fields[7].ToString();
                var prTitle = fields[8].ToString();
                var isElhaghiye = fields[9].ToString();
                var prId = fields[10].ToString();
                var thId = fields[11].ToString();
                string Nazer1 = fields[12].ToString();
                string Nazer2 = fields[13].ToString();
                string paType = fields[14].ToString();
                string ghSdate = fields[15].ToString();
                string ghEdate = fields[16].ToString();

                string ghCode = "", ghType = "";
                string paNumber1 = "", paDate1 = "", paNumber2 = "", paDate2 = "", paNumber3 = "", paDate3 = "";

                PersianCalendar pc = new PersianCalendar();
                DateTime thisDate = DateTime.Now.AddDays(7);

                BaseClientSymap bs = new BaseClientSymap(Page.User.Identity.Name);
                // BaseClientSymap bs = new BaseClientSymap("m.khanahmadi");
                DataAccessBase db = new DataAccessBase();

                string subject = "پروپوزال", comment = "استعلام پروپوزال - "+prTitle;
                string letterName = "PageEstelamMohtavayi\\porpozal1";
                if (SanadType == "مصوبه هیئت مدیره")
                    letterName = "PageEstelamMohtavayi\\porpozal2";
                if (bool.Parse(isElhaghiye) == true)
                {
                    subject = "قرارداد";
                   
                    letterName = "PageEstelamMohtavayi\\elhaghiye";
                    DataTable dt = db.ReaderText("select top 1 * from tbElhaghie where elProject = " + prId + " order by elId desc");

                    if (dt.Rows.Count > 0)
                    {
                        ghCode = dt.Rows[0]["elgharardad"] != null ? dt.Rows[0]["elgharardad"].ToString() : "";
                        ghType = dt.Rows[0]["elType"] != null ? dt.Rows[0]["elType"].ToString() : "";
                    }
                    comment = "استعلام قرارداد - " + prTitle+" - "+ghCode;
                }
                else
                {
                    DataTable dt = db.ReaderText("select * FROM tbNazar WHERE nzType=10 and nzParent=(select top(1) paId FROM tbProjectPaper where paProject="+thId+" and paType=8 order by paId desc)");

                    if (dt.Rows.Count > 0)
                    {
                        letterName = "PageEstelamMohtavayi\\porpozalEslahi1";
                        paNumber1 = dt.Rows[0]["nzNumber"] != null ? dt.Rows[0]["nzNumber"].ToString() : "";
                        paDate1 = dt.Rows[0]["nzDate"] != null ? CommonClass.ShamsiDate(DateTime.Parse(dt.Rows[0]["nzDate"].ToString()), "/") : "";
                        if (department2 != ""&&dt.Rows.Count>1)
                        {
                            letterName = "PageEstelamMohtavayi\\porpozalEslahi2";
                            paNumber2 = dt.Rows[1]["nzNumber"] != null ? dt.Rows[1]["nzNumber"].ToString() : "";
                            paDate2 = dt.Rows[1]["nzDate"] != null ? CommonClass.ShamsiDate(DateTime.Parse(dt.Rows[1]["nzDate"].ToString()), "/") : "";
                        }

                        //DataTable dt2 = db.ReaderText("select * FROM tbNazar WHERE (nzAct = 1) AND (nzParent = " + prId + ") AND (nzType = 12)");
                        //DataTable dt2 = db.ReaderText("select top 1 * from tbProjectPaper  where paProject ="+thId+" and paAct=1 and paType="+paType+" order by paId desc");
                        DataTable dt2 = db.ReaderText(@"select * from tbNazar where nzParent=( select paId FROM tbProjectPaper where paType=50 and paProject=( select nzId from tbNazar where nzParent =( select top 1 paid FROM tbProjectPaper where paProject=" + thId + " and paType=8 order by paId desc)))");
                        if (dt2.Rows.Count > 0)
                        {
                            paNumber3 = dt2.Rows[0]["nzNumber"] != null ? dt2.Rows[0]["nzNumber"].ToString() : "";
                            paDate3 = dt2.Rows[0]["nzDate"] != null ? CommonClass.ShamsiDate(DateTime.Parse(dt2.Rows[0]["nzDate"].ToString()), "/") : "";
                        }
                    }
                }

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


                var d = new string[] { department1 };
                if (department2 != "")
                    d = new string[] { department1, department2 };


                param1.receivers = bs.GetLetterReceivers(d);
                param1.letComment = comment;

          


                var dic = new Dictionary<string, string>();
                dic.Add("*0*", department1);
                dic.Add("*1*", department2);
                dic.Add("*2*", String.Join("/", paNumber.Split('/').Reverse()));
                dic.Add("*3*", String.Join("/", paDate.Split('/').Reverse()));
                dic.Add("*4*", company);
                dic.Add("*5*", prTitle);
                dic.Add("*6*", String.Join("/", CommonClass.ShamsiDate(thisDate, "/").Split('/').Reverse()));
                dic.Add("*7*", SanadType);
                dic.Add("*8*", String.Join("/", paNumber0.Split('/').Reverse()));
                dic.Add("*9*", String.Join("/", paDate0.Split('/').Reverse()));

                dic.Add("*10*", ghType);
                dic.Add("*51*", String.Join("-", ghCode.Split('-').Reverse()));

                dic.Add("*11*", String.Join("/", paNumber1.Split('/').Reverse()));
                dic.Add("*12*", String.Join("/", paDate1.Split('/').Reverse()));
                dic.Add("*17*", String.Join("/", paNumber3.Split('/').Reverse()));
                dic.Add("*18*", String.Join("/", paDate3.Split('/').Reverse()));

                dic.Add("*14*", String.Join("/", paNumber2.Split('/').Reverse()));
                dic.Add("*15*", String.Join("/", paDate2.Split('/').Reverse()));

                dic.Add("*52*", String.Join("/", ghSdate.Split('/').Reverse()));
                dic.Add("*53*", String.Join("/", ghEdate.Split('/').Reverse()));

                param1.body = new com_gam_secretariat_webservice_complextypes_FileWTO()
                {
                    content = bs.createFile(letterName, dic)
                };
                     param1.subjectIds = bs.GetSubjectIds(subject);
                //var actual = "11112223333";
                var actual = bs.LetterServiceClient.insertLetter(bs.SecurityContextWTOLetterService, param1);
                if (Nazer2 == "")
                      Nazer2 = "-1";

                int result = db.NonQueryTxt(@"INSERT INTO [dbo].[tbGamLetterNumber]([entity],[letterNo],[paProject],[edare],[edare2])
                VALUES('PageEstelamMohtavayi'," + actual + "," + thId + "," + Nazer1 + "," + Nazer2 + ")");

                Response.Write("<script>alert('پیش نویس نامه با موفقیت در سامانه گام ایجاد گردید. شماره نامه : " + actual + "')</script>");
            }
        }
    }
}
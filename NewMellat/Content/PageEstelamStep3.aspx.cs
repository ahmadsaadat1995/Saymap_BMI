using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.IO;
using System.Globalization;
using OfficeAutomationServiceClient.LetterServiceProxy;
using NewMellat.gam;
using System.Text;
using DataAccessLayer;
using System.Data;

namespace NewMellat.Content
{
    public partial class PageEstelamStep3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "ارسال به شرکت ";

            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }
            sourceStep2.SelectParameters["prCode"].DefaultValue = Page.User.Identity.Name;
            if (!IsPostBack)
                ApplyLayout(0);
        }


        protected void ASPxGridView1_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            ApplyLayout(Int32.Parse(e.Parameters));
        }

        void ApplyLayout(int layoutIndex)
        {
            ASPxGridView1.BeginUpdate();
            try
            {
                ASPxGridView1.ClearSort();
                switch (layoutIndex)
                {
                    case 0:
                        //ASPxGridView1.GroupBy(ASPxGridView1.Columns["prTitle"]);

                        break;

                }
            }
            finally
            {
                ASPxGridView1.EndUpdate();
            }
            ASPxGridView1.ExpandAll();
        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "paId")
            {
                HyperLink hp =
                    ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink1") as HyperLink;

            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsToResponse();
        }

        protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "letter")
            {
                System.Net.ServicePointManager.ServerCertificateValidationCallback += (se, cert, chain, sslerror) => { return true; };
                ASPxGridView grid = (ASPxGridView)sender;
                string[] x = new string[] { "IsElhaghieValue", "vahed", "TechnicalSuvisor", "peymankar", "nzId", "PersianStr", "prId", "thId", "prTitle", "Nazer1", "Nazer2" };

                object[] fields = grid.GetRowValues(e.VisibleIndex, x) as object[];

                string IsElhaghieValue = fields[0].ToString();
                string department1 = fields[1].ToString();
                string department2 = fields[2].ToString();
                string company = fields[3].ToString();
                string nzId = fields[4].ToString();
                //  var paDate = fields[5].ToString();

                var prTitle = fields[8].ToString();

                var prId = fields[6].ToString();
                var thId = fields[7].ToString();
                string Nazer1 = fields[9].ToString();
                string Nazer2 = fields[10].ToString();

                string ghCode = "", paNumber = "", paDate = "", paNumber0 = "", paDate0 = "";

                PersianCalendar pc = new PersianCalendar();
                DateTime thisDate = DateTime.Now.AddDays(7);

                BaseClientSymap bs = new BaseClientSymap(Page.User.Identity.Name);
                // BaseClientSymap bs = new BaseClientSymap("m.khanahmadi");
                DataAccessBase db = new DataAccessBase();

                string subject = "پروپوزال", comment = "استعلام پروپوزال - " + prTitle;
                string letterName = "PageEstelamStep3\\porpozal";

                if (IsElhaghieValue == "الحاقیه")
                {
                    subject = "قرارداد";

                    letterName = "PageEstelamStep3\\elhagheye";
                    DataTable dt = db.ReaderText("select top 1 * from tbElhaghie where elProject = " + prId + " order by elId desc");

                    if (dt.Rows.Count > 0)
                    {
                        ghCode = dt.Rows[0]["elgharardad"] != null ? dt.Rows[0]["elgharardad"].ToString() : "";
                        comment = "استعلام قرارداد - " + prTitle + " - " + ghCode;
                    }

                }



                //شماره نامه تاییده ناظر
                DataTable dt0 = db.ReaderText("select * FROM tbNazar WHERE nzType=10 and nzParent=(select top(1) paId FROM tbProjectPaper where paProject=" + thId + "and paType=8 order by paId desc)");
                if (dt0.Rows.Count > 0)
                {
                    DataRow row = dt0.Rows[0];
                    paNumber0 = row["nzNumber"] != null ? row["nzNumber"].ToString() : "";
                    paDate0 = row["nzDate"] != null ? CommonClass.ShamsiDate(DateTime.Parse(row["nzDate"].ToString()), "/") : "";
                }

                // شماره نامه ثبت اولیه
                DataTable dt1 = db.ReaderText("select * FROM tbProjectPaper where paProject=" + thId + " and paType in (73,74) order by paId desc");
                if (dt1.Rows.Count > 0)
                {
                    DataRow row = dt1.Rows[0];
                    paNumber = row["paNumber"] != null ? row["paNumber"].ToString() : "";
                    paDate = row["paDate"] != null ? CommonClass.ShamsiDate(DateTime.Parse(row["paDate"].ToString()), "/") : "";
                }
                //استعلام مجدد
                DataTable dt2 = db.ReaderText(@" select * from tbNazar where nzParent=(select  top 1 paId FROM tbProjectPaper  where paProject in
										(select nzid FROM tbNazar WHERE  nzParent in ( select paid FROM tbProjectPaper  where paProject="+thId+")) order by paId desc)");
                if (dt2.Rows.Count > 0)
                {
                    DataRow row = dt2.Rows[0];
                    paNumber = row["nzNumber"] != null ? row["nzNumber"].ToString() : "";
                    paDate = row["nzDate"] != null ? CommonClass.ShamsiDate(DateTime.Parse(row["nzDate"].ToString()), "/") : "";
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


                var d = new string[] { company };
                //  if (department2 != "")
                //       d = new string[] { department1, department2 };


                param1.receivers = bs.GetLetterReceivers(d);
                param1.letComment = comment;




                var dic = new Dictionary<string, string>();
                dic.Add("*0*", company);
                dic.Add("*1*", String.Join("/", paNumber.Split('/').Reverse()));
                dic.Add("*2*", String.Join("/", paDate.Split('/').Reverse()));
                dic.Add("*3*", prTitle);
                dic.Add("*4*", String.Join("/", paNumber0.Split('/').Reverse()));
                dic.Add("*5*", String.Join("/", paDate0.Split('/').Reverse()));


                dic.Add("*11*", String.Join("-", ghCode.Split('-').Reverse()));

                dic.Add("*10*", String.Join("/", CommonClass.ShamsiDate(thisDate, "/").Split('/').Reverse()));


                param1.body = new com_gam_secretariat_webservice_complextypes_FileWTO()
                {
                    content = bs.createFile(letterName, dic)
                };
                param1.subjectIds = bs.GetSubjectIds(subject);
                //var actual = "11112223333";
                var actual = bs.LetterServiceClient.insertLetter(bs.SecurityContextWTOLetterService, param1);
                if (Nazer2 == "")
                    Nazer2 = "-1";
                if (Nazer1 == "")
                    Nazer1= "-1";

                int result = db.NonQueryTxt(@"INSERT INTO [dbo].[tbGamLetterNumber]([entity],[letterNo],[paProject],[edare],[edare2],[pishId])
                                VALUES('PageEstelamStep3'," + actual + "," + thId + "," + Nazer1 + "," + Nazer2 + ","+nzId+")");

                Response.Write("<script>alert('پیش نویس نامه با موفقیت در سامانه گام ایجاد گردید. شماره نامه : " + actual + "')</script>");
            }
        }
    }
}
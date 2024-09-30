using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.IO;
using System.Globalization;
using NewMellat.gam;
using System.Text;
using DataAccessLayer;
using System.Data;
using OfficeAutomationServiceClient.LetterServiceProxy;

namespace NewMellat.Content
{
    public partial class PageEstelamStep5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "تدارکات - آنالیز قیمت";

            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }
            SqlDataSource1.SelectParameters["prCode"].DefaultValue = Page.User.Identity.Name;
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
                string[] x = new string[] { "IsElhaghieValue", "vahed", "TechnicalSuvisor", "peymankar", "prId", "thId", "prTitle", "nzNumber", "PersianStr", "nzStatus" };

                object[] fields = grid.GetRowValues(e.VisibleIndex, x) as object[];

                string IsElhaghieValue = fields[0].ToString();
                string department1 = fields[1].ToString();
                string department2 = fields[2].ToString();
                string company = fields[3].ToString();
                var prId = fields[4].ToString();
                var thId = fields[5].ToString();
                var prTitle = fields[6].ToString();
                var nzStatus = fields[9].ToString();
             //   string Nazer1 = fields[9].ToString();
             //   string Nazer2 = fields[10].ToString();
                string paNumber0 = fields[7].ToString();
                string paDate0 = fields[8].ToString();
                string ghCode = "", paNumber = "", paDate = "";

                PersianCalendar pc = new PersianCalendar();
                DateTime thisDate = DateTime.Now.AddDays(14);

                BaseClientSymap bs = new BaseClientSymap(Page.User.Identity.Name);
                DataAccessBase db = new DataAccessBase();

                string letterName = "PageEstelamStep5\\porpozal";

                if (IsElhaghieValue == "الحاقیه")
                {
                    letterName = "PageEstelamStep5\\elhagheye";
                    DataTable dt = db.ReaderText("select top 1 * from tbElhaghie where elProject = " + prId + " order by elId desc");

                    if (dt.Rows.Count > 0)
                    {
                        ghCode = dt.Rows[0]["elgharardad"] != null ? dt.Rows[0]["elgharardad"].ToString() : "";
                      //  comment = "استعلام قرارداد - " + prTitle + " - " + ghCode;
                    }
                }

                if (nzStatus == "423") {
                    letterName = "PageEstelamStep5\\noAnswer";
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
										(select nzid FROM tbNazar WHERE  nzParent in ( select paid FROM tbProjectPaper  where paProject=" + thId + ")) order by paId desc)");
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
               
                param1.signers = signers;
                param1.letRegistrarDepId = bs.GetPersonDepartmentsID();


                var d = new string[] { "اداره کل تدارکات" };
               


                param1.receivers = bs.GetLetterReceivers(d);
                param1.letComment = "آنالیز قیمت";




                var dic = new Dictionary<string, string>();
                dic.Add("*2*", company);
                dic.Add("*0*", String.Join("/", paNumber.Split('/').Reverse()));
                dic.Add("*1*", String.Join("/", paDate.Split('/').Reverse()));
                dic.Add("*3*", prTitle);
                dic.Add("*4*", String.Join("-", ghCode.Split('-').Reverse()));
                dic.Add("*5*", String.Join("/", paNumber0.Split('/').Reverse()));
                dic.Add("*6*", String.Join("/", paDate0.Split('/').Reverse()));
                dic.Add("*7*", department2!=""?department2:department1);
                dic.Add("*8*", String.Join("/", CommonClass.ShamsiDate(thisDate, "/").Split('/').Reverse()));


                param1.body = new com_gam_secretariat_webservice_complextypes_FileWTO()
                {
                    content = bs.createFile(letterName, dic)
                };
                param1.subjectIds = bs.GetSubjectIds("آنالیز قیمت");
                //var actual = "11112223333";
                var actual = bs.LetterServiceClient.insertLetter(bs.SecurityContextWTOLetterService, param1);
                // if (Nazer2 == "")
                //      Nazer2 = "-1";

                int result = db.NonQueryTxt(@"INSERT INTO [dbo].[tbGamLetterNumber]([entity],[letterNo],[paProject])
                                VALUES('PageEstelamStep5'," + actual + "," + thId +  ")");

                Response.Write("<script>alert('پیش نویس نامه با موفقیت در سامانه گام ایجاد گردید. شماره نامه : " + actual + "')</script>");
   
            }
        }
    }
}
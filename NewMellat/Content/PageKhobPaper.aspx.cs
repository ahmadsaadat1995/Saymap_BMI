using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NewMellat.gam;
using System.Text;
using DataAccessLayer;
using System.Data;
using OfficeAutomationServiceClient.LetterServiceProxy;
using System.Globalization;
using DevExpress.Web;
using System.Text.RegularExpressions;

namespace NewMellat.Content
{
    public partial class PageKhobPaper : System.Web.UI.Page
    {
        NewMellatEntities db = new NewMellatEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PersianCalendar1.Date = DateTime.Now;
            }



        }

        protected void ASPxGridView1_DataBound(object sender, EventArgs e)
        {

        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            try
            {
                if (e.DataColumn.FieldName == "paDate")
                {
                    Label lb =
                        ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label1") as Label;
                    lb.Text = CommonClass.ShamsiDate(Convert.ToDateTime(lb.Text)).Insert(4, "/").Insert(7, "/");
                }
            }
            catch { }
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            sourcePages.InsertParameters["paDate"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
            sourcePages.Insert();
            ASPxGridView1.DataBind();

            int intId = Convert.ToInt32(Request.QueryString["project"]);

            if (Request.QueryString["type"] == "101")
            {
                var info = db.tbProjects.SingleOrDefault(n => n.prId == intId);

                info.prKhobreganStatusMosavab = 1;
                db.SaveChanges();
            }
            else if (Request.QueryString["type"] == "102")
            {
                var info = db.tbProjects.SingleOrDefault(n => n.prId == intId);

                info.prKhobreganStatusMosavab = 2;
                db.SaveChanges();
            }


            RadNotification1.Show("نامه جدید با موفقیت به ثبت رسید");

        }

        protected void ASPxGridView1_RowCommand(object sender, ASPxGridViewRowCommandEventArgs e)
        {
             if (e.CommandArgs.CommandName == "letter")
            {
                System.Net.ServicePointManager.ServerCertificateValidationCallback += (se, cert, chain, sslerror) => { return true; };
                ASPxGridView grid = (ASPxGridView)sender;
                string[] x = new string[] { "paNumber", "paDate", "paBody" };

                object[] fields = grid.GetRowValues(e.VisibleIndex, x) as object[];

                string paNumber = fields[0].ToString();
                string paDate = fields[1].ToString();
                string paBody = fields[2].ToString();

                Regex r = new Regex(@"\d{2}/\d{2}/\d{2}");

                var paBodyRev = r.Replace(paBody, new MatchEvaluator(ConvertDateFormat));

                PersianCalendar pc = new PersianCalendar();
                DateTime thisDate = DateTime.Now.AddDays(7);

                BaseClientSymap bs = new BaseClientSymap(Page.User.Identity.Name);
                DataAccessBase db = new DataAccessBase();

                string letterName = "PageKhobPaper\\end";

                string prId = Request.QueryString["project"].ToString();

                DataTable dt1 = db.ReaderText(@"select p.* ,i1.infTitle as nazer1,i2.infTitle as nazer2
                      from  tbProjects as p Left Join prInformation as i1 On p.prVahed = i1.infId
					  Left Join prInformation as i2 On p.TechnicalSuvisor = i2.infId where prId=" + prId);
                 DataRow row = dt1.Rows[0];
                 string dep1 = row["nazer1"].ToString();
                 string dep2=row["nazer2"] != null ? row["nazer2"].ToString() : "";
                 string prTitle = row["prTitle"].ToString();


                 com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO[] signers = new com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO[1];
                 signers[0] = new com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO() { personId = bs.pIdHadimanesh, departmentId = bs.depIdHadimanesh };
                 com_gam_secretariat_webservice_complextypes_LetterWTO param1 = new com_gam_secretariat_webservice_complextypes_LetterWTO();
                 param1.letAccessType = "1";
                 param1.letDocTypeId = bs.GetDocTypeId();
                 param1.letPriorityId = bs.GetPriorityId();
                 param1.letTransfer = bs.TransferType;

                 param1.signers = signers;
                 param1.letRegistrarDepId = bs.GetPersonDepartmentsID();

                 var d = new string[] { dep1 };
                 if (dep2 != "")
                     d = new string[] { dep1, dep2 };
                 param1.receivers = bs.GetLetterReceivers(d);
                 param1.letComment = "استعلام اختتام - " + prTitle;

                 var dic = new Dictionary<string, string>();

                 dic.Add("*0*", dep1);
                 dic.Add("*6*", dep2);
                 dic.Add("*1*", String.Join("/", paNumber.Split('/').Reverse()));
                 dic.Add("*2*", String.Join("/", CommonClass.ShamsiDate(DateTime.Parse(paDate), "/").Split('/').Reverse()));
                 
                 dic.Add("*3*", prTitle);

                 dic.Add("*4*", paBodyRev);
                 dic.Add("*5*", String.Join("/", CommonClass.ShamsiDate(thisDate, "/").Split('/').Reverse()));

                 param1.body = new com_gam_secretariat_webservice_complextypes_FileWTO()
                 {
                     content = bs.createFile(letterName, dic)
                 };
                 param1.subjectIds = bs.GetSubjectIds("اختتام پروژه");

                 var actual = bs.LetterServiceClient.insertLetter(bs.SecurityContextWTOLetterService, param1);

                 Response.Write("<script>alert('پیش نویس نامه با موفقیت در سامانه گام ایجاد گردید. شماره نامه : " + actual + "')</script>");

            }
        }

        static string ConvertDateFormat(Match m)
        {
            //var mydate = DateTime.Parse(m.Value);
            return String.Join("/", m.Value.Split('/').Reverse());
        }
    }
}
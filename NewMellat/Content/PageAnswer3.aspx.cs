using DevExpress.Web;
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

namespace NewMellat.Content
{
    public partial class PageAnswer3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }

      


        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {

            if (e.DataColumn.FieldName == "nzDate")
            {
                Label lb =
                   ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label12") as
                       Label;

                try
                {
                    lb.Text = CommonClass.ShamsiDate(DateTime.Parse(lb.Text)).Insert(4, "/").Insert(7, "/");
                }
                catch (Exception)
                {
                    lb.Text = "";
                }
            }


        


        }

        NewMellatEntities db = new NewMellatEntities();

        protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if(e.CommandArgs.CommandName=="ok")
            {
                var nzId = Convert.ToInt32(e.CommandArgs.CommandArgument);
                var info = db.tbNazars.SingleOrDefault(n => n.nzId == nzId);
                info.nzStatus = 195;
                db.SaveChanges();
                ASPxGridView1.DataBind();
            }


            if (e.CommandArgs.CommandName == "nok")
            {
                var nzId = Convert.ToInt32(e.CommandArgs.CommandArgument);
                var info = db.tbNazars.SingleOrDefault(n => n.nzId == nzId);
                info.nzStatus = 196;
                db.SaveChanges();
                ASPxGridView1.DataBind();
            }

            else if (e.CommandArgs.CommandName == "letter1")
            {
                ASPxGridView grid = (ASPxGridView)sender;
                string[] x = new string[] { "nzNumber", "nzDate","nzId"};

                object[] fields = grid.GetRowValues(e.VisibleIndex, x) as object[];

                string paNumber = fields[0].ToString();
                string paDate = CommonClass.ShamsiDate(DateTime.Parse(fields[1].ToString()), "/");
                string nzId = fields[2].ToString();

                string prId = Request.QueryString["id"].ToString();
                string type = Request.QueryString["type"].ToString() == "3000" ? "سند نیازمندیها" : "پروتوتایپ";
                string  paNumber0 = "", paDate0 = "";

                PersianCalendar pc = new PersianCalendar();
                DateTime thisDate = DateTime.Now.AddDays(7);

                BaseClientSymap bs = new BaseClientSymap(Page.User.Identity.Name);
                DataAccessBase db = new DataAccessBase();

                string letterName = "PageReval\\sherkat";


                DataTable dt1 = db.ReaderText(@"select prTitle,prVahed,prPeymankar,inf1.infTitle as    vahed,inf2.infTitle as peymankar
                    from tbProjects join prInformation as inf1 on inf1.infId=tbProjects.prVahed 
				                    join prInformation as inf2 on inf2.infId=tbProjects.prPeymankar
                    where prId="+prId);
               
                    DataRow row = dt1.Rows[0];
                    string prTitle = row["prTitle"].ToString();
                    string vahed = row["vahed"].ToString();
                    string company = row["peymankar"].ToString();


                    DataTable dt2 = db.ReaderText(@"SELECT top 1  nzNumber, nzDate FROM tbNazar WHERE (nzAct = 1) AND (nzParent = "+nzId+") AND (nzType =4001) order by nzid desc");
                if (dt2.Rows.Count > 0)
                {
                    DataRow row1 = dt2.Rows[0];
                    paNumber0 = row1["nzNumber"] != null ? row1["nzNumber"].ToString() : "";
                    paDate0 = row1["nzDate"] != null ? CommonClass.ShamsiDate(DateTime.Parse(row1["nzDate"].ToString()), "/") : "";
                   
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

                var d = new string[] { company };
                param1.receivers = bs.GetLetterReceivers(d);
                param1.letComment = type+" - " + prTitle;

                var dic = new Dictionary<string, string>();
                dic.Add("*0*", company);
                dic.Add("*1*", type);
                dic.Add("*2*", String.Join("/", paNumber.Split('/').Reverse()));
                dic.Add("*3*", String.Join("/", paDate.Split('/').Reverse()));               
                dic.Add("*4*", prTitle);
                dic.Add("*5*", String.Join("/", paNumber0.Split('/').Reverse()));
                dic.Add("*6*", String.Join("/", paDate0.Split('/').Reverse()));               
                dic.Add("*7*", vahed);
                dic.Add("*8*", String.Join("/", CommonClass.ShamsiDate(thisDate, "/").Split('/').Reverse()));

                param1.body = new com_gam_secretariat_webservice_complextypes_FileWTO()
                {
                    content = bs.createFile(letterName, dic)
                };
                param1.subjectIds = bs.GetSubjectIds("سند نیازمندی های پروژه (SRS)");

                var actual = bs.LetterServiceClient.insertLetter(bs.SecurityContextWTOLetterService, param1);
                            
                Response.Write("<script>alert('پیش نویس نامه با موفقیت در سامانه گام ایجاد گردید. شماره نامه : " + actual + "')</script>");

            }
            else if (e.CommandArgs.CommandName == "letter2")
            {
                ASPxGridView grid = (ASPxGridView)sender;
                string[] x = new string[] { "nzNumber", "nzDate", "nzId" };

                object[] fields = grid.GetRowValues(e.VisibleIndex, x) as object[];

                string paNumber = fields[0].ToString();
                string paDate = CommonClass.ShamsiDate(DateTime.Parse(fields[1].ToString()), "/");
                string nzId = fields[2].ToString();

                string prId = Request.QueryString["id"].ToString();
                string type = Request.QueryString["type"].ToString() == "3000" ? "سند نیازمندیها" : "پروتوتایپ";
                string paNumber0 = "", paDate0 = "";

                PersianCalendar pc = new PersianCalendar();
                DateTime thisDate = DateTime.Now.AddDays(7);

                BaseClientSymap bs = new BaseClientSymap(Page.User.Identity.Name);
                DataAccessBase db = new DataAccessBase();

                string letterName = "PageReval\\nazer";


                DataTable dt1 = db.ReaderText(@"select prTitle,prVahed,prPeymankar,inf1.infTitle as    vahed,inf2.infTitle as peymankar
                    from tbProjects join prInformation as inf1 on inf1.infId=tbProjects.prVahed 
				                    join prInformation as inf2 on inf2.infId=tbProjects.prPeymankar
                    where prId=" + prId);

                DataRow row = dt1.Rows[0];
                string prTitle = row["prTitle"].ToString();
                string vahed = row["vahed"].ToString();
                string company = row["peymankar"].ToString();


                DataTable dt2 = db.ReaderText(@"SELECT top 1  nzNumber, nzDate FROM tbNazar WHERE (nzAct = 1) AND (nzParent = " + nzId + ") AND (nzType =4001) order by nzid desc");
                if (dt2.Rows.Count > 0)
                {
                    DataRow row1 = dt2.Rows[0];
                    paNumber0 = row1["nzNumber"] != null ? row["nzNumber"].ToString() : "";
                    paDate0 = row["nzDate"] != null ? CommonClass.ShamsiDate(DateTime.Parse(row["nzDate"].ToString()), "/") : "";

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

                var d = new string[] { vahed };
                param1.receivers = bs.GetLetterReceivers(d);
                param1.letComment = type + " - " + prTitle;

                var dic = new Dictionary<string, string>();
                dic.Add("*0*", vahed);
                dic.Add("*1*", type);
                dic.Add("*2*", String.Join("/", paNumber.Split('/').Reverse()));
                dic.Add("*3*", String.Join("/", paDate.Split('/').Reverse()));
                dic.Add("*5*", prTitle);
               
                dic.Add("*4*", company);
                dic.Add("*6*", String.Join("/", CommonClass.ShamsiDate(thisDate, "/").Split('/').Reverse()));
                param1.body = new com_gam_secretariat_webservice_complextypes_FileWTO()
                {
                    content = bs.createFile(letterName, dic)
                };
                param1.subjectIds = bs.GetSubjectIds("سند نیازمندی های پروژه (SRS)");

                var actual = bs.LetterServiceClient.insertLetter(bs.SecurityContextWTOLetterService, param1);

                Response.Write("<script>alert('پیش نویس نامه با موفقیت در سامانه گام ایجاد گردید. شماره نامه : " + actual + "')</script>");

            }
        }
    }
}
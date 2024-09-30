using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using NewMellat.gam;
using System.Text;
using DataAccessLayer;
using System.Data;
using OfficeAutomationServiceClient.LetterServiceProxy;
using System.Globalization;

namespace NewMellat.Content
{
    public partial class PageEstelamVahed : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!SecurityClass.IsAccess(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath), 2))
            {
                ASPxButton1.Enabled = false;

            }

            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }


            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "استعلام سند تصویر کلی کسب و کار";

            if (!IsPostBack)
            {
                PersianCalendar1.Date = DateTime.Now;
            }



            sourceVahed.SelectParameters["prCode"].DefaultValue = Page.User.Identity.Name;
            sourceEstelam.SelectParameters["prCode"].DefaultValue = Page.User.Identity.Name;
            sourceProjects3.SelectParameters["prCode"].DefaultValue = Page.User.Identity.Name;
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            if (drpProjects.Value.ToString() != "-1")
            {
                sourceEstelam.InsertParameters["esVahed"].DefaultValue = tokenVahed.Value.ToString();
                sourceEstelam.Insert();


                ASPxGridView1.DataBind();

                if (!string.IsNullOrEmpty(txtShenase.Text))
                {
                    sourcePaper.InsertParameters["paDate"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
                    sourcePaper.Insert();
                }



                foreach (Telerik.Web.UI.UploadedFile file in RadUpload1.UploadedFiles)
                {

                    tbFile newFile = new tbFile();
                    newFile.fiAct = 1;

                    byte[] fileData = new byte[file.InputStream.Length];
                    file.InputStream.Read(fileData, 0, (int)file.InputStream.Length);
                    newFile.fiData = fileData;



                    newFile.fiDate = DateTime.Now;
                    newFile.fiExt = Path.GetFileName(file.FileName);
                    newFile.fiParent = Convert.ToInt32(drpProjects.Value.ToString());
                    newFile.fiTitle = drpProjects.Value.ToString();
                    newFile.fiType = 2;
                    db.tbFiles.Add(newFile);
                    db.SaveChanges();
                }



                try
                {
                    // به روز رسانی پروژه
                    int intId = Convert.ToInt32(HiddenField1.Value);
                    var estelam = db.tbEstelamVaheds.SingleOrDefault(n => n.esId == intId);
                    var project = db.tbProjects.SingleOrDefault(n => n.prId == estelam.esProject.Value);
                    project.prISEstelam = 1;
                    db.SaveChanges();


                }
                catch (Exception)
                {

                }

                RadNotification1.Show("اطلاعات با موفقیت به ثبت رسید");
                drpProjects.DataBind();
            }
            else
            {
                RadNotification1.Show("پروژه ای انتخاب نشده است");
            }


        }

        NewMellatEntities db = new NewMellatEntities();

        protected void sourceEstelam_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            try
            {
                int intId = (int)e.Command.Parameters["@esId"].Value;
                HiddenField1.Value = intId.ToString();
            }
            catch (Exception)
            {


            }
        }

        protected void drpProjects_DataBound(object sender, EventArgs e)
        {
            drpProjects.Items.Insert(0, new ListEditItem("انتخاب", "-1"));
            drpProjects.SelectedIndex = 0;
        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.VisibleIndex == 4)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink1") as HyperLink;
                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc({0}); return false;", strItembody[1]));
            }

            if (e.DataColumn.VisibleIndex == 5)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink2") as HyperLink;
                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc2({0}); return false;", strItembody[1]));
            }




            if (e.DataColumn.VisibleIndex == 6)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink3") as HyperLink;
                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc3({0}); return false;", strItembody[1]));
            }
        }

        protected void ASPxGridView1_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Delete)
            {

             //   DataRow dr = ((DataRowView)(sender as ASPxGridView).GetRow(e.VisibleIndex)).Row;
                if (!SecurityClass.IsAccess(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath), 1))
                {
                    e.Visible = false;
                }
            }


            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Edit)
            {
                DataRow dr = ((DataRowView)(sender as ASPxGridView).GetRow(e.VisibleIndex)).Row;
                if (!SecurityClass.IsAccess(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath), 3))
                {
                    e.Visible = false;
                }
            }
        }

        protected void ASPxGridView1_RowCommand(object sender, ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "bk")
            {
                int esId = Convert.ToInt32(e.CommandArgs.CommandArgument);
                var estelam = db.tbEstelamVaheds.SingleOrDefault(n => n.esId == esId);

                // به روز رسانی پروژه
                var project = db.tbProjects.SingleOrDefault(n => n.prId == estelam.esProject);
                project.prISEstelam = 0;
                db.SaveChanges();

                // حذف استعلام
                db.tbEstelamVaheds.Remove(estelam);
                db.SaveChanges();
                DataBind();
            }
            else if (e.CommandArgs.CommandName == "letter")
            {
                System.Net.ServicePointManager.ServerCertificateValidationCallback += (se, cert, chain, sslerror) => { return true; };
                ASPxGridView grid = (ASPxGridView)sender;
                string[] x = new string[] { "prTitle", "vahed", "esProject" };

                object[] fields = grid.GetRowValues(e.VisibleIndex, x) as object[];

                string prTitle = fields[0].ToString();
                string vahed = fields[1].ToString();
                string paId = fields[2].ToString();

                PersianCalendar pc = new PersianCalendar();
                DateTime thisDate = DateTime.Now.AddDays(7);

                BaseClientSymap bs = new BaseClientSymap(Page.User.Identity.Name);
                DataAccessBase db = new DataAccessBase();

                string letterName = "PageEstelamVahed\\estelam";


                DataTable dt1 = db.ReaderText(@"select * from  tbProjectPaper where paType=1 and paProject=" + paId);

                DataRow row = dt1.Rows[0];
                string paNumber = row["paNumber"] != null ? row["paNumber"].ToString() : "";
                string paDate = row["paDate"] != null ? CommonClass.ShamsiDate(DateTime.Parse(row["paDate"].ToString()), "/") : "";
                string paBpdy = row["paBody"] != null ? row["paBody"].ToString() : "";


                com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO[] signers = new com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO[1];
                signers[0] = new com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO() { personId = bs.pIdHadimanesh, departmentId = bs.depIdHadimanesh };
                com_gam_secretariat_webservice_complextypes_LetterWTO param1 = new com_gam_secretariat_webservice_complextypes_LetterWTO();
                param1.letAccessType = "1";
                param1.letDocTypeId = bs.GetDocTypeId();
                param1.letPriorityId = bs.GetPriorityId();
                param1.letTransfer = bs.TransferType;

                param1.signers = signers;
                param1.letRegistrarDepId = bs.GetPersonDepartmentsID();

                var d = new string[] { "اداره کل زیرساخت و نرم افزار" };
                param1.receivers = bs.GetLetterReceivers(d);
                param1.letComment = "سند تصویر کلی کسب و کار - " + prTitle;

                var dic = new Dictionary<string, string>();
               
               
                dic.Add("*0*", String.Join("/", paNumber.Split('/').Reverse()));
                dic.Add("*1*", String.Join("/", paDate.Split('/').Reverse()));
                dic.Add("*2*", vahed);
                dic.Add("*3*", prTitle);
                dic.Add("*4*", String.Join("/", CommonClass.ShamsiDate(thisDate, "/").Split('/').Reverse()));

                param1.body = new com_gam_secretariat_webservice_complextypes_FileWTO()
                {
                    content = bs.createFile(letterName, dic)
                };
                param1.subjectIds = bs.GetSubjectIds("سند تصویرکلی کسب و کار");

                var actual = bs.LetterServiceClient.insertLetter(bs.SecurityContextWTOLetterService, param1);

                Response.Write("<script>alert('پیش نویس نامه با موفقیت در سامانه گام ایجاد گردید. شماره نامه : " + actual + "')</script>");

            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace NewMellat.Content
{
    public partial class PagetarhPishnehadi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }
            if (!SecurityClass.IsAccess(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath), 2))
            {
                ASPxButton1.Enabled = false;
            }

            sourceProjects0.SelectParameters["prCode"].DefaultValue = Page.User.Identity.Name;
            sourceTarh.SelectParameters["prCode"].DefaultValue = Page.User.Identity.Name;

            PersianCalendar pc = new PersianCalendar();
            if (!IsPostBack)
            {
                int year = pc.GetYear(DateTime.Now)+1;
                for (int i = 1380; i <= year; i++)
                {
                    drpYear.Items.Add(new ListEditItem(i.ToString(), i.ToString()));
                }

                for (int i = 0; i <= 100; i++)
                {
                    drpYear2.Items.Add(new ListEditItem(i.ToString(), i.ToString()));
                    drpYear3.Items.Add(new ListEditItem(i.ToString(), i.ToString()));
                }


                for (int i = 0; i <= 30; i++)
                {
                    drpMonth2.Items.Add(new ListEditItem(i.ToString(), i.ToString()));
                    drpMonth3.Items.Add(new ListEditItem(i.ToString(), i.ToString()));

                }

                drpMonth2.SelectedIndex = 0;
                drpYear2.SelectedIndex = 0;

                drpMonth3.SelectedIndex = 0;
                drpYear3.SelectedIndex = 0;
            }




            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "طرح پیشنهادی";

            if (!IsPostBack)
            {
                PersianCalendar1.Date = DateTime.Now;
            }



        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            var fileCount = RadUpload1.UploadedFiles.Count;


            if (fileCount > 0)
            {
                sourceTarh.InsertParameters["thModatPosh"].DefaultValue = drpYear3.Value + "," + drpMonth3.Value;
                sourceTarh.InsertParameters["thModatTolid"].DefaultValue = drpYear2.Value + "," + drpMonth2.Value;

                sourceTarh.Insert();

                ASPxGridView1.DataBind();




                foreach (Telerik.Web.UI.UploadedFile file in RadUpload1.UploadedFiles)
                {

                    tbFile newFile = new tbFile();
                    newFile.fiAct = 1;

                    byte[] fileData = new byte[file.InputStream.Length];
                    file.InputStream.Read(fileData, 0, (int)file.InputStream.Length);
                    newFile.fiData = fileData;



                    newFile.fiDate = DateTime.Now;
                    newFile.fiExt = Path.GetFileName(file.FileName);
                    newFile.fiParent = Convert.ToInt32(HiddenField1.Value);
                    newFile.fiType = 6;
                    db.tbFiles.Add(newFile);
                    db.SaveChanges();
                }


                // ثبت نامه
                sourcePaper.InsertParameters["paDate"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
                sourcePaper.Insert();

                // به روز رسانی جدول خبرگان
                int intProjectId = Convert.ToInt32(drpProjects.Value);
                var khobregan = db.tbKhbregans.Where(n => n.khProject == intProjectId);
                foreach (var item in khobregan)
                {
                    var details = db.tbKhbregans.SingleOrDefault(n => n.khId == item.khId);
                    details.khIsTarh = 1;

                }
                db.SaveChanges();

                // به روز رسانی پروژه prEstelamIsSubmit

                var project = db.tbProjects.SingleOrDefault(n => n.prId == intProjectId);
                project.prEstelamIsSubmit = 1;
                //  project.prIsEstelamMohtavayi = 1;
                project.prIsTarh = 1;
                db.SaveChanges();


                drpProjects.DataBind();


                //reset texbox
                txtShenase.Text = string.Empty;
                txtHajmPosh.Text = String.Empty;
                txtHajmTolid.Text = string.Empty;
                txtNumber.Text = String.Empty;
                txtPricePosh.Text = String.Empty;
                txtPriceTolid.Text = String.Empty;
                ASPxMemo1.Text = String.Empty;
                ASPxMemo2.Text = String.Empty;

                RadNotification1.Show("طرح پیشنهادی جدید با موفقیت به ثبت رسید");

                Response.Redirect(@"~\content\PagetarhPishnehadi.aspx");
            }
            else
            {
                RadNotification1.Show("فایل ضمیمه انتخاب نشده است");

            }
        }

        NewMellatEntities db = new NewMellatEntities();

        protected void sourceTarh_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            int intId = (int)e.Command.Parameters["@thId"].Value;
            HiddenField1.Value = intId.ToString();
        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.VisibleIndex == 3)
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label26") as Label;
                lb.Text = Persia.Number.ConvertToPersian(lb.Text);
            }

            if (e.DataColumn.VisibleIndex == 4)
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label27") as Label;
                lb.Text = Persia.Number.ConvertToPersian(lb.Text);
            }

            if (e.DataColumn.VisibleIndex == 7)
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label28") as Label;
                lb.Text = Persia.Number.ConvertToPersian(lb.Text);
            }



            if (e.DataColumn.FieldName == "paDate")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label33") as Label;
                try
                {
                    lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;
                }
                catch
                {

                }
            }



            if (e.DataColumn.VisibleIndex == 9)
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label29") as Label;
                try
                {
                    lb.Text = CommonClass.NumberWithGroup(Convert.ToInt64(lb.Text));
                }
                catch
                {

                }
            }

            if (e.DataColumn.VisibleIndex == 10)
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label30") as Label;
                try
                {
                    lb.Text = CommonClass.NumberWithGroup(Convert.ToInt64(lb.Text));
                }
                catch
                {

                }
            }


            if (e.DataColumn.VisibleIndex == 11)
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label31") as Label;
                lb.Text = Persia.Number.ConvertToPersian(lb.Text);
            }
            if (e.DataColumn.VisibleIndex == 12)
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label32") as Label;
                lb.Text = Persia.Number.ConvertToPersian(lb.Text);
            }




            if (e.DataColumn.VisibleIndex == 16)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink2") as HyperLink; string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc({0}); return false;", strItembody[1]));
            }


            if (e.DataColumn.VisibleIndex == 15)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink1") as HyperLink;
                string[] strItembody = hp.NavigateUrl.Split('=');
                //  hp.Attributes.Add("onclick", string.Format("loadDoc2({0}); return false;", strItembody[1]));
            }


        }

        protected void drpMonth2_SelectedIndexChanged(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append(drpYear2.Value);
            sb.Append(" ماه و ");
            sb.Append(drpMonth2.Value);
            sb.Append(" روز ");
            Label23.Text = sb.ToString();
        }

        protected void drpYear2_SelectedIndexChanged(object sender, EventArgs e)
        {

            StringBuilder sb = new StringBuilder();

            sb.Append(drpYear2.Value);
            sb.Append(" ماه و ");
            sb.Append(drpMonth2.Value);
            sb.Append(" روز ");
            Label23.Text = sb.ToString();

        }

        protected void drpMonth3_SelectedIndexChanged(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append(drpYear3.Value);
            sb.Append(" ماه و ");
            sb.Append(drpMonth3.Value);
            sb.Append(" روز ");
            Label24.Text = sb.ToString();
        }

        protected void drpYear3_SelectedIndexChanged(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append(drpYear3.Value);
            sb.Append(" ماه و ");
            sb.Append(drpMonth3.Value);
            sb.Append(" روز ");
            Label24.Text = sb.ToString();
        }

        protected void ASPxGridView1_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Delete)
            {

                if (!SecurityClass.IsAccess(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath), 1))
                {
                    e.Visible = false;
                }
            }

            //
            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Edit)
            {
                if (!SecurityClass.IsAccess(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath), 3))
                {
                    e.Visible = false;
                }
            }
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsxToResponse();
        }

        protected void drpProjects_DataBound(object sender, EventArgs e)
        {
            drpProjects.Items.Insert(0, new ListEditItem("انتخاب", "-1"));
            drpProjects.SelectedIndex = 0;
        }
    }
}
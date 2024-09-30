using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace NewMellat.Content
{
    public partial class PageReval : System.Web.UI.Page
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


            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "روال اجرایی";

            if (!IsPostBack)
            {
                PersianCalendar1.Date = DateTime.Now;


            }


            sourceReval.SelectParameters["prCode"].DefaultValue = Page.User.Identity.Name;
            sourceProjects.SelectParameters["prCode"].DefaultValue = Page.User.Identity.Name;


        }


        NewMellatEntities db = new NewMellatEntities();
        protected void ASPxButton1_Click(object sender, EventArgs e)
        {

            // کنترل موجودیت
            var prId = Convert.ToInt32(drpProjects.Value);
            string strSanadType = drpDocType.Value.ToString();
            var info = db.tbRevals.Where(n => n.reAct == 1 && n.reProject == prId && n.reSanadType == strSanadType);




            //------------------

            if (!info.Any())
            {
                sourceReval.Insert();
            }

            //sourcePaper.InsertParameters["paDate"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
            //sourcePaper.Insert();

            sourceNazar.InsertParameters["nzDate"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
            sourceNazar.Insert();




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
                //   newFile.fiTitle = txtTitle.Text;
                newFile.fiType = 5;
                db.tbFiles.Add(newFile);
                db.SaveChanges();
            }



            ASPxGridView1.DataBind();
            RadNotification1.Show("اطلاعات با موفقیت به ثبت رسید");

        }
        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {

                try
                {
                    Label lbOlaviat = (Label)row.FindControl("Label19");
                    int intOlviat = Convert.ToInt32(lbOlaviat.Text);
                    lbOlaviat.Text = db.prInformations.SingleOrDefault(n => n.infId == intOlviat).infTitle;
                }
                catch { }



                try
                {
                    Label lbOlaviat = (Label)row.FindControl("Label29");
                    int intOlviat = Convert.ToInt32(lbOlaviat.Text);
                    lbOlaviat.Text = db.prInformations.SingleOrDefault(n => n.infId == intOlviat).infTitle;
                }
                catch { }

                try
                {
                    Label lbPeymankar = (Label)row.FindControl("Label23");
                    int intPeymankar = Convert.ToInt32(lbPeymankar.Text);
                    lbPeymankar.Text = db.prInformations.SingleOrDefault(n => n.infId == intPeymankar).infTitle;
                }
                catch { }


                try
                {
                    Label lb1 = (Label)row.FindControl("Label20");
                    lb1.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb1.Text)).Simple;
                }
                catch
                {
                }

                try
                {
                    Label lb1 = (Label)row.FindControl("Label21");
                    lb1.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb1.Text)).Simple;
                }
                catch { }

                try
                {
                    Label lb1 = (Label)row.FindControl("Label22");
                    lb1.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb1.Text)).Simple;
                }
                catch { }


            }
        }



        protected string GetStatus(string stat)
        {
            string ret = "";
            switch (stat)
            {
                case "195":
                    ret = "تایید";
                    break;

                case "196":
                    ret = "عدم تایید";
                    break;

            }
            return ret;
        }


        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {

            if (e.DataColumn.FieldName == "reSanadType")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label31") as Label;
                if (lb.Text == "3000")
                {
                    lb.Text = "سند نیازمندیها";
                }
                else if (lb.Text == "4000")
                {
                    lb.Text = "پروتوتایپ";
                }
            }



            if (e.DataColumn.VisibleIndex == 5)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink2") as HyperLink;
                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc2({0}); return false;", strItembody[1]));
            }


            if (e.DataColumn.VisibleIndex == 4)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink1") as HyperLink;
                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc({0}); return false;", strItembody[1]));
            }


            // ستون پاسخ
            if (e.DataColumn.VisibleIndex == 8)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink4") as HyperLink;



                HiddenField hf2 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HiddenField4") as HiddenField;

                hp.NavigateUrl += "&type=" + hf2.Value; //+ "&sanadType=" + hf.Value;

            }



            if (e.DataColumn.VisibleIndex == 11)
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label30") as Label;

                try
                {
                    lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text).AddDays(7)).Simple;
                }
                catch { }
            }

            if (e.DataColumn.FieldName == "mosSRS")
            {

            }


            if (e.DataColumn.VisibleIndex == 11)
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label35") as Label;

                try
                {
                    lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;
                }
                catch { }
            }


        }

        protected void sourceReval_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            int intId = (int)e.Command.Parameters["@reId"].Value;
            HiddenField1.Value = intId.ToString();

        }

        protected void drpProjects_DataBound(object sender, EventArgs e)
        {
            drpProjects.Items.Insert(0, new ListEditItem("انتخاب", "-1"));
            drpProjects.SelectedIndex = 0;
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


        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {

            ASPxGridViewExporter1.WriteXlsToResponse();
        }



        protected void GridView22_RowDataBound(object sender, GridViewRowEventArgs e)
        {


            try
            {
                Label lb = (Label)e.Row.FindControl("Label1");
                lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;
            }
            catch { }
        }

        protected void GridView222_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                Label lb = (Label)e.Row.FindControl("Label1");

                if (lb.Text == "195")
                {
                    lb.Text = "تایید";
                }

                if (lb.Text == "196")
                {
                    lb.Text = "عدم تایید";
                }
            }
            catch { }
        }

        protected void GridView444_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                Label lb = (Label)e.Row.FindControl("Label1");
                lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;
            }
            catch { }
        }

        protected void GridView22345_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                Label lb = (Label)e.Row.FindControl("Label1");
                lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text).AddDays(7)).Simple;
            }
            catch { }
        }
    }
}
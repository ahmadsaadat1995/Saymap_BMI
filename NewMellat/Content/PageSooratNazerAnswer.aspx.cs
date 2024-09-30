using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace NewMellat.Content
{
    public partial class PageSooratNazerAnswer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }
            sourceNazer.SelectParameters["prCode"].DefaultValue = Page.User.Identity.Name;

            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "پاسخ ناظر";
        }


        NewMellatEntities db = new NewMellatEntities();

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            //if (e.DataColumn.FieldName == "paDate")
            if (e.DataColumn.VisibleIndex == 9)
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label3") as Label;

                try
                {
                   // lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;

                }
                catch { }
            }



            if (e.DataColumn.VisibleIndex == 14)
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label4") as Label;

                try
                {
                    DateTime dt = DateTime.Parse(lb.Text);
                    var info = db.vwServerDates.First();
                    if (dt <= info.serverdate)
                    {
                        e.Cell.BackColor = System.Drawing.Color.LightYellow;
                        e.Cell.Font.Bold = true;
                    }
                   // lb.Text = Persia.Calendar.ConvertToPersian(dt).Simple;
                }
                catch { }
            }


            if (e.DataColumn.VisibleIndex == 16)
            {
                SqlDataSource source = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "SqlDataSource1") as SqlDataSource;

                HiddenField hf = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HiddenField4") as HiddenField;

                source.SelectParameters[0].DefaultValue = hf.Value;
                
            }



            if (e.DataColumn.VisibleIndex == 15)
            {
                Image img = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "img1") as Image;
                HiddenField hf = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HiddenField3") as HiddenField;
                int intId = Convert.ToInt32(hf.Value);

                // کنترل نامه داشتن 
                var info = db.tbProjectPapers.Where(n => n.paAct == 1 && n.paProject == intId && n.paType >= 1003 && n.paType <= 1004);
                if (info.Any())
                {
                    img.ImageUrl = @"~\Content\images\icons\2.png";
                }

            }





            if (e.DataColumn.VisibleIndex == 10)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink1") as HyperLink;
                HiddenField hf = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HiddenField1") as HiddenField;

                if (string.IsNullOrEmpty(hf.Value))
                {
                    hp.Visible = false;
                }



            }

            if (e.DataColumn.VisibleIndex == 11)
            {
                HiddenField hf = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HiddenField2") as HiddenField;

                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink2") as HyperLink;


                if (string.IsNullOrEmpty(hf.Value))
                {
                    hp.Visible = false;
                }

            }
        }

        protected void ASPxGridView1_HtmlRowCreated(object sender, ASPxGridViewTableRowEventArgs e)
        {

        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {

            ASPxGridViewExporter1.WriteXlsxToResponse();
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                Label lb = (Label)e.Row.FindControl("Label1");

                try
                {
                    lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;
                }
                catch { }


            }
            catch { }
        }

        protected void ASPxGridView1_PageIndexChanged(object sender, EventArgs e)
        {
           
        }
    }
}
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
    public partial class PageSooratMali : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }
            sourceSooratMali.SelectParameters["prCode"].DefaultValue = Page.User.Identity.Name;

            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "ارسال به مالی / عودت";
        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.VisibleIndex == 11)
            {
                HiddenField hf = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HiddenField1") as HiddenField;
                HiddenField hf2 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HiddenField2") as HiddenField;
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink1") as HyperLink;


                if (string.IsNullOrEmpty(hf.Value) && string.IsNullOrEmpty(hf2.Value))
                {
                    hp.Visible = false;
                }
            }
        }
        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {

            ASPxGridViewExporter1.WriteXlsxToResponse();

        }
    }
}
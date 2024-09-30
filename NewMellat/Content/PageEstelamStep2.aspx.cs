using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.IO;

namespace NewMellat.Content
{
    public partial class PageEstelamStep2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "منتظر پاسخ ناظر";
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
            {ASPxGridView1.EndUpdate();
            }
            ASPxGridView1.ExpandAll();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsToResponse();
        }
    }
}
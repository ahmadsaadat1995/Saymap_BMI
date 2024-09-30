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
    public partial class PageSooratOdats : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }
            sourceOdats.SelectParameters["prCode"].DefaultValue = Page.User.Identity.Name;

            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "بررسی عودتی ها";
        }
    }
}
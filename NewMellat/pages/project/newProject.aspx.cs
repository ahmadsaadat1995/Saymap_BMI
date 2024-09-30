using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.pages.project
{
    public partial class newProject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
              //  Response.Redirect(@"~\content\PageDenied.aspx");
            }


            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "ثبت درخواست جدید";
        }
    }
}
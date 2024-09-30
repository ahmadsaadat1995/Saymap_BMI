using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace NewMellat.Content
{
    public partial class page_test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
           //     Response.Redirect(@"~\content\PageDenied.aspx");
            }
            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = " تست";
            string userName = Page.User.Identity.Name;
            lit1.Text = "<script>var username='" + userName + "'</script>";
        }
    }
}
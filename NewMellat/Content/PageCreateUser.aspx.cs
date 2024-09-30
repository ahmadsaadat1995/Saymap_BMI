using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using Telerik.Web.UI;

namespace NewMellat.Content
{
    public partial class PageCreateUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "مدیریت کاربران";

            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }


            if (!Page.User.IsInRole("admins"))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }

        }

        protected void ASPxGridView1_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {

        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            ASPxGridView1.DataBind();
        }

        protected void CreateUserWizard1_ContinueButtonClick(object sender, EventArgs e)
        {
            Response.Redirect(@"~\content\PageCreateUser.aspx");
        }

        protected void ASPxGridView1_RowCommand(object sender, ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "res")
            {
                string strUser = e.CommandArgs.CommandArgument.ToString();
                MembershipUser mu = Membership.GetUser(strUser);
                lbReset.Text = mu.ResetPassword();
                Membership.UpdateUser(mu);


            }
            if (e.CommandArgs.CommandName == "lock")
            {
                string strUser = e.CommandArgs.CommandArgument.ToString();
                MembershipUser mu = Membership.GetUser(strUser);
                mu.UnlockUser();
                Membership.UpdateUser(mu);
              
                RadNotification1.Show("دسترسی کاربر انتخابی باز شد");

            }


        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.VisibleIndex == 6)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink7") as HyperLink;


                
                HiddenField h1 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "h1") as HiddenField;

                hp.Target = "_blank";

                hp.NavigateUrl = "~/content/PageUserSso.aspx?UserName=" + h1.Value;

                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc3({0}); return false;", strItembody[1]));

            }
        }
    }
}
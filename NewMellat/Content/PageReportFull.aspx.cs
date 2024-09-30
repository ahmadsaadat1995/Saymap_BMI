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
    public partial class PageReportFull : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }

            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "ویرایشگر جامع اطلاعات";
        }

        protected void ASPxGridView2_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["prId"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void ASPxGridView3_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["prId"] = (sender as ASPxGridView).GetMasterRowKeyValue();

        }

        protected void ASPxGridView4_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["khId"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void ASPxGridView5_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["khId"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void ASPxGridView6_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["khId"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

         
    }
}
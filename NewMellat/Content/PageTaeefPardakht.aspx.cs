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
    public partial class PageTaeefPardakht : System.Web.UI.Page
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
            panel.Text = "تایید پرداخت / عودت";
        }

        protected void ASPxGridView2_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "pishPriceArzeshAfzoode")
            {
                Label lb = ASPxGridView2.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label3") as Label;
                try
                {
                    lb.Text = CommonClass.NumberWithGroup(long.Parse(lb.Text));
                }
                catch { }

            }
        }
    }
}
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
    public partial class PageSooratPays : System.Web.UI.Page
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
            panel.Text = "لیست پرداختی ها";
        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "pishPriceArzeshAfzoode")
            {
                Label lb =
                    ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label3") as
                        Label;


                try
                {
                    lb.Text = CommonClass.NumberWithGroup(long.Parse(lb.Text));

                }
                catch
                {

                }
            }
        }

        protected void ASPxGridView1_SummaryDisplayText(object sender, ASPxGridViewSummaryDisplayTextEventArgs e)
        {
            try
            {
                e.Text = CommonClass.NumberWithGroup(Convert.ToInt64(e.Text));
            }
            catch { }
        }
    }
}
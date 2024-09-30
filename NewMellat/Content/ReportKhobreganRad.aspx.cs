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
    public partial class ReportKhobreganRad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "گزارش پروژه های ردشده خبرگان";

            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
               // Response.Redirect(@"~\content\PageDenied.aspx");
            }
        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "paDate")
            {
                Label lb =
                   ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label1") as
                       Label;

                try
                {
                    lb.Text = CommonClass.ShamsiDate(DateTime.Parse(lb.Text)).Insert(4, "/").Insert(7, "/");
                }
                catch (Exception)
                {
                    lb.Text = "";
                }
            }



            if (e.DataColumn.VisibleIndex == 1)
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label2") as Label;
                lb.Text = (e.VisibleIndex + 1).ToString();


                //ثبت آمار
                //var tmp = db.tbTemps.SingleOrDefault(n => n.tmId == 4);
                //tmp.tmData = int.Parse(lb.Text);
                //db.SaveChanges();
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsToResponse();

        }
    }
}
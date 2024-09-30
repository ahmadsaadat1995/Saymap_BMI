using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class PageGharardadEblagh : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PersianCalendar1.Date = DateTime.Now;
            }

            if (Request.QueryString["tp"] == "1")
            {
                Label6.Text = "مهلت ابلاغ قرارداد";
            }
            else if (Request.QueryString["tp"] == "2")
            {
                Label6.Text = "مهلت اصلاح قرارداد";
            }
        }

        protected void ASPxGridView1_DataBound(object sender, EventArgs e)
        {

        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            try
            {
                if (e.DataColumn.FieldName == "paDate")
                {
                    Label lb =
                        ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label1") as Label;
                    lb.Text = CommonClass.ShamsiDate(Convert.ToDateTime(lb.Text)).Insert(4, "/").Insert(7, "/");
                }
            }
            catch { }
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            sourcePages.InsertParameters["paDate"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
            sourcePages.Insert();
            ASPxGridView1.DataBind();
            RadNotification1.Show("نامه جدید با موفقیت به ثبت رسید");

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (Request.QueryString["tp"] == "1")
            {
                Label7.Text = Persia.Calendar.ConvertToPersian(PersianCalendar1.Date.AddDays(14)).Simple;
            }
            else if (Request.QueryString["tp"] == "2")
            {
                Label7.Text = Persia.Calendar.ConvertToPersian(PersianCalendar1.Date.AddDays(4)).Simple;
            }
        }

    }
}
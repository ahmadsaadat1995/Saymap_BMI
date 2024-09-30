using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat
{
    public partial class PagePages2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PersianCalendar pcal = new PersianCalendar();

                fromDate1.Value = string.Format("{0}/{1}/{2}", pcal.GetYear(DateTime.Now), pcal.GetMonth(DateTime.Now).ToString("00"), pcal.GetDayOfMonth(DateTime.Now).ToString("00"));
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
            if(string.IsNullOrEmpty(fromDate1.Value))
            {
                return;
            }
            var datrPart = Persia.Number.ConvertToLatin(fromDate1.Value).Split('/');
            if (datrPart.Length != 3)
            {
                return;
            }
            PersianCalendar pCal = new PersianCalendar();

            DateTime dt = pCal.ToDateTime(Convert.ToInt32(datrPart[0]), Convert.ToInt32(datrPart[1]), Convert.ToInt32(datrPart[2]), 0, 0, 0, 0);
            sourcePages.InsertParameters["paDate"].DefaultValue = dt.ToShortDateString();
            sourcePages.Insert();
            ASPxGridView1.DataBind();
            RadNotification1.Show("نامه جدید با موفقیت به ثبت رسید");

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (!string.IsNullOrEmpty(fromDate1.Value))
            {
                fromDate1.Value = fromDate1.Value.Replace('۱', '1').Replace('۲', '2').Replace('۳', '3').Replace('۴', '4').Replace('۵', '5').Replace('۶', '6').Replace('۷', '7').Replace('۸', '8').Replace('۹', '9').Replace('۰', '0');
                string[] datePart = fromDate1.Value.Split('/');
                PersianCalendar pcal = new PersianCalendar();
                DateTime dt = pcal.ToDateTime(Convert.ToInt32(datePart[0]), Convert.ToInt32(datePart[1]), Convert.ToInt32(datePart[2]), 0, 0, 0, 0);
                dt = dt.AddDays(14);
                Label7.Text = Persia.Calendar.ConvertToPersian(dt).Simple;
            }
            
        }

    }
}
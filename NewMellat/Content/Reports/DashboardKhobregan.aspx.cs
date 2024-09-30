using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content.Reports
{
    public partial class DashboardKhobregan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {


                PersianCalendar1.Date = DateTime.Now.AddYears(-4);
                PersianCalendar2.Date = DateTime.Now;




                Source4.SelectParameters["start"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
                Source4.SelectParameters["end"].DefaultValue = PersianCalendar2.Date.ToShortDateString();


                Source5.SelectParameters["start"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
                Source5.SelectParameters["end"].DefaultValue = PersianCalendar2.Date.ToShortDateString();


                Source6.SelectParameters["start"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
                Source6.SelectParameters["end"].DefaultValue = PersianCalendar2.Date.ToShortDateString();

                Source7.SelectParameters["start"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
                Source7.SelectParameters["end"].DefaultValue = PersianCalendar2.Date.ToShortDateString();


                Source8.SelectParameters["start"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
                Source8.SelectParameters["end"].DefaultValue = PersianCalendar2.Date.ToShortDateString();

                Source9.SelectParameters["start"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
                Source9.SelectParameters["end"].DefaultValue = PersianCalendar2.Date.ToShortDateString();


            }

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {


            Source4.SelectParameters["start"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
            Source4.SelectParameters["end"].DefaultValue = PersianCalendar2.Date.ToShortDateString();


            Source5.SelectParameters["start"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
            Source5.SelectParameters["end"].DefaultValue = PersianCalendar2.Date.ToShortDateString();

            Source6.SelectParameters["start"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
            Source6.SelectParameters["end"].DefaultValue = PersianCalendar2.Date.ToShortDateString();

            Source7.SelectParameters["start"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
            Source7.SelectParameters["end"].DefaultValue = PersianCalendar2.Date.ToShortDateString();

            Source8.SelectParameters["start"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
            Source8.SelectParameters["end"].DefaultValue = PersianCalendar2.Date.ToShortDateString();

            Source9.SelectParameters["start"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
            Source9.SelectParameters["end"].DefaultValue = PersianCalendar2.Date.ToShortDateString();

            if (drpPeymankar.SelectedItems.Count > 0)
            {
                string strPeymankar = string.Empty;

                foreach (var item in drpPeymankar.SelectedValues)
                {
                    strPeymankar += item.ToString() + ",";
                }

                Source4.SelectParameters["peymankar"].DefaultValue = strPeymankar.Remove(strPeymankar.Length - 1, 1);
                Source5.SelectParameters["peymankar"].DefaultValue = strPeymankar.Remove(strPeymankar.Length - 1, 1);
                Source6.SelectParameters["peymankar"].DefaultValue = strPeymankar.Remove(strPeymankar.Length - 1, 1);
                Source7.SelectParameters["peymankar"].DefaultValue = strPeymankar.Remove(strPeymankar.Length - 1, 1);
                Source8.SelectParameters["peymankar"].DefaultValue = strPeymankar.Remove(strPeymankar.Length - 1, 1);
                Source9.SelectParameters["peymankar"].DefaultValue = strPeymankar.Remove(strPeymankar.Length - 1, 1);

            }


            if (drpVahed.SelectedItems.Count > 0)
            {
                string strVahed = string.Empty;

                foreach (var item in drpVahed.SelectedValues)
                {
                    strVahed += item.ToString() + ",";
                }


                Source4.SelectParameters["vahed"].DefaultValue = strVahed.Remove(strVahed.Length - 1, 1);
                Source5.SelectParameters["vahed"].DefaultValue = strVahed.Remove(strVahed.Length - 1, 1);
                Source6.SelectParameters["vahed"].DefaultValue = strVahed.Remove(strVahed.Length - 1, 1);
                Source7.SelectParameters["vahed"].DefaultValue = strVahed.Remove(strVahed.Length - 1, 1);
                Source8.SelectParameters["vahed"].DefaultValue = strVahed.Remove(strVahed.Length - 1, 1);
                Source9.SelectParameters["vahed"].DefaultValue = strVahed.Remove(strVahed.Length - 1, 1);

            }



        }
    }
}
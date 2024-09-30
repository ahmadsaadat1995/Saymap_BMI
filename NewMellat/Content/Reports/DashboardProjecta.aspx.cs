using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content.Reports
{


    public partial class DashboardProjecta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

 
                PersianCalendar1.Date = DateTime.Now.AddYears(-4);
                PersianCalendar2.Date = DateTime.Now;


                Source1.SelectParameters["start"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
                Source1.SelectParameters["end"].DefaultValue = PersianCalendar2.Date.ToShortDateString();


                Source2.SelectParameters["start"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
                Source2.SelectParameters["end"].DefaultValue = PersianCalendar2.Date.ToShortDateString();

                Source3.SelectParameters["start"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
                Source3.SelectParameters["end"].DefaultValue = PersianCalendar2.Date.ToShortDateString();


                Source4.SelectParameters["start"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
                Source4.SelectParameters["end"].DefaultValue = PersianCalendar2.Date.ToShortDateString();


                Source5.SelectParameters["start"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
                Source5.SelectParameters["end"].DefaultValue = PersianCalendar2.Date.ToShortDateString();



                Source6.SelectParameters["start"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
                Source6.SelectParameters["end"].DefaultValue = PersianCalendar2.Date.ToShortDateString();



            }
        }



        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

            Source1.SelectParameters["start"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
            Source1.SelectParameters["end"].DefaultValue = PersianCalendar2.Date.ToShortDateString();

            Source2.SelectParameters["start"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
            Source2.SelectParameters["end"].DefaultValue = PersianCalendar2.Date.ToShortDateString();

            Source3.SelectParameters["start"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
            Source3.SelectParameters["end"].DefaultValue = PersianCalendar2.Date.ToShortDateString();


            Source4.SelectParameters["start"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
            Source4.SelectParameters["end"].DefaultValue = PersianCalendar2.Date.ToShortDateString();


            Source5.SelectParameters["start"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
            Source5.SelectParameters["end"].DefaultValue = PersianCalendar2.Date.ToShortDateString();



            Source6.SelectParameters["start"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
            Source6.SelectParameters["end"].DefaultValue = PersianCalendar2.Date.ToShortDateString();


            if (drpPeymankar.SelectedItems.Count > 0)
            {
                string strPeymankar = string.Empty;

                foreach (var item in drpPeymankar.SelectedValues)
                {
                    strPeymankar += item.ToString() + ",";
                }

                Source1.SelectParameters["peymankar"].DefaultValue = strPeymankar.Remove(strPeymankar.Length - 1, 1);
                Source2.SelectParameters["peymankar"].DefaultValue = strPeymankar.Remove(strPeymankar.Length - 1, 1);
                Source3.SelectParameters["peymankar"].DefaultValue = strPeymankar.Remove(strPeymankar.Length - 1, 1);
                Source4.SelectParameters["peymankar"].DefaultValue = strPeymankar.Remove(strPeymankar.Length - 1, 1);
                Source5.SelectParameters["peymankar"].DefaultValue = strPeymankar.Remove(strPeymankar.Length - 1, 1);
                Source6.SelectParameters["peymankar"].DefaultValue = strPeymankar.Remove(strPeymankar.Length - 1, 1);
                source7.SelectParameters["peymankar"].DefaultValue = strPeymankar.Remove(strPeymankar.Length - 1, 1);
                source8.SelectParameters["peymankar"].DefaultValue = strPeymankar.Remove(strPeymankar.Length - 1, 1);
                source9.SelectParameters["peymankar"].DefaultValue = strPeymankar.Remove(strPeymankar.Length - 1, 1);
                source10.SelectParameters["peymankar"].DefaultValue = strPeymankar.Remove(strPeymankar.Length - 1, 1);
                source11.SelectParameters["peymankar"].DefaultValue = strPeymankar.Remove(strPeymankar.Length - 1, 1);
                source12.SelectParameters["peymankar"].DefaultValue = strPeymankar.Remove(strPeymankar.Length - 1, 1);
                source13.SelectParameters["peymankar"].DefaultValue = strPeymankar.Remove(strPeymankar.Length - 1, 1);
                source14.SelectParameters["peymankar"].DefaultValue = strPeymankar.Remove(strPeymankar.Length - 1, 1);

            }


            if (drpVahed1.SelectedItems.Count > 0)
            {
                string strVahed = string.Empty;

                foreach (var item in drpVahed1.SelectedValues)
                {
                    strVahed += item.ToString() + ",";
                }

                Source1.SelectParameters["vahed"].DefaultValue = strVahed.Remove(strVahed.Length - 1, 1);
                Source2.SelectParameters["vahed"].DefaultValue = strVahed.Remove(strVahed.Length - 1, 1);
                Source3.SelectParameters["vahed"].DefaultValue = strVahed.Remove(strVahed.Length - 1, 1);
                Source4.SelectParameters["vahed"].DefaultValue = strVahed.Remove(strVahed.Length - 1, 1);
                Source5.SelectParameters["vahed"].DefaultValue = strVahed.Remove(strVahed.Length - 1, 1);
                Source6.SelectParameters["vahed"].DefaultValue = strVahed.Remove(strVahed.Length - 1, 1);
                source7.SelectParameters["vahed"].DefaultValue = strVahed.Remove(strVahed.Length - 1, 1);
                source8.SelectParameters["vahed"].DefaultValue = strVahed.Remove(strVahed.Length - 1, 1);
                source9.SelectParameters["vahed"].DefaultValue = strVahed.Remove(strVahed.Length - 1, 1);
                source10.SelectParameters["vahed"].DefaultValue = strVahed.Remove(strVahed.Length - 1, 1);
                source11.SelectParameters["vahed"].DefaultValue = strVahed.Remove(strVahed.Length - 1, 1);
                source12.SelectParameters["vahed"].DefaultValue = strVahed.Remove(strVahed.Length - 1, 1);
                source13.SelectParameters["vahed"].DefaultValue = strVahed.Remove(strVahed.Length - 1, 1);
                source14.SelectParameters["vahed"].DefaultValue = strVahed.Remove(strVahed.Length - 1, 1);

            }


        }
    }
}
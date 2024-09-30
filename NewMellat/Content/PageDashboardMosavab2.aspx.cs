using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class PageDashboardMosavab2 : System.Web.UI.Page
    {

        NewMellatEntities db = new NewMellatEntities();


        void loadInfo()
        {
            int intPeymankar = Convert.ToInt32(drpPeymankar.Value);

            // سررسید نشد - مهلت ارسال 
            g12.Value = db.vwMosavab2.Where(n => n.mosDate >= PersianCalendar1.Date && n.mosDate <= PersianCalendar2.Date && n.mosOlaviat == 173 && n.prPeymankar == intPeymankar).Count().ToString();

            g22.Value = db.vwMosavab2.Where(n => n.mosDate >= PersianCalendar1.Date && n.mosDate <= PersianCalendar2.Date && n.mosOlaviat == 174 && n.prPeymankar == intPeymankar).Count().ToString();

            g32.Value = db.vwMosavab2.Where(n => n.mosDate >= PersianCalendar1.Date && n.mosDate <= PersianCalendar2.Date && n.mosOlaviat == 175 && n.prPeymankar == intPeymankar).Count().ToString();


            // دارای تاخیر
            g14.Value = db.vwMosavab3.Where(n => n.mosDate >= PersianCalendar1.Date && n.mosDate <= PersianCalendar2.Date && n.mosOlaviat == 173 && n.prPeymankar == intPeymankar).Count().ToString();

            g24.Value = db.vwMosavab3.Where(n => n.mosDate >= PersianCalendar1.Date && n.mosDate <= PersianCalendar2.Date && n.mosOlaviat == 174 && n.prPeymankar == intPeymankar).Count().ToString();

            g34.Value = db.vwMosavab3.Where(n => n.mosDate >= PersianCalendar1.Date && n.mosDate <= PersianCalendar2.Date && n.mosOlaviat == 175 && n.prPeymankar == intPeymankar).Count().ToString();




            // انجام شده
            g13.Value = db.vwMosavab4.Where(n => n.mosDate >= PersianCalendar1.Date && n.mosDate <= PersianCalendar2.Date && n.mosOlaviat == 173 && n.prPeymankar == intPeymankar).Count().ToString();

            g23.Value = db.vwMosavab4.Where(n => n.mosDate >= PersianCalendar1.Date && n.mosDate <= PersianCalendar2.Date && n.mosOlaviat == 174 && n.prPeymankar == intPeymankar).Count().ToString();

            g33.Value = db.vwMosavab4.Where(n => n.mosDate >= PersianCalendar1.Date && n.mosDate <= PersianCalendar2.Date && n.mosOlaviat == 175 && n.prPeymankar == intPeymankar).Count().ToString();




            //مهلت پاسخگویی - سررسید نشده
            g42.Value = db.vwMosavab5.Where(n => n.mosDate >= PersianCalendar1.Date && n.mosDate <= PersianCalendar2.Date && n.mosOlaviat == 173 && n.prPeymankar == intPeymankar).Count().ToString();

            g52.Value = db.vwMosavab5.Where(n => n.mosDate >= PersianCalendar1.Date && n.mosDate <= PersianCalendar2.Date && n.mosOlaviat == 174 && n.prPeymankar == intPeymankar).Count().ToString();

            g62.Value = db.vwMosavab5.Where(n => n.mosDate >= PersianCalendar1.Date && n.mosDate <= PersianCalendar2.Date && n.mosOlaviat == 175 && n.prPeymankar == intPeymankar).Count().ToString();



            //مهلت پاسخگویی - انجام  شده
            g43.Value = db.vwMosavab6.Where(n => n.mosDate >= PersianCalendar1.Date && n.mosDate <= PersianCalendar2.Date && n.mosOlaviat == 173 && n.prPeymankar == intPeymankar).Count().ToString();

            g53.Value = db.vwMosavab6.Where(n => n.mosDate >= PersianCalendar1.Date && n.mosDate <= PersianCalendar2.Date && n.mosOlaviat == 174 && n.prPeymankar == intPeymankar).Count().ToString();

            g63.Value = db.vwMosavab6.Where(n => n.mosDate >= PersianCalendar1.Date && n.mosDate <= PersianCalendar2.Date && n.mosOlaviat == 175 && n.prPeymankar == intPeymankar).Count().ToString();



            //مهلت پاسخگویی - دارای تاخیر
            g44.Value = db.vwMosavab7.Where(n => n.mosDate >= PersianCalendar1.Date && n.mosDate <= PersianCalendar2.Date && n.mosOlaviat == 173 && n.prPeymankar == intPeymankar).Count().ToString();

            g54.Value = db.vwMosavab7.Where(n => n.mosDate >= PersianCalendar1.Date && n.mosDate <= PersianCalendar2.Date && n.mosOlaviat == 174 && n.prPeymankar == intPeymankar).Count().ToString();

            g64.Value = db.vwMosavab7.Where(n => n.mosDate >= PersianCalendar1.Date && n.mosDate <= PersianCalendar2.Date && n.mosOlaviat == 175 && n.prPeymankar == intPeymankar).Count().ToString();

        }




        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                PersianCalendar1.Date = DateTime.Now.AddMonths(-1);
                PersianCalendar2.Date = DateTime.Now;
            }


            string sd = PersianCalendar1.Date.Year + "/" + PersianCalendar1.Date.Month + "/" + PersianCalendar1.Date.Day;
            string ed = PersianCalendar2.Date.Year + "/" + PersianCalendar2.Date.Month + "/" + PersianCalendar2.Date.Day;




            loadInfo();


            g11.Value = (int.Parse(g12.Value) + int.Parse(g13.Value) + int.Parse(g14.Value)).ToString();
            g21.Value = (int.Parse(g22.Value) + int.Parse(g23.Value) + int.Parse(g24.Value)).ToString();
            g31.Value = (int.Parse(g32.Value) + int.Parse(g33.Value) + int.Parse(g34.Value)).ToString();
            g41.Value = (int.Parse(g42.Value) + int.Parse(g43.Value) + int.Parse(g44.Value)).ToString();
            g51.Value = (int.Parse(g52.Value) + int.Parse(g53.Value) + int.Parse(g54.Value)).ToString();
            g61.Value = (int.Parse(g62.Value) + int.Parse(g63.Value) + int.Parse(g64.Value)).ToString();


            gs1.Value = (int.Parse(g11.Value) + int.Parse(g21.Value) + int.Parse(g31.Value)).ToString();
            gs2.Value = (int.Parse(g12.Value) + int.Parse(g22.Value) + int.Parse(g32.Value)).ToString();
            gs3.Value = (int.Parse(g13.Value) + int.Parse(g23.Value) + int.Parse(g33.Value)).ToString();
            gs4.Value = (int.Parse(g14.Value) + int.Parse(g24.Value) + int.Parse(g34.Value)).ToString();
            gs7.Value = (int.Parse(g42.Value) + int.Parse(g52.Value) + int.Parse(g62.Value)).ToString();
            gs6.Value = (int.Parse(g43.Value) + int.Parse(g53.Value) + int.Parse(g63.Value)).ToString();
            gs5.Value = (int.Parse(g44.Value) + int.Parse(g54.Value) + int.Parse(g64.Value)).ToString();
            gs8.Value = (int.Parse(g41.Value) + int.Parse(g51.Value) + int.Parse(g61.Value)).ToString();



            // hyperlinks
            HyperLink7.NavigateUrl = "~/Content/Rep11.aspx?olv=173&source=12&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;
            HyperLink8.NavigateUrl = "~/Content/Rep11.aspx?olv=174&source=12&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;
            HyperLink9.NavigateUrl = "~/Content/Rep11.aspx?olv=175&source=12&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;


            HyperLink13.NavigateUrl = "~/Content/Rep11.aspx?olv=173&source=13&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;
            HyperLink14.NavigateUrl = "~/Content/Rep11.aspx?olv=174&source=13&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;
            HyperLink15.NavigateUrl = "~/Content/Rep11.aspx?olv=175&source=13&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;




            HyperLink16.NavigateUrl = "~/Content/Rep11.aspx?olv=173&source=14&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;
            HyperLink17.NavigateUrl = "~/Content/Rep11.aspx?olv=174&source=14&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;
            HyperLink18.NavigateUrl = "~/Content/Rep11.aspx?olv=175&source=14&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;


            HyperLink10.NavigateUrl = "~/Content/Rep11.aspx?olv=173&source=15&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;
            HyperLink11.NavigateUrl = "~/Content/Rep11.aspx?olv=174&source=15&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;
            HyperLink12.NavigateUrl = "~/Content/Rep11.aspx?olv=175&source=15&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;



            HyperLink19.NavigateUrl = "~/Content/Rep11.aspx?olv=173&source=16&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;
            HyperLink20.NavigateUrl = "~/Content/Rep11.aspx?olv=174&source=16&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;
            HyperLink21.NavigateUrl = "~/Content/Rep11.aspx?olv=175&source=16&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;


            HyperLink22.NavigateUrl = "~/Content/Rep11.aspx?olv=173&source=17&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;
            HyperLink23.NavigateUrl = "~/Content/Rep11.aspx?olv=174&source=17&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;
            HyperLink24.NavigateUrl = "~/Content/Rep11.aspx?olv=175&source=17&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;


        }

        protected void drpPeymankar_DataBound(object sender, EventArgs e)
        {
            drpPeymankar.Items.Insert(0, new ListEditItem("انتخاب", "-1"));
            drpPeymankar.SelectedIndex = 0;
        }
    }
}
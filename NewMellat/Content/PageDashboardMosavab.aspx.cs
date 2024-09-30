using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;
using DevExpress.Web;
using Chart = DevExpress.Charts.Model.Chart;

namespace NewMellat.Content
{
    public partial class PageDashboardMosavab : System.Web.UI.Page
    {
        NewMellatEntities db = new NewMellatEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PersianCalendar1.Date = DateTime.Now.AddMonths(-1);
                PersianCalendar2.Date = DateTime.Now;
            }




            string sd = PersianCalendar1.Date.Year + "/" + PersianCalendar1.Date.Month + "/" + PersianCalendar1.Date.Day;
            string ed = PersianCalendar2.Date.Year + "/" + PersianCalendar2.Date.Month + "/" + PersianCalendar2.Date.Day;




            Chart1.Series[0]["DoughnutRadius"] = "30";
            Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
            //    Chart1.Series[0].ToolTip = "X=#VALX, Y=#VALY";



            Chart2.Series[0]["DoughnutRadius"] = "30";
            Chart2.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;

            Chart1.Series[0].LabelToolTip = "dd.aspx?x=#VALY";



            var eee = Chart1.Series[0].XValueMember;


            string[] strItembody = Chart1.Series[0].LabelToolTip.Split('=');
            if (strItembody[1] == g11.Value)
            {
                Chart1.Series[0].Url = "~/Content/Rep11.aspx?olv=173&source=1&sd=" + sd + "&ed=" + ed + "&peymankar=164";
            }



            int intPeymankar = -1;

            try
            {
                intPeymankar = Convert.ToInt32(drpPeymankar.Value);
            }
            catch
            {

            }


            // آدرسی دهی به لینک ها
            //HyperLink1.NavigateUrl = "~/Content/Rep11.aspx?olv=173&source=1&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;
            //HyperLink2.NavigateUrl = "~/Content/Rep11.aspx?olv=174&source=1&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;
            //HyperLink3.NavigateUrl = "~/Content/Rep11.aspx?olv=175&source=1&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;

            HyperLink7.NavigateUrl = "~/Content/Rep11.aspx?olv=173&source=3&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;
            HyperLink8.NavigateUrl = "~/Content/Rep11.aspx?olv=174&source=3&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;
            HyperLink9.NavigateUrl = "~/Content/Rep11.aspx?olv=175&source=3&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;



            HyperLink1.NavigateUrl = "~/Content/Rep11.aspx?olv=173&source=21&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;
            HyperLink2.NavigateUrl = "~/Content/Rep11.aspx?olv=174&source=21&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;
            HyperLink3.NavigateUrl = "~/Content/Rep11.aspx?olv=175&source=21&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;
            HyperLink4.NavigateUrl = "~/Content/Rep11.aspx?olv=173&source=22&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;
            HyperLink5.NavigateUrl = "~/Content/Rep11.aspx?olv=174&source=22&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;
            HyperLink6.NavigateUrl = "~/Content/Rep11.aspx?olv=175&source=22&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;



            HyperLink10.NavigateUrl = "~/Content/Rep11.aspx?olv=173&source=4&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;
            HyperLink11.NavigateUrl = "~/Content/Rep11.aspx?olv=174&source=4&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;
            HyperLink12.NavigateUrl = "~/Content/Rep11.aspx?olv=175&source=4&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;

            HyperLink13.NavigateUrl = "~/Content/Rep11.aspx?olv=173&source=5&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;
            HyperLink14.NavigateUrl = "~/Content/Rep11.aspx?olv=174&source=5&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;
            HyperLink15.NavigateUrl = "~/Content/Rep11.aspx?olv=175&source=5&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;


            HyperLink19.NavigateUrl = "~/Content/Rep11.aspx?olv=173&source=7&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;
            HyperLink20.NavigateUrl = "~/Content/Rep11.aspx?olv=174&source=7&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;
            HyperLink21.NavigateUrl = "~/Content/Rep11.aspx?olv=175&source=7&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;



            HyperLink16.NavigateUrl = "~/Content/Rep11.aspx?olv=173&source=6&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;
            HyperLink17.NavigateUrl = "~/Content/Rep11.aspx?olv=174&source=6&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;
            HyperLink18.NavigateUrl = "~/Content/Rep11.aspx?olv=175&source=6&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;


            HyperLink22.NavigateUrl = "~/Content/Rep11.aspx?olv=173&source=8&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;
            HyperLink23.NavigateUrl = "~/Content/Rep11.aspx?olv=174&source=8&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;
            HyperLink24.NavigateUrl = "~/Content/Rep11.aspx?olv=175&source=8&sd=" + sd + "&ed=" + ed + "&peymankar=" + drpPeymankar.Value;

            //var info = db.tbKhobreganMosavabs.Where(n => n.mosAct == 1 && n.mosDate >= PersianCalendar1.Date && n.mosDate <= PersianCalendar2.Date);
            var info = db.vwMosavabDashboards.Where(n => n.mosDate >= PersianCalendar1.Date && n.mosDate <= PersianCalendar2.Date && n.prPeymankar == intPeymankar);


            DateTime dateToday = db.vwServerDates.Single().serverdate;


            // جمع کل مهلت ارسال پروپورال
            //g11.Value = info.Count(n => n.mosOlaviat == 173 && n.mosErsalDate != null).ToString();
            //g21.Value = info.Count(n => n.mosOlaviat == 174 && n.mosErsalDate != null).ToString();
            //g31.Value = info.Count(n => n.mosOlaviat == 175 && n.mosErsalDate != null).ToString();


            // جمع کل مهلت عملیاتی شدن
           
            //g41.Value = info.Count(n => n.mosOlaviat == 173 && n.mosAmaliatiDate != null).ToString();
            //g51.Value = info.Count(n => n.mosOlaviat == 174 && n.mosAmaliatiDate != null).ToString();
            //g61.Value = info.Count(n => n.mosOlaviat == 175 && n.mosAmaliatiDate != null).ToString();


            // سررسید نشده ارسال پروپوزال
            g12.Value = info.Count(n => n.mosOlaviat == 173 && n.mosErsalDate != null && n.mosErsalDate > dateToday).ToString();
            g22.Value = info.Count(n => n.mosOlaviat == 174 && n.mosErsalDate != null && n.mosErsalDate > dateToday).ToString();
            g32.Value = info.Count(n => n.mosOlaviat == 175 && n.mosErsalDate != null && n.mosErsalDate > dateToday).ToString();


            //سررسید نشده عملیاتی شدن
            var info2 = db.vwDashboardAmaliatiSarRedisNashodes.Where(n => n.mosDate >= PersianCalendar1.Date && n.mosDate <= PersianCalendar2.Date && n.prPeymankar == intPeymankar);
            g42.Value = info2.Count(n => n.mosOlaviat == 173 && n.mosAmaliatiDate != null && n.mosAmaliatiDate > dateToday).ToString();
            g52.Value = info2.Count(n => n.mosOlaviat == 174 && n.mosAmaliatiDate != null && n.mosAmaliatiDate > dateToday).ToString();
            g62.Value = info2.Count(n => n.mosOlaviat == 175 && n.mosAmaliatiDate != null && n.mosAmaliatiDate > dateToday).ToString();


            // انجام شده ارسال پروپوزال
            g13.Value = db.vwMosavabDashboardAjams.Count(n => n.mosOlaviat == 173 && n.mosDate >= PersianCalendar1.Date && n.mosDate <= PersianCalendar2.Date && n.prPeymankar == intPeymankar).ToString();
            g23.Value = db.vwMosavabDashboardAjams.Count(n => n.mosOlaviat == 174 && n.mosDate >= PersianCalendar1.Date && n.mosDate <= PersianCalendar2.Date && n.prPeymankar == intPeymankar).ToString();
            g33.Value = db.vwMosavabDashboardAjams.Count(n => n.mosOlaviat == 175 && n.mosDate >= PersianCalendar1.Date && n.mosDate <= PersianCalendar2.Date && n.prPeymankar == intPeymankar).ToString();


            // با تاخیر ارسال پروپوزال
            g14.Value = db.vwMosavabDashboardTakhirs.Count(n => n.mosOlaviat == 173 && n.mosDate >= PersianCalendar1.Date && n.mosDate <= PersianCalendar2.Date && n.prPeymankar == intPeymankar && n.mosErsalDate < dateToday).ToString();
            g24.Value = db.vwMosavabDashboardTakhirs.Count(n => n.mosOlaviat == 174 && n.mosDate >= PersianCalendar1.Date && n.mosDate <= PersianCalendar2.Date && n.prPeymankar == intPeymankar && n.mosErsalDate < dateToday).ToString();
            g34.Value = db.vwMosavabDashboardTakhirs.Count(n => n.mosOlaviat == 175 && n.mosDate >= PersianCalendar1.Date && n.mosDate <= PersianCalendar2.Date && n.prPeymankar == intPeymankar && n.mosErsalDate < dateToday).ToString();


            // انجام شده عملیاتی
            g43.Value = db.vwMosavabDashboardAmaliatiAnjams.Count(n => n.mosOlaviat == 173 && n.mosDate >= PersianCalendar1.Date && n.mosDate <= PersianCalendar2.Date && n.prPeymankar == intPeymankar).ToString();
            g53.Value = db.vwMosavabDashboardAmaliatiAnjams.Count(n => n.mosOlaviat == 174 && n.mosDate >= PersianCalendar1.Date && n.mosDate <= PersianCalendar2.Date && n.prPeymankar == intPeymankar).ToString();
            g63.Value = db.vwMosavabDashboardAmaliatiAnjams.Count(n => n.mosOlaviat == 175 && n.mosDate >= PersianCalendar1.Date && n.mosDate <= PersianCalendar2.Date && n.prPeymankar == intPeymankar).ToString();


            // با تاخیر عملیاتی
            g44.Value = db.vwMosavabDashboardAmaliatiTakhirs.Count(n => n.mosOlaviat == 173 && n.mosDate >= PersianCalendar1.Date && n.mosDate <= PersianCalendar2.Date && n.prPeymankar == intPeymankar).ToString();
            g54.Value = db.vwMosavabDashboardAmaliatiTakhirs.Count(n => n.mosOlaviat == 174 && n.mosDate >= PersianCalendar1.Date && n.mosDate <= PersianCalendar2.Date && n.prPeymankar == intPeymankar).ToString();
            g64.Value = db.vwMosavabDashboardAmaliatiTakhirs.Count(n => n.mosOlaviat == 175 && n.mosDate >= PersianCalendar1.Date && n.mosDate <= PersianCalendar2.Date && n.prPeymankar == intPeymankar).ToString();




            g11.Value = (int.Parse(g12.Value) + int.Parse(g13.Value) + int.Parse(g14.Value)).ToString();
            g21.Value = (int.Parse(g22.Value) + int.Parse(g23.Value) + int.Parse(g24.Value)).ToString();
            g31.Value = (int.Parse(g32.Value) + int.Parse(g33.Value) + int.Parse(g34.Value)).ToString();
            g41.Value = (int.Parse(g42.Value) + int.Parse(g43.Value) + int.Parse(g44.Value)).ToString();
            g51.Value = (int.Parse(g52.Value) + int.Parse(g53.Value) + int.Parse(g54.Value)).ToString();
            g61.Value = (int.Parse(g62.Value) + int.Parse(g63.Value) + int.Parse(g64.Value)).ToString();




        }

        protected void drpPeymankar_DataBound(object sender, EventArgs e)
        {
            drpPeymankar.Items.Insert(0, new ListEditItem("انتخاب", "-1"));
            drpPeymankar.SelectedIndex = 0;
        }

        protected void drpPeymankar_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
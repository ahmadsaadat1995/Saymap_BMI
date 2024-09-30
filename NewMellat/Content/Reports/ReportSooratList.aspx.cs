using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace NewMellat.Content.Reports
{
    public partial class ReportSooratList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          


          //  loadReport();

        }


        void loadReport()
        {
            XtraReportSooratList report = new XtraReportSooratList();
            System.Globalization.PersianCalendar pc = new System.Globalization.PersianCalendar();


            try
            {
                if (ASPxCheckBox1.Checked)
                {
                    DateTime startGharardad = PersianCalendar1.Date;
                    DateTime startGharardad2 = PersianCalendar2.Date;

                    report.Parameters["YearGharardadStart"].Value = pc.GetYear(startGharardad);
                    report.Parameters["YearGharardadStart2"].Value = pc.GetYear(startGharardad2);


                    var strMonth1 = pc.GetMonth(startGharardad);
                    var strMonth2 = pc.GetMonth(startGharardad2);


                    var strDay1 = pc.GetDayOfMonth(startGharardad);
                    var strDay2 = pc.GetDayOfMonth(startGharardad2);

                    if (strMonth1 < 10)
                    {
                        report.Parameters["MonthGharardadStart"].Value = "0" + strMonth1.ToString();
                    }
                    else
                    {
                        report.Parameters["MonthGharardadStart"].Value = strMonth1.ToString();
                    }

                    if (strMonth2 < 10)
                    {
                        report.Parameters["MonthGharardadStart2"].Value = "0" + strMonth2.ToString();
                    }
                    else
                    {
                        report.Parameters["MonthGharardadStart2"].Value = strMonth2.ToString();
                    }
                    if (strDay1 < 10)
                    {
                        report.Parameters["DayGharardadStart"].Value = "0" + pc.GetDayOfMonth(startGharardad).ToString();
                    }
                    else
                    {
                        report.Parameters["DayGharardadStart"].Value = pc.GetDayOfMonth(startGharardad).ToString();
                    }
                    if (strDay2 < 10)
                    {
                        report.Parameters["DayGharardadStart2"].Value = "0" + pc.GetDayOfMonth(startGharardad2).ToString();
                    }
                    else
                    {
                        report.Parameters["DayGharardadStart2"].Value = pc.GetDayOfMonth(startGharardad2).ToString();
                    }
                }
                else
                {
                    report.Parameters["YearGharardadStart"].Value = "-1";
                    report.Parameters["YearGharardadStart2"].Value = "-1";

                    report.Parameters["MonthGharardadStart"].Value = "-1";
                    report.Parameters["MonthGharardadStart2"].Value = "-1";

                    report.Parameters["DayGharardadStart"].Value = "-1";
                    report.Parameters["DayGharardadStart2"].Value = "-1";
                }
            }
            catch
            {
                report.Parameters["YearGharardadStart"].Value = "-1";
                report.Parameters["YearGharardadStart2"].Value = "-1";

                report.Parameters["MonthGharardadStart"].Value = "-1";
                report.Parameters["MonthGharardadStart2"].Value = "-1";

                report.Parameters["DayGharardadStart"].Value = "-1";
                report.Parameters["DayGharardadStart2"].Value = "-1";
            }






            try
            {
                if (ASPxCheckBox2.Checked)
                {
                    DateTime EndGharardad = PersianCalendar3.Date;
                    DateTime EndGharardad2 = PersianCalendar4.Date;

                    report.Parameters["YearGharardadEnd"].Value = pc.GetYear(EndGharardad);
                    report.Parameters["YearGharardadEnd2"].Value = pc.GetYear(EndGharardad2);


                    var strMonth1 = pc.GetMonth(EndGharardad);
                    var strMonth2 = pc.GetMonth(EndGharardad2);


                    var strDay1 = pc.GetDayOfMonth(EndGharardad);
                    var strDay2 = pc.GetDayOfMonth(EndGharardad2);

                    if (strMonth1 < 10)
                    {
                        report.Parameters["MonthGharardadEnd"].Value = "0" + strMonth1.ToString();

                    }
                    else
                    {
                        report.Parameters["MonthGharardadEnd"].Value = strMonth1.ToString();
                    }

                    if (strMonth2 < 10)
                    {
                        report.Parameters["MonthGharardadEnd2"].Value = "0" + strMonth2.ToString();
                    }
                    else
                    {
                        report.Parameters["MonthGharardadEnd2"].Value = strMonth2.ToString();
                    }


                    if (strDay1 < 10)
                    {
                        report.Parameters["DayGharardadEnd"].Value = "0" + pc.GetDayOfMonth(EndGharardad).ToString();
                    }
                    else
                    {
                        report.Parameters["DayGharardadEnd"].Value = pc.GetDayOfMonth(EndGharardad).ToString();
                    }


                    if (strDay2 < 10)
                    {
                        report.Parameters["DayGharardadEnd2"].Value = "0" + pc.GetDayOfMonth(EndGharardad2).ToString();
                    }
                    else
                    {
                        report.Parameters["DayGharardadEnd2"].Value = pc.GetDayOfMonth(EndGharardad2).ToString();
                    }


                }
                else
                {
                    report.Parameters["YearGharardadEnd"].Value = "-1";
                    report.Parameters["YearGharardadEnd2"].Value = "-1";

                    report.Parameters["MonthGharardadEnd"].Value = "-1";
                    report.Parameters["MonthGharardadEnd2"].Value = "-1";

                    report.Parameters["DayGharardadEnd"].Value = "-1";
                    report.Parameters["DayGharardadEnd2"].Value = "-1";
                }
            }
            catch
            {
                report.Parameters["YearGharardadEnd"].Value = "-1";
                report.Parameters["YearGharardadEnd2"].Value = "-1";

                report.Parameters["MonthGharardadEnd"].Value = "-1";
                report.Parameters["MonthGharardadEnd2"].Value = "-1";

                report.Parameters["DayGharardadEnd"].Value = "-1";
                report.Parameters["DayGharardadEnd2"].Value = "-1";
            }

            //-------------------   تاریخ پرداخت ---------------------------------------------

            try
            {
                if (ASPxCheckBox4.Checked)
                {
                    DateTime EndGharardad = PersianCalendar7.Date;
                    DateTime EndGharardad2 = PersianCalendar8.Date;

                    report.Parameters["YearPaDate2"].Value = pc.GetYear(EndGharardad);
                    report.Parameters["YearPaDate2_2"].Value = pc.GetYear(EndGharardad2);


                    var strMonth1 = pc.GetMonth(EndGharardad);
                    var strMonth2 = pc.GetMonth(EndGharardad2);


                    var strDay1 = pc.GetDayOfMonth(EndGharardad);
                    var strDay2 = pc.GetDayOfMonth(EndGharardad2);

                    if (strMonth1 < 10)
                    {
                        report.Parameters["MonthPaDate2"].Value = "0" + strMonth1.ToString();

                    }
                    else
                    {
                        report.Parameters["MonthPaDate2"].Value = strMonth1.ToString();
                    }

                    if (strMonth2 < 10)
                    {
                        report.Parameters["MonthPaDate2_2"].Value = "0" + strMonth2.ToString();
                    }
                    else
                    {
                        report.Parameters["MonthPaDate2_2"].Value = strMonth2.ToString();
                    }


                    if (strDay1 < 10)
                    {
                        report.Parameters["DayPaDate2"].Value = "0" + pc.GetDayOfMonth(EndGharardad).ToString();
                    }
                    else
                    {
                        report.Parameters["DayPaDate2"].Value = pc.GetDayOfMonth(EndGharardad).ToString();
                    }


                    if (strDay2 < 10)
                    {
                        report.Parameters["DayPaDate2_2"].Value = "0" + pc.GetDayOfMonth(EndGharardad2).ToString();
                    }
                    else
                    {
                        report.Parameters["DayPaDate2_2"].Value = pc.GetDayOfMonth(EndGharardad2).ToString();
                    }


                }
                else
                {
                    report.Parameters["YearPaDate2"].Value = "-1";
                    report.Parameters["YearPaDate2_2"].Value = "-1";

                    report.Parameters["MonthPaDate2"].Value = "-1";
                    report.Parameters["MonthPaDate2_2"].Value = "-1";

                    report.Parameters["DayPaDate2"].Value = "-1";
                    report.Parameters["DayPaDate2_2"].Value = "-1";
                }
            }
            catch
            {
                report.Parameters["YearPaDate2"].Value = "-1";
                report.Parameters["YearPaDate2_2"].Value = "-1";

                report.Parameters["MonthPaDate2"].Value = "-1";
                report.Parameters["MonthPaDate2_2"].Value = "-1";

                report.Parameters["DayPaDate2"].Value = "-1";
                report.Parameters["DayPaDate2_2"].Value = "-1";
            }





            //-------------------   تاریخ تدارکات ---------------------------------------------

            try
            {
                if (ASPxCheckBox5.Checked)
                {
                    DateTime EndGharardad = PersianCalendar9.Date;
                    DateTime EndGharardad2 = PersianCalendar10.Date;

                    report.Parameters["YearPaDate3"].Value = pc.GetYear(EndGharardad);
                    report.Parameters["YearPaDate3_2"].Value = pc.GetYear(EndGharardad2);


                    var strMonth1 = pc.GetMonth(EndGharardad);
                    var strMonth2 = pc.GetMonth(EndGharardad2);


                    var strDay1 = pc.GetDayOfMonth(EndGharardad);
                    var strDay2 = pc.GetDayOfMonth(EndGharardad2);

                    if (strMonth1 < 10)
                    {
                        report.Parameters["MonthPaDate3"].Value = "0" + strMonth1.ToString();

                    }
                    else
                    {
                        report.Parameters["MonthPaDate3"].Value = strMonth1.ToString();
                    }

                    if (strMonth2 < 10)
                    {
                        report.Parameters["MonthPaDate3_2"].Value = "0" + strMonth2.ToString();
                    }
                    else
                    {
                        report.Parameters["MonthPaDate3_2"].Value = strMonth2.ToString();
                    }


                    if (strDay1 < 10)
                    {
                        report.Parameters["DayPaDate3"].Value = "0" + pc.GetDayOfMonth(EndGharardad).ToString();
                    }
                    else
                    {
                        report.Parameters["DayPaDate3"].Value = pc.GetDayOfMonth(EndGharardad).ToString();
                    }


                    if (strDay2 < 10)
                    {
                        report.Parameters["DayPaDate3_2"].Value = "0" + pc.GetDayOfMonth(EndGharardad2).ToString();
                    }
                    else
                    {
                        report.Parameters["DayPaDate3_2"].Value = pc.GetDayOfMonth(EndGharardad2).ToString();
                    }


                }
                else
                {
                    report.Parameters["YearPaDate3"].Value = "-1";
                    report.Parameters["YearPaDate3_2"].Value = "-1";

                    report.Parameters["MonthPaDate3"].Value = "-1";
                    report.Parameters["MonthPaDate3_2"].Value = "-1";

                    report.Parameters["DayPaDate3"].Value = "-1";
                    report.Parameters["DayPaDate3_2"].Value = "-1";
                }
            }
            catch
            {
                report.Parameters["YearPaDate3"].Value = "-1";
                report.Parameters["YearPaDate3_2"].Value = "-1";

                report.Parameters["MonthPaDate3"].Value = "-1";
                report.Parameters["MonthPaDate3_2"].Value = "-1";

                report.Parameters["DayPaDate3"].Value = "-1";
                report.Parameters["DayPaDate3_2"].Value = "-1";
            }




            //-------------------   تاریخ نامه ---------------------------------------------

            try
            {
                if (ASPxCheckBox3.Checked)
                {
                    DateTime EndGharardad = PersianCalendar5.Date;
                    DateTime EndGharardad2 = PersianCalendar6.Date;

                    report.Parameters["YearPaDate"].Value = pc.GetYear(EndGharardad);
                    report.Parameters["YearPaDate_2"].Value = pc.GetYear(EndGharardad2);


                    var strMonth1 = pc.GetMonth(EndGharardad);
                    var strMonth2 = pc.GetMonth(EndGharardad2);


                    var strDay1 = pc.GetDayOfMonth(EndGharardad);
                    var strDay2 = pc.GetDayOfMonth(EndGharardad2);

                    if (strMonth1 < 10)
                    {
                        report.Parameters["MonthPaDate"].Value = "0" + strMonth1.ToString();

                    }
                    else
                    {
                        report.Parameters["MonthPaDate"].Value = strMonth1.ToString();
                    }

                    if (strMonth2 < 10)
                    {
                        report.Parameters["MonthPaDate_2"].Value = "0" + strMonth2.ToString();
                    }
                    else
                    {
                        report.Parameters["MonthPaDate_2"].Value = strMonth2.ToString();
                    }


                    if (strDay1 < 10)
                    {
                        report.Parameters["DayPaDate"].Value = "0" + pc.GetDayOfMonth(EndGharardad).ToString();
                    }
                    else
                    {
                        report.Parameters["DayPaDate_2"].Value = pc.GetDayOfMonth(EndGharardad).ToString();
                    }


                    if (strDay2 < 10)
                    {
                        report.Parameters["DayPaDate"].Value = "0" + pc.GetDayOfMonth(EndGharardad2).ToString();
                    }
                    else
                    {
                        report.Parameters["DayPaDate_2"].Value = pc.GetDayOfMonth(EndGharardad2).ToString();
                    }


                }
                else
                {
                    report.Parameters["YearPaDate"].Value = "-1";
                    report.Parameters["YearPaDate_2"].Value = "-1";

                    report.Parameters["MonthPaDate"].Value = "-1";
                    report.Parameters["MonthPaDate_2"].Value = "-1";

                    report.Parameters["DayPaDate"].Value = "-1";
                    report.Parameters["DayPaDate_2"].Value = "-1";
                }
            }
            catch
            {
                report.Parameters["YearPaDate"].Value = "-1";
                report.Parameters["YearPaDate_2"].Value = "-1";

                report.Parameters["MonthPaDate"].Value = "-1";
                report.Parameters["MonthPaDate_2"].Value = "-1";

                report.Parameters["DayPaDate"].Value = "-1";
                report.Parameters["DayPaDate_2"].Value = "-1";
            }




            ASPxWebDocumentViewer1.OpenReport(report);

        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            loadReport();
        }
    }
}
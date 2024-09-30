using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class PageZarfiatDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "داشبورد ظرفیت سنجی";

        }




        double loSum = 0;

        public double loadChartPrice(DateTime dateEblagh, string monthName1, string monthName2, string monthName3, int day1, int day2, int day3, int day4, int day5, int day6, int nafarSaat, double zarib1, double zarib2, double zarib3, double zarib4, double zarib5, double zarib6,int projType)
        {
            string month = string.Empty;
            string month2 = string.Empty;
            string month3 = string.Empty;
            string month4 = string.Empty;
            string month5 = string.Empty;
            string month6 = string.Empty;
            try
            {
                month = CommonClass.ShamsiDate(dateEblagh.AddDays(day1)).Substring(4, 2);
            }
            catch { }

            if (month == monthName1 || month == monthName2 || month == monthName3)
            {
                loSum += (nafarSaat * zarib1);
            }


            try
            {
                month2 = CommonClass.ShamsiDate(dateEblagh.AddDays(day2)).Substring(4, 2);
            }
            catch { }

            if (month2 == monthName1 || month2 == monthName2 || month2 == monthName3)
            {
                loSum += (nafarSaat * zarib2);
            }


            try
            {
                month3 = CommonClass.ShamsiDate(dateEblagh.AddDays(day3)).Substring(4, 2);
            }
            catch { }

            if (month3 == monthName1 || month3 == monthName2 || month3 == monthName3)
            {
                loSum += (nafarSaat * zarib3);
            }



            try
            {
                month4 = CommonClass.ShamsiDate(dateEblagh.AddDays(day4)).Substring(4, 2);
            }
            catch { }

            if (month4 == monthName1 || month4 == monthName2 || month4 == monthName3)
            {
                loSum += (nafarSaat * zarib4);
            }



            try
            {
                month5 = CommonClass.ShamsiDate(dateEblagh.AddDays(day5)).Substring(4, 2);
            }
            catch { }

            if (month5 == monthName1 || month5 == monthName2 || month5 == monthName3)
            {
                loSum += (nafarSaat * zarib5);
            }



            try
            {
                month6 = CommonClass.ShamsiDate(dateEblagh.AddDays(day6)).Substring(4, 2);
            }
            catch { }

            if (month6 == monthName1 || month6 == monthName2 || month6 == monthName3)
            {
                loSum += (nafarSaat * zarib6);
            }


            Label27.Text = Session["sum1"].ToString();

            return loSum;

        }





        void loadPrice(DateTime dateEblagh, Label lb1, Label lb2, Label lb3, Label lb4, Label lb5, Label lb6, string monthName, int day1, int day2, int day3, int day4, int day5, int day6, int nafarSaat, double zarib1, double zarib2, double zarib3, double zarib4, double zarib5, double zarib6)
        {
            string month = string.Empty;
            string month2 = string.Empty;
            string month3 = string.Empty;
            string month4 = string.Empty;
            string month5 = string.Empty;
            string month6 = string.Empty;

            try
            {
                month = CommonClass.ShamsiDate(dateEblagh.AddDays(day1)).Substring(4, 2);
            }
            catch { }

            if (month == monthName)
            {
                lb1.Text = (nafarSaat * zarib1).ToString();
            }


            try
            {
                month2 = CommonClass.ShamsiDate(dateEblagh.AddDays(day2)).Substring(4, 2);
            }
            catch { }

            if (month2 == monthName)
            {
                lb2.Text = (nafarSaat * zarib2).ToString();
            }


            try
            {
                month3 = CommonClass.ShamsiDate(dateEblagh.AddDays(day3)).Substring(4, 2);
            }
            catch { }

            if (month3 == monthName)
            {
                lb3.Text = (nafarSaat * zarib3).ToString();
            }



            try
            {
                month4 = CommonClass.ShamsiDate(dateEblagh.AddDays(day4)).Substring(4, 2);
            }
            catch { }

            if (month4 == monthName)
            {
                lb4.Text = (nafarSaat * zarib4).ToString();
            }



            try
            {
                month5 = CommonClass.ShamsiDate(dateEblagh.AddDays(day5)).Substring(4, 2);
            }
            catch { }

            if (month5 == monthName)
            {
                lb5.Text = (nafarSaat * zarib5).ToString();
            }



            try
            {
                month6 = CommonClass.ShamsiDate(dateEblagh.AddDays(day6)).Substring(4, 2);
            }
            catch { }

            if (month6 == monthName)
            {
                lb6.Text = (nafarSaat * zarib6).ToString();
            }

        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "mosErsalDate")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label20") as Label;
                try
                {

                    lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;
                }
                catch
                {

                }
            }



            if (e.DataColumn.FieldName == "khAct")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label3") as Label;

                if (lb.Text == "87")
                {
                    lb.Text = "3000";
                }
                else if (lb.Text == "290")
                {
                    lb.Text = "4000";
                }
                else if (lb.Text == "88" || lb.Text == "204")
                {
                    lb.Text = "1500";
                }
                else if (lb.Text == "291")
                {
                    lb.Text = "2500";
                }
                else
                {

                }
            }



            // حجم کلی
            if (e.DataColumn.FieldName == "mosAct")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label4") as Label;

                if (lb.Text == "87")
                {
                    lb.Text = (10 * 155).ToString();
                }
                else if (lb.Text == "290")
                {
                    lb.Text = (15 * 155).ToString();
                }
                else if (lb.Text == "88" || lb.Text == "204")
                {
                    lb.Text = (20 * 155).ToString();
                }
                else if (lb.Text == "291")
                {
                    lb.Text = (25 * 155).ToString();
                }
                else
                {

                }
            }




            //فروردین
            if (e.DataColumn.FieldName == "khId")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label5") as Label;

                Label lbDate = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label18") as Label;
                Label lbOlaviat = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label19") as Label;


                Label lbl1 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label6") as Label;
                Label lbl2 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label13") as Label;
                Label lbl3 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label14") as Label;
                Label lbl4 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label15") as Label;
                Label lbl5 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label16") as Label;
                Label lbl6 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label17") as Label;



                double i = 0;

                // تسهیلات ریالی
                if (lb.Text == "87")
                {

                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        //test-------------------------------------------------------------------------------------------------------------
                        try
                        {
                            i = loadChartPrice(DateTime.Parse(lbDate.Text), "1", "2", "3", 7, 23, 43, 88, 103, 113, 3000, .1, .1, .2, .45, .1, .05,87);
                            Label22.Text = i.ToString();
                        }
                        catch { }


                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "1", 7, 23, 43, 88, 103, 113, 3000, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {



                        //test-------------------------------------------------------------------------------------------------------------
                        try
                        {
                            i = loadChartPrice(DateTime.Parse(lbDate.Text), "1", "2", "3", 14, 53, 83, 143, 163, 173, 3000, .1, .1, .2, .45, .1, .05,87);
                            Label22.Text = i.ToString();
                        }
                        catch { }





                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "1", 14, 53, 83, 143, 163, 173, 3000, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {


                        //test-------------------------------------------------------------------------------------------------------------
                        try
                        {
                            i = loadChartPrice(DateTime.Parse(lbDate.Text), "1", "2", "3", 21, 68, 98, 188, 233, 248, 3000, .1, .1, .2, .45, .1, .05,87);
                            Label23.Text = i.ToString();
                        }
                        catch { }



                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "1", 21, 68, 98, 188, 233, 248, 3000, .1, .1, .2, .45, .1, .05);



                    }
                }
                //تسهیلات ارزی
                else if (lb.Text == "290")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        //test-------------------------------------------------------------------------------------------------------------
                        try
                        {
                            i = loadChartPrice(DateTime.Parse(lbDate.Text), "1", "2", "3", 7, 23, 43, 88, 103, 113, 4000, .1, .1, .2, .45, .1, .05,290);
                            Label24.Text = i.ToString();
                        }
                        catch { }




                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "1", 7, 23, 43, 88, 103, 113, 4000, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {


                        //test-------------------------------------------------------------------------------------------------------------
                        try
                        {
                            i = loadChartPrice(DateTime.Parse(lbDate.Text), "1", "2", "3", 14, 53, 83, 143, 163, 173, 4000, .1, .1, .2, .45, .1, .05,290);
                            Label25.Text = i.ToString();
                        }
                        catch { }



                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "1", 14, 53, 83, 143, 163, 173, 4000, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {

                        //test-------------------------------------------------------------------------------------------------------------
                        try
                        {
                            i = loadChartPrice(DateTime.Parse(lbDate.Text), "1", "2", "3", 21, 68, 98, 188, 233, 248, 4000, .1, .1, .2, .45, .1, .05,290);
                            Label26.Text = i.ToString();
                        }
                        catch { }




                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "1", 21, 68, 98, 188, 233, 248, 4000, .1, .1, .2, .45, .1, .05);
                    }

                }
                // سپرده ریالی و بانکداری اینترنتی
                else if (lb.Text == "88" || lb.Text == "204")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "1", 7, 23, 43, 88, 103, 113, 1500, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "1", 14, 53, 83, 143, 163, 173, 1500, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "1", 21, 68, 98, 188, 233, 248, 1500, .1, .1, .2, .45, .1, .05);
                    }
                }
                //سپرده ارزی
                else if (lb.Text == "291")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "1", 7, 23, 43, 88, 103, 113, 2500, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "1", 14, 53, 83, 143, 163, 173, 2500, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "1", 21, 68, 98, 188, 233, 248, 2500, .1, .1, .2, .45, .1, .05);
                    }
                }
            }



            //خرداد
            if (e.DataColumn.FieldName == "mosDate")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label5") as Label;

                Label lbDate = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label18") as Label;
                Label lbOlaviat = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label19") as Label;


                Label lbl1 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label6") as Label;
                Label lbl2 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label13") as Label;
                Label lbl3 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label14") as Label;
                Label lbl4 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label15") as Label;
                Label lbl5 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label16") as Label;
                Label lbl6 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label17") as Label;

                // تسهیلات ریالی
                if (lb.Text == "87")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "3", 7, 23, 43, 88, 103, 113, 3000, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "3", 14, 53, 83, 143, 163, 173, 3000, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "3", 21, 68, 98, 188, 233, 248, 3000, .1, .1, .2, .45, .1, .05);
                    }
                }
                //تسهیلات ارزی
                else if (lb.Text == "290")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "3", 7, 23, 43, 88, 103, 113, 4000, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "3", 14, 53, 83, 143, 163, 173, 4000, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "3", 21, 68, 98, 188, 233, 248, 4000, .1, .1, .2, .45, .1, .05);
                    }

                }
                // سپرده ریالی و بانکداری اینترنتی
                else if (lb.Text == "88" || lb.Text == "204")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "3", 7, 23, 43, 88, 103, 113, 1500, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "3", 14, 53, 83, 143, 163, 173, 1500, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "3", 21, 68, 98, 188, 233, 248, 1500, .1, .1, .2, .45, .1, .05);
                    }
                }
                //سپرده ارزی
                else if (lb.Text == "291")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "3", 7, 23, 43, 88, 103, 113, 2500, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "3", 14, 53, 83, 143, 163, 173, 2500, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "3", 21, 68, 98, 188, 233, 248, 2500, .1, .1, .2, .45, .1, .05);
                    }
                }
            }



            //اردیبهشت
            if (e.DataColumn.FieldName == "mosId")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label5") as Label;

                Label lbDate = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label18") as Label;
                Label lbOlaviat = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label19") as Label;


                Label lbl1 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label6") as Label;
                Label lbl2 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label13") as Label;
                Label lbl3 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label14") as Label;
                Label lbl4 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label15") as Label;
                Label lbl5 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label16") as Label;
                Label lbl6 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label17") as Label;

                // تسهیلات ریالی
                if (lb.Text == "87")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "2", 7, 23, 43, 88, 103, 113, 3000, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "2", 14, 53, 83, 143, 163, 173, 3000, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "2", 21, 68, 98, 188, 233, 248, 3000, .1, .1, .2, .45, .1, .05);
                    }
                }
                //تسهیلات ارزی
                else if (lb.Text == "290")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "2", 7, 23, 43, 88, 103, 113, 4000, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "2", 14, 53, 83, 143, 163, 173, 4000, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "2", 21, 68, 98, 188, 233, 248, 4000, .1, .1, .2, .45, .1, .05);
                    }

                }
                // سپرده ریالی و بانکداری اینترنتی
                else if (lb.Text == "88" || lb.Text == "204")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "2", 7, 23, 43, 88, 103, 113, 1500, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "2", 14, 53, 83, 143, 163, 173, 1500, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "2", 21, 68, 98, 188, 233, 248, 1500, .1, .1, .2, .45, .1, .05);
                    }
                }
                //سپرده ارزی
                else if (lb.Text == "291")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "2", 7, 23, 43, 88, 103, 113, 2500, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "2", 14, 53, 83, 143, 163, 173, 2500, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "2", 21, 68, 98, 188, 233, 248, 2500, .1, .1, .2, .45, .1, .05);
                    }
                }
            }


            //تیر
            if (e.DataColumn.FieldName == "prId")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label5") as Label;

                Label lbDate = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label18") as Label;
                Label lbOlaviat = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label19") as Label;


                Label lbl1 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label6") as Label;
                Label lbl2 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label13") as Label;
                Label lbl3 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label14") as Label;
                Label lbl4 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label15") as Label;
                Label lbl5 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label16") as Label;
                Label lbl6 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label17") as Label;

                // تسهیلات ریالی
                if (lb.Text == "87")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "4", 7, 23, 43, 88, 103, 113, 3000, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "4", 14, 53, 83, 143, 163, 173, 3000, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "4", 21, 68, 98, 188, 233, 248, 3000, .1, .1, .2, .45, .1, .05);
                    }
                }
                //تسهیلات ارزی
                else if (lb.Text == "290")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "4", 7, 23, 43, 88, 103, 113, 4000, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "4", 14, 53, 83, 143, 163, 173, 4000, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "4", 21, 68, 98, 188, 233, 248, 4000, .1, .1, .2, .45, .1, .05);
                    }

                }
                // سپرده ریالی و بانکداری اینترنتی
                else if (lb.Text == "88" || lb.Text == "204")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "4", 7, 23, 43, 88, 103, 113, 1500, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "4", 14, 53, 83, 143, 163, 173, 1500, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "4", 21, 68, 98, 188, 233, 248, 1500, .1, .1, .2, .45, .1, .05);
                    }
                }
                //سپرده ارزی
                else if (lb.Text == "291")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "4", 7, 23, 43, 88, 103, 113, 2500, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "4", 14, 53, 83, 143, 163, 173, 2500, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "4", 21, 68, 98, 188, 233, 248, 2500, .1, .1, .2, .45, .1, .05);
                    }
                }
            }


            //مرداد
            if (e.DataColumn.FieldName == "mosNumber")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label5") as Label;

                Label lbDate = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label18") as Label;
                Label lbOlaviat = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label19") as Label;


                Label lbl1 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label6") as Label;
                Label lbl2 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label13") as Label;
                Label lbl3 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label14") as Label;
                Label lbl4 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label15") as Label;
                Label lbl5 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label16") as Label;
                Label lbl6 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label17") as Label;

                // تسهیلات ریالی
                if (lb.Text == "87")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "5", 7, 23, 43, 88, 103, 113, 3000, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "5", 14, 53, 83, 143, 163, 173, 3000, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "5", 21, 68, 98, 188, 233, 248, 3000, .1, .1, .2, .45, .1, .05);
                    }
                }
                //تسهیلات ارزی
                else if (lb.Text == "290")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "5", 7, 23, 43, 88, 103, 113, 4000, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "5", 14, 53, 83, 143, 163, 173, 4000, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "5", 21, 68, 98, 188, 233, 248, 4000, .1, .1, .2, .45, .1, .05);
                    }

                }
                // سپرده ریالی و بانکداری اینترنتی
                else if (lb.Text == "88" || lb.Text == "204")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "5", 7, 23, 43, 88, 103, 113, 1500, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "5", 14, 53, 83, 143, 163, 173, 1500, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "5", 21, 68, 98, 188, 233, 248, 1500, .1, .1, .2, .45, .1, .05);
                    }
                }
                //سپرده ارزی
                else if (lb.Text == "291")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "5", 7, 23, 43, 88, 103, 113, 2500, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "5", 14, 53, 83, 143, 163, 173, 2500, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "5", 21, 68, 98, 188, 233, 248, 2500, .1, .1, .2, .45, .1, .05);
                    }
                }

            }



            //شهریور
            if (e.DataColumn.FieldName == "mosSRS")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label5") as Label;

                Label lbDate = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label18") as Label;
                Label lbOlaviat = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label19") as Label;


                Label lbl1 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label6") as Label;
                Label lbl2 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label13") as Label;
                Label lbl3 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label14") as Label;
                Label lbl4 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label15") as Label;
                Label lbl5 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label16") as Label;
                Label lbl6 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label17") as Label;

                // تسهیلات ریالی
                if (lb.Text == "87")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "6", 7, 23, 43, 88, 103, 113, 3000, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "6", 14, 53, 83, 143, 163, 173, 3000, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "6", 21, 68, 98, 188, 233, 248, 3000, .1, .1, .2, .45, .1, .05);
                    }
                }
                //تسهیلات ارزی
                else if (lb.Text == "290")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "6", 7, 23, 43, 88, 103, 113, 4000, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "6", 14, 53, 83, 143, 163, 173, 4000, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "6", 21, 68, 98, 188, 233, 248, 4000, .1, .1, .2, .45, .1, .05);
                    }

                }
                // سپرده ریالی و بانکداری اینترنتی
                else if (lb.Text == "88" || lb.Text == "204")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "6", 7, 23, 43, 88, 103, 113, 1500, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "6", 14, 53, 83, 143, 163, 173, 1500, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "6", 21, 68, 98, 188, 233, 248, 1500, .1, .1, .2, .45, .1, .05);
                    }
                }
                //سپرده ارزی
                else if (lb.Text == "291")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "6", 7, 23, 43, 88, 103, 113, 2500, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "6", 14, 53, 83, 143, 163, 173, 2500, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "6", 21, 68, 98, 188, 233, 248, 2500, .1, .1, .2, .45, .1, .05);
                    }
                }
            }

            //مهر
            if (e.DataColumn.FieldName == "mosPropozal")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label5") as Label;

                Label lbDate = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label18") as Label;
                Label lbOlaviat = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label19") as Label;


                Label lbl1 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label6") as Label;
                Label lbl2 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label13") as Label;
                Label lbl3 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label14") as Label;
                Label lbl4 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label15") as Label;
                Label lbl5 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label16") as Label;
                Label lbl6 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label17") as Label;

                // تسهیلات ریالی
                if (lb.Text == "87")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "7", 7, 23, 43, 88, 103, 113, 3000, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "7", 14, 53, 83, 143, 163, 173, 3000, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "7", 21, 68, 98, 188, 233, 248, 3000, .1, .1, .2, .45, .1, .05);
                    }
                }
                //تسهیلات ارزی
                else if (lb.Text == "290")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "7", 7, 23, 43, 88, 103, 113, 4000, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "7", 14, 53, 83, 143, 163, 173, 4000, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "7", 21, 68, 98, 188, 233, 248, 4000, .1, .1, .2, .45, .1, .05);
                    }

                }
                // سپرده ریالی و بانکداری اینترنتی
                else if (lb.Text == "88" || lb.Text == "204")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "7", 7, 23, 43, 88, 103, 113, 1500, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "7", 14, 53, 83, 143, 163, 173, 1500, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "7", 21, 68, 98, 188, 233, 248, 1500, .1, .1, .2, .45, .1, .05);
                    }
                }
                //سپرده ارزی
                else if (lb.Text == "291")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "7", 7, 23, 43, 88, 103, 113, 2500, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "7", 14, 53, 83, 143, 163, 173, 2500, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "7", 21, 68, 98, 188, 233, 248, 2500, .1, .1, .2, .45, .1, .05);
                    }
                }
            }



            //آبان
            if (e.DataColumn.FieldName == "prVahed")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label5") as Label;

                Label lbDate = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label18") as Label;
                Label lbOlaviat = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label19") as Label;


                Label lbl1 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label6") as Label;
                Label lbl2 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label13") as Label;
                Label lbl3 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label14") as Label;
                Label lbl4 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label15") as Label;
                Label lbl5 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label16") as Label;
                Label lbl6 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label17") as Label;

                // تسهیلات ریالی
                if (lb.Text == "87")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "8", 7, 23, 43, 88, 103, 113, 3000, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "8", 14, 53, 83, 143, 163, 173, 3000, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "8", 21, 68, 98, 188, 233, 248, 3000, .1, .1, .2, .45, .1, .05);
                    }
                }
                //تسهیلات ارزی
                else if (lb.Text == "290")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "8", 7, 23, 43, 88, 103, 113, 4000, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "8", 14, 53, 83, 143, 163, 173, 4000, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "8", 21, 68, 98, 188, 233, 248, 4000, .1, .1, .2, .45, .1, .05);
                    }

                }
                // سپرده ریالی و بانکداری اینترنتی
                else if (lb.Text == "88" || lb.Text == "204")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "8", 7, 23, 43, 88, 103, 113, 1500, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "8", 14, 53, 83, 143, 163, 173, 1500, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "8", 21, 68, 98, 188, 233, 248, 1500, .1, .1, .2, .45, .1, .05);
                    }
                }
                //سپرده ارزی
                else if (lb.Text == "291")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "8", 7, 23, 43, 88, 103, 113, 2500, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "8", 14, 53, 83, 143, 163, 173, 2500, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "8", 21, 68, 98, 188, 233, 248, 2500, .1, .1, .2, .45, .1, .05);
                    }
                }
            }



            //آذر
            if (e.DataColumn.FieldName == "prPeymankar")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label5") as Label;

                Label lbDate = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label18") as Label;
                Label lbOlaviat = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label19") as Label;


                Label lbl1 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label6") as Label;
                Label lbl2 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label13") as Label;
                Label lbl3 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label14") as Label;
                Label lbl4 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label15") as Label;
                Label lbl5 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label16") as Label;
                Label lbl6 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label17") as Label;

                // تسهیلات ریالی
                if (lb.Text == "87")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "9", 7, 23, 43, 88, 103, 113, 3000, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "9", 14, 53, 83, 143, 163, 173, 3000, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "9", 21, 68, 98, 188, 233, 248, 3000, .1, .1, .2, .45, .1, .05);
                    }
                }
                //تسهیلات ارزی
                else if (lb.Text == "290")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "9", 7, 23, 43, 88, 103, 113, 4000, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "9", 14, 53, 83, 143, 163, 173, 4000, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "9", 21, 68, 98, 188, 233, 248, 4000, .1, .1, .2, .45, .1, .05);
                    }

                }
                // سپرده ریالی و بانکداری اینترنتی
                else if (lb.Text == "88" || lb.Text == "204")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "9", 7, 23, 43, 88, 103, 113, 1500, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "9", 14, 53, 83, 143, 163, 173, 1500, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "9", 21, 68, 98, 188, 233, 248, 1500, .1, .1, .2, .45, .1, .05);
                    }
                }
                //سپرده ارزی
                else if (lb.Text == "291")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "9", 7, 23, 43, 88, 103, 113, 2500, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "9", 14, 53, 83, 143, 163, 173, 2500, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "9", 21, 68, 98, 188, 233, 248, 2500, .1, .1, .2, .45, .1, .05);
                    }
                }

            }



            //دی
            if (e.DataColumn.FieldName == "mosShenase")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label5") as Label;

                Label lbDate = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label18") as Label;
                Label lbOlaviat = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label19") as Label;


                Label lbl1 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label6") as Label;
                Label lbl2 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label13") as Label;
                Label lbl3 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label14") as Label;
                Label lbl4 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label15") as Label;
                Label lbl5 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label16") as Label;
                Label lbl6 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label17") as Label;

                // تسهیلات ریالی
                if (lb.Text == "87")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "10", 7, 23, 43, 88, 103, 113, 3000, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "10", 14, 53, 83, 143, 163, 173, 3000, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "10", 21, 68, 98, 188, 233, 248, 3000, .1, .1, .2, .45, .1, .05);
                    }
                }
                //تسهیلات ارزی
                else if (lb.Text == "290")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "10", 7, 23, 43, 88, 103, 113, 4000, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "10", 14, 53, 83, 143, 163, 173, 4000, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "10", 21, 68, 98, 188, 233, 248, 4000, .1, .1, .2, .45, .1, .05);
                    }

                }
                // سپرده ریالی و بانکداری اینترنتی
                else if (lb.Text == "88" || lb.Text == "204")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "10", 7, 23, 43, 88, 103, 113, 1500, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "10", 14, 53, 83, 143, 163, 173, 1500, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "10", 21, 68, 98, 188, 233, 248, 1500, .1, .1, .2, .45, .1, .05);
                    }
                }
                //سپرده ارزی
                else if (lb.Text == "291")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "10", 7, 23, 43, 88, 103, 113, 2500, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "10", 14, 53, 83, 143, 163, 173, 2500, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "10", 21, 68, 98, 188, 233, 248, 2500, .1, .1, .2, .45, .1, .05);
                    }
                }
            }


            //بهمن
            if (e.DataColumn.FieldName == "mosSRSanswer")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label5") as Label;

                Label lbDate = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label18") as Label;
                Label lbOlaviat = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label19") as Label;


                Label lbl1 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label6") as Label;
                Label lbl2 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label13") as Label;
                Label lbl3 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label14") as Label;
                Label lbl4 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label15") as Label;
                Label lbl5 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label16") as Label;
                Label lbl6 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label17") as Label;

                // تسهیلات ریالی
                if (lb.Text == "87")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "11", 7, 23, 43, 88, 103, 113, 3000, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "11", 14, 53, 83, 143, 163, 173, 3000, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "11", 21, 68, 98, 188, 233, 248, 3000, .1, .1, .2, .45, .1, .05);
                    }
                }
                //تسهیلات ارزی
                else if (lb.Text == "290")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "11", 7, 23, 43, 88, 103, 113, 4000, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "11", 14, 53, 83, 143, 163, 173, 4000, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "11", 21, 68, 98, 188, 233, 248, 4000, .1, .1, .2, .45, .1, .05);
                    }

                }
                // سپرده ریالی و بانکداری اینترنتی
                else if (lb.Text == "88" || lb.Text == "204")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "11", 7, 23, 43, 88, 103, 113, 1500, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "11", 14, 53, 83, 143, 163, 173, 1500, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "11", 21, 68, 98, 188, 233, 248, 1500, .1, .1, .2, .45, .1, .05);
                    }
                }
                //سپرده ارزی
                else if (lb.Text == "291")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "11", 7, 23, 43, 88, 103, 113, 2500, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "11", 14, 53, 83, 143, 163, 173, 2500, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "11", 21, 68, 98, 188, 233, 248, 2500, .1, .1, .2, .45, .1, .05);
                    }
                }
            }


            //اسفند
            if (e.DataColumn.FieldName == "prProjectStatus")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label5") as Label;

                Label lbDate = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label18") as Label;
                Label lbOlaviat = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label19") as Label;


                Label lbl1 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label6") as Label;
                Label lbl2 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label13") as Label;
                Label lbl3 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label14") as Label;
                Label lbl4 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label15") as Label;
                Label lbl5 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label16") as Label;
                Label lbl6 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label17") as Label;

                // تسهیلات ریالی
                if (lb.Text == "87")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "12", 7, 23, 43, 88, 103, 113, 3000, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "12", 14, 53, 83, 143, 163, 173, 3000, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "12", 21, 68, 98, 188, 233, 248, 3000, .1, .1, .2, .45, .1, .05);
                    }
                }
                //تسهیلات ارزی
                else if (lb.Text == "290")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "12", 7, 23, 43, 88, 103, 113, 4000, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "12", 14, 53, 83, 143, 163, 173, 4000, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "12", 21, 68, 98, 188, 233, 248, 4000, .1, .1, .2, .45, .1, .05);
                    }

                }
                // سپرده ریالی و بانکداری اینترنتی
                else if (lb.Text == "88" || lb.Text == "204")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "12", 7, 23, 43, 88, 103, 113, 1500, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "12", 14, 53, 83, 143, 163, 173, 1500, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "12", 21, 68, 98, 188, 233, 248, 1500, .1, .1, .2, .45, .1, .05);
                    }
                }
                //سپرده ارزی
                else if (lb.Text == "291")
                {
                    //فوری ------------------------------------------------------
                    if (lbOlaviat.Text == "173")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "12", 7, 23, 43, 88, 103, 113, 2500, .1, .1, .2, .45, .1, .05);
                    }
                    //متوسط ------------------------------------------------------
                    else if (lbOlaviat.Text == "174")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "12", 14, 53, 83, 143, 163, 173, 2500, .1, .1, .2, .45, .1, .05);
                    }
                    //عادی ------------------------------------------------------
                    else if (lbOlaviat.Text == "175")
                    {
                        loadPrice(DateTime.Parse(lbDate.Text), lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, "12", 21, 68, 98, 188, 233, 248, 2500, .1, .1, .2, .45, .1, .05);
                    }
                }

            }




        }
    }
}
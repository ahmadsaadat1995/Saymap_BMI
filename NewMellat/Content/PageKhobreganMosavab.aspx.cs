using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Globalization;
using System.Web.UI.WebControls;
using DevExpress.Web;
using NewMellat.Code;

namespace NewMellat.Content
{
    public partial class PageKhobreganMosavab : System.Web.UI.Page
    {
        NewMellatEntities db = new NewMellatEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //PersianCalendar1.Date = DateTime.Now;


                // load dates

                for (int i = 1; i <= 31; i++)
                {
                    drpDay.Items.Add(new ListEditItem(i.ToString(), i.ToString()));
                    drpDayAmaliti.Items.Add(new ListEditItem(i.ToString(), i.ToString()));
                    drpDayPropozal.Items.Add(new ListEditItem(i.ToString(), i.ToString()));
                    drpDaySRS.Items.Add(new ListEditItem(i.ToString(), i.ToString()));
                    drpDaySRSanswer.Items.Add(new ListEditItem(i.ToString(), i.ToString()));

                }


                for (int i = 1; i <= 12; i++)
                {
                    drpMonth.Items.Add(new ListEditItem(i.ToString(), i.ToString()));
                    drpMonthAmaliti.Items.Add(new ListEditItem(i.ToString(), i.ToString()));
                    drpMonthPropozal.Items.Add(new ListEditItem(i.ToString(), i.ToString()));
                    drpMonthSRS.Items.Add(new ListEditItem(i.ToString(), i.ToString()));
                    drpMonthSRSanswer.Items.Add(new ListEditItem(i.ToString(), i.ToString()));
                }

                PersianCalendar pCal = new PersianCalendar();
                for (int i = 1385; i <=pCal.GetYear(DateTime.Now)+1; i++)
                {
                    drpYear.Items.Add(new ListEditItem(i.ToString(), i.ToString()));
                    drpYearAmaliti.Items.Add(new ListEditItem(i.ToString(), i.ToString()));
                    drpYearPropozal.Items.Add(new ListEditItem(i.ToString(), i.ToString()));
                    drpYearSRSanswer.Items.Add(new ListEditItem(i.ToString(), i.ToString()));
                    drpYearSRS.Items.Add(new ListEditItem(i.ToString(), i.ToString()));

                }

                PersianCalendar pc2 = new PersianCalendar();
                var dtToday = DateTime.Now;
                var dayToday =pc2.GetDayOfMonth(dtToday);
                var MonthToday = pc2.GetMonth(dtToday);
                var yearToday = pc2.GetYear(dtToday);

                drpDay.Value = dayToday;
                drpDayAmaliti.Value = dayToday;
                drpDayPropozal.Value = dayToday;
                drpDaySRS.Value = dayToday;
                drpDaySRSanswer.Value = dayToday;


                drpMonth.SelectedIndex = MonthToday-1;
                drpMonthAmaliti.SelectedIndex = MonthToday-1;
                drpMonthPropozal.SelectedIndex = MonthToday-1;
                drpMonthSRS.SelectedIndex = MonthToday-1;
                drpMonthSRSanswer.SelectedIndex = MonthToday-1;



                drpYear.SelectedIndex = yearToday;
                drpYearAmaliti.SelectedIndex = yearToday;
                drpYearPropozal.SelectedIndex = yearToday;
                drpYearSRS.SelectedIndex = yearToday;
                drpYearSRSanswer.SelectedIndex = yearToday;



                //---------------

                //نوع سند
                int intId = Convert.ToInt32(Request.QueryString["id"]);
                var info = db.tbKhbregans.SingleOrDefault(n => n.khId == intId);
                var olaviat = db.tbProjects.SingleOrDefault(n => n.prId == info.khProject.Value);



                try
                {
                    lbOlaviatName.Text = db.prInformations.SingleOrDefault(n => n.infId == olaviat.prSanadType.Value).infTitle;
                }
                catch
                {

                }


                HiddenField1.Value = olaviat.prSanadType == null? "1": olaviat.prSanadType.Value.ToString();


                if (HiddenField1.Value == "181" || HiddenField1.Value == "178")
                {
                    drpPropozal.Visible = true;
                    Label20.Visible = true;
                }
            }
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {

            DateTime dtDate = Persia.Calendar.ConvertToGregorian(Convert.ToInt32(drpYear.Value), Convert.ToInt32(drpMonth.Value), Convert.ToInt32(drpDay.Value));

            DateTime dtDateSRSanswer = Persia.Calendar.ConvertToGregorian(Convert.ToInt32(drpYearSRSanswer.Value), Convert.ToInt32(drpMonthSRSanswer.Value), Convert.ToInt32(drpDaySRSanswer.Value));

            DateTime dtDatePropozal = Persia.Calendar.ConvertToGregorian(Convert.ToInt32(drpYearPropozal.Value), Convert.ToInt32(drpMonthPropozal.Value), Convert.ToInt32(drpDayPropozal.Value));

            DateTime dtDatesSRS = Persia.Calendar.ConvertToGregorian(Convert.ToInt32(drpYearSRS.Value), Convert.ToInt32(drpMonthSRS.Value), Convert.ToInt32(drpDaySRS.Value));

            DateTime dtDatesAmaliati = Persia.Calendar.ConvertToGregorian(Convert.ToInt32(drpYearAmaliti.Value), Convert.ToInt32(drpMonthAmaliti.Value), Convert.ToInt32(drpDayAmaliti.Value));



            sourceMosavab.InsertParameters["mosDate"].DefaultValue = dtDate.ToShortDateString();

            if (chkAmaliati.Checked)
            {
                sourceMosavab.InsertParameters["mosAmaliatiDate"].DefaultValue = dtDatesAmaliati.ToShortDateString();

            }


            if (chkPropozal.Checked)
            {
                sourceMosavab.InsertParameters["mosErsalDate"].DefaultValue = dtDatePropozal.ToShortDateString();

            }


            if (chkSRS.Checked)
            {
                sourceMosavab.InsertParameters["mosSRS"].DefaultValue = dtDatesSRS.ToShortDateString();

            }


            if (chkSRSanswer.Checked)
            {

                sourceMosavab.InsertParameters["mosSRSanswer"].DefaultValue = dtDateSRSanswer.ToShortDateString();

            }



            sourceMosavab.Insert();


            if (FileUpload1.HasFile)
            {
                // ثبت فایل
                sourceFile.InsertParameters["fiDate"].DefaultValue = DateTime.Now.ToShortDateString();

                sourceFile.Insert();
            }





            // به روز رسانی خبرگان
            int intID = Convert.ToInt32(Request.QueryString["id"]);
            var info = db.tbKhbregans.SingleOrDefault(n => n.khId == intID);
            var project = db.tbProjects.SingleOrDefault(p=> p.prId == info.khProject);
            if (project != null && drpOlaviat.Value != null)
            { 
                project.prOlaviat = Convert.ToInt32(drpOlaviat.Value.ToString());
                db.SaveChanges();
            }
            info.khStatus = 1;
            db.SaveChanges();

            ASPxGridView1.DataBind();

            VendiaServiceManager manager = new VendiaServiceManager();

            RadNotification1.Show("اطلاعات با موفقیت به ثبت رسید");


        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {

            if (e.DataColumn.FieldName == "mosDate")
            {
                try
                {
                    Label lb =
                        ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label16") as Label;
                    lb.Text = CommonClass.ShamsiDate(Convert.ToDateTime(lb.Text)).Insert(4, "/").Insert(7, "/");
                }
                catch { }
            }

            if (e.DataColumn.FieldName == "mosErsalDate")
            {
                try
                {
                    Label lb =
                        ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label17") as Label;
                    lb.Text = CommonClass.ShamsiDate(Convert.ToDateTime(lb.Text)).Insert(4, "/").Insert(7, "/");
                }
                catch { }
            }


            if (e.DataColumn.FieldName == "mosAmaliatiDate")
            {
                try
                {
                    Label lb =
                        ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label18") as Label;
                    lb.Text = CommonClass.ShamsiDate(Convert.ToDateTime(lb.Text)).Insert(4, "/").Insert(7, "/");
                }
                catch { }
            }


        }

        protected void drpOlaviat_DataBound(object sender, EventArgs e)
        {
        }

        protected void drpOlaviat_SelectedIndexChanged(object sender, EventArgs e)
        {
            int intId = Convert.ToInt32(Request.QueryString["id"]);

            var khobregan = db.tbKhbregans.SingleOrDefault(n => n.khId == intId);

            DateTime date = khobregan.khJalaseDate.Value;



            //DateTime dtDate = Persia.Calendar.ConvertToGregorian(Convert.ToInt32(drpYear.Value), Convert.ToInt32(drpMonth.Value), Convert.ToInt32(drpDay.Value));

            //DateTime dtDateSRSanswer = Persia.Calendar.ConvertToGregorian(Convert.ToInt32(drpYearSRSanswer.Value), Convert.ToInt32(drpMonthSRSanswer.Value), Convert.ToInt32(drpDaySRSanswer.Value));

            //DateTime dtDatePropozal = Persia.Calendar.ConvertToGregorian(Convert.ToInt32(drpYearPropozal.Value), Convert.ToInt32(drpMonthPropozal.Value), Convert.ToInt32(drpDayPropozal.Value));

            //DateTime dtDatesSRS = Persia.Calendar.ConvertToGregorian(Convert.ToInt32(drpYearSRS.Value), Convert.ToInt32(drpMonthSRS.Value), Convert.ToInt32(drpDaySRS.Value));

            //DateTime dtDatesAmaliati = Persia.Calendar.ConvertToGregorian(Convert.ToInt32(drpYearAmaliti.Value), Convert.ToInt32(drpMonthAmaliti.Value), Convert.ToInt32(drpDayAmaliti.Value));



            DateTime dtDate = date;

            DateTime dtDateSRSanswer = date;

            DateTime dtDatePropozal = date;

            DateTime dtDatesSRS = date;

            DateTime dtDatesAmaliati = date;




            PersianCalendar pc = new PersianCalendar();

            // فرم ثبت و کنترل تغییرات
            if (HiddenField1.Value == "178")
            {
                if (drpOlaviat.SelectedIndex == 0)
                {
                    //  PersianCalendarAmaliti.SelectedDate = date.AddMonths(2);
                    dtDatesAmaliati = dtDatesAmaliati.AddMonths(2);
                    drpDayAmaliti.Value = pc.GetDayOfMonth(dtDatesAmaliati);
                    drpMonthAmaliti.Value = pc.GetMonth(dtDatesAmaliati);
                    drpYearAmaliti.Value = pc.GetYear(dtDatesAmaliati);


                    //   PersianCalendarPropozal.SelectedDate = date.AddDays(30);
                    dtDatePropozal = dtDatePropozal.AddDays(30);
                    drpDayPropozal.Value = pc.GetDayOfMonth(dtDatePropozal);
                    drpMonthPropozal.Value = pc.GetMonth(dtDatePropozal);
                    drpYearPropozal.Value = pc.GetYear(dtDatePropozal);


                    // PersianCalendarSRS.SelectedDate = date.AddDays(7);
                    dtDatesSRS = dtDatesSRS.AddDays(7);
                    drpDaySRS.Value = pc.GetDayOfMonth(dtDatesSRS);
                    drpMonthSRS.Value = pc.GetMonth(dtDatesSRS);
                    drpYearSRS.Value = pc.GetYear(dtDatesSRS);


                    // PersianCalendarSRSanswer.SelectedDate = PersianCalendarSRS.SelectedDate.Value.AddDays(7);
                    dtDateSRSanswer = dtDatesSRS.AddDays(7);
                    drpDaySRSanswer.Value = pc.GetDayOfMonth(dtDateSRSanswer);
                    drpMonthSRSanswer.Value = pc.GetMonth(dtDateSRSanswer);
                    drpYearSRSanswer.Value = pc.GetYear(dtDateSRSanswer);



                }
                else if (drpOlaviat.SelectedIndex == 1)
                {
                    //PersianCalendarAmaliti.SelectedDate = date.AddMonths(4);
                    //PersianCalendarPropozal.SelectedDate = date.AddDays(60);
                    //PersianCalendarSRS.SelectedDate = date.AddDays(14);
                    //PersianCalendarSRSanswer.SelectedDate = PersianCalendarSRS.SelectedDate.Value.AddDays(7);

                    dtDatesAmaliati = dtDatesAmaliati.AddMonths(4);
                    drpDayAmaliti.Value = pc.GetDayOfMonth(dtDatesAmaliati);
                    drpMonthAmaliti.Value = pc.GetMonth(dtDatesAmaliati);
                    drpYearAmaliti.Value = pc.GetYear(dtDatesAmaliati);


                    dtDatePropozal = dtDatePropozal.AddDays(60);
                    drpDayPropozal.Value = pc.GetDayOfMonth(dtDatePropozal);
                    drpMonthPropozal.Value = pc.GetMonth(dtDatePropozal);
                    drpYearPropozal.Value = pc.GetYear(dtDatePropozal);


                    dtDatesSRS = dtDatesSRS.AddDays(14);
                    drpDaySRS.Value = pc.GetDayOfMonth(dtDatesSRS);
                    drpMonthSRS.Value = pc.GetMonth(dtDatesSRS);
                    drpYearSRS.Value = pc.GetYear(dtDatesSRS);


                    dtDateSRSanswer = dtDatesSRS.AddDays(7);
                    drpDaySRSanswer.Value = pc.GetDayOfMonth(dtDateSRSanswer);
                    drpMonthSRSanswer.Value = pc.GetMonth(dtDateSRSanswer);
                    drpYearSRSanswer.Value = pc.GetYear(dtDateSRSanswer);




                }
                else if (drpOlaviat.SelectedIndex == 2)
                    //{
                    //    PersianCalendarAmaliti.SelectedDate = date.AddMonths(6);
                    //    PersianCalendarPropozal.SelectedDate = date.AddDays(75);
                    //    PersianCalendarSRS.SelectedDate = date.AddDays(21);
                    //    PersianCalendarSRSanswer.SelectedDate = PersianCalendarSRS.SelectedDate.Value.AddDays(7);

                    dtDatesAmaliati = dtDatesAmaliati.AddMonths(6);
                drpDayAmaliti.Value = pc.GetDayOfMonth(dtDatesAmaliati);
                drpMonthAmaliti.Value = pc.GetMonth(dtDatesAmaliati);
                drpYearAmaliti.Value = pc.GetYear(dtDatesAmaliati);


                dtDatePropozal = dtDatePropozal.AddDays(75);
                drpDayPropozal.Value = pc.GetDayOfMonth(dtDatePropozal);
                drpMonthPropozal.Value = pc.GetMonth(dtDatePropozal);
                drpYearPropozal.Value = pc.GetYear(dtDatePropozal);


                dtDatesSRS = dtDatesSRS.AddDays(21);
                drpDaySRS.Value = pc.GetDayOfMonth(dtDatesSRS);
                drpMonthSRS.Value = pc.GetMonth(dtDatesSRS);
                drpYearSRS.Value = pc.GetYear(dtDatesSRS);


                dtDateSRSanswer = dtDatesSRS.AddDays(7);
                drpDaySRSanswer.Value = pc.GetDayOfMonth(dtDateSRSanswer);
                drpMonthSRSanswer.Value = pc.GetMonth(dtDateSRSanswer);
                drpYearSRSanswer.Value = pc.GetYear(dtDateSRSanswer);



            }
            //} //سند چشم انداز کسب و کار 

            else if (HiddenField1.Value == "179")
            {
                if (drpOlaviat.SelectedIndex == 0)
                {
                    //PersianCalendarPropozal.SelectedDate = date.AddDays(30);
                    //PersianCalendarSRS.SelectedDate = date.AddDays(7);
                    //PersianCalendarSRSanswer.SelectedDate = PersianCalendarSRS.SelectedDate.Value.AddDays(7);
                    //PersianCalendarAmaliti.SelectedDate = DateTime.Now;

                    dtDatesAmaliati = DateTime.Now;
                    drpDayAmaliti.Value = pc.GetDayOfMonth(dtDatesAmaliati);
                    drpMonthAmaliti.Value = pc.GetMonth(dtDatesAmaliati);
                    drpYearAmaliti.Value = pc.GetYear(dtDatesAmaliati);


                    dtDatePropozal = dtDatePropozal.AddDays(30);
                    drpDayPropozal.Value = pc.GetDayOfMonth(dtDatePropozal);
                    drpMonthPropozal.Value = pc.GetMonth(dtDatePropozal);
                    drpYearPropozal.Value = pc.GetYear(dtDatePropozal);


                    dtDatesSRS = dtDatesSRS.AddDays(7);
                    drpDaySRS.Value = pc.GetDayOfMonth(dtDatesSRS);
                    drpMonthSRS.Value = pc.GetMonth(dtDatesSRS);
                    drpYearSRS.Value = pc.GetYear(dtDatesSRS);


                    dtDateSRSanswer = dtDatesSRS.AddDays(7);
                    drpDaySRSanswer.Value = pc.GetDayOfMonth(dtDateSRSanswer);
                    drpMonthSRSanswer.Value = pc.GetMonth(dtDateSRSanswer);
                    drpYearSRSanswer.Value = pc.GetYear(dtDateSRSanswer);

                }
                else if (drpOlaviat.SelectedIndex == 1)
                {
                    //PersianCalendarPropozal.SelectedDate = date.AddDays(60);
                    //PersianCalendarSRS.SelectedDate = date.AddDays(14);
                    //PersianCalendarSRSanswer.SelectedDate = PersianCalendarSRS.SelectedDate.Value.AddDays(7);
                    //PersianCalendarAmaliti.SelectedDate = DateTime.Now;

                    dtDatesAmaliati = DateTime.Now;
                    drpDayAmaliti.Value = pc.GetDayOfMonth(dtDatesAmaliati);
                    drpMonthAmaliti.Value = pc.GetMonth(dtDatesAmaliati);
                    drpYearAmaliti.Value = pc.GetYear(dtDatesAmaliati);


                    dtDatePropozal = dtDatePropozal.AddDays(60);
                    drpDayPropozal.Value = pc.GetDayOfMonth(dtDatePropozal);
                    drpMonthPropozal.Value = pc.GetMonth(dtDatePropozal);
                    drpYearPropozal.Value = pc.GetYear(dtDatePropozal);


                    dtDatesSRS = dtDatesSRS.AddDays(14);
                    drpDaySRS.Value = pc.GetDayOfMonth(dtDatesSRS);
                    drpMonthSRS.Value = pc.GetMonth(dtDatesSRS);
                    drpYearSRS.Value = pc.GetYear(dtDatesSRS);


                    dtDateSRSanswer = dtDatesSRS.AddDays(7);
                    drpDaySRSanswer.Value = pc.GetDayOfMonth(dtDateSRSanswer);
                    drpMonthSRSanswer.Value = pc.GetMonth(dtDateSRSanswer);
                    drpYearSRSanswer.Value = pc.GetYear(dtDateSRSanswer);



                }
                else if (drpOlaviat.SelectedIndex == 2)
                {
                    //PersianCalendarPropozal.SelectedDate = date.AddDays(75);
                    //PersianCalendarSRS.SelectedDate = date.AddDays(21);
                    //PersianCalendarSRSanswer.SelectedDate = PersianCalendarSRS.SelectedDate.Value.AddDays(7);
                    //PersianCalendarAmaliti.SelectedDate = DateTime.Now;

                    dtDatesAmaliati = DateTime.Now;
                    drpDayAmaliti.Value = pc.GetDayOfMonth(dtDatesAmaliati);
                    drpMonthAmaliti.Value = pc.GetMonth(dtDatesAmaliati);
                    drpYearAmaliti.Value = pc.GetYear(dtDatesAmaliati);


                    dtDatePropozal = dtDatePropozal.AddDays(75);
                    drpDayPropozal.Value = pc.GetDayOfMonth(dtDatePropozal);
                    drpMonthPropozal.Value = pc.GetMonth(dtDatePropozal);
                    drpYearPropozal.Value = pc.GetYear(dtDatePropozal);


                    dtDatesSRS = dtDatesSRS.AddDays(21);
                    drpDaySRS.Value = pc.GetDayOfMonth(dtDatesSRS);
                    drpMonthSRS.Value = pc.GetMonth(dtDatesSRS);
                    drpYearSRS.Value = pc.GetYear(dtDatesSRS);


                    dtDateSRSanswer = dtDatesSRS.AddDays(7);
                    drpDaySRSanswer.Value = pc.GetDayOfMonth(dtDateSRSanswer);
                    drpMonthSRSanswer.Value = pc.GetMonth(dtDateSRSanswer);
                    drpYearSRSanswer.Value = pc.GetYear(dtDateSRSanswer);


                }
            }
            else if (HiddenField1.Value == "181")
            {
                if (drpOlaviat.SelectedIndex == 0)
                {
                    //PersianCalendarPropozal.SelectedDate = date.AddDays(30);
                    //PersianCalendarSRS.SelectedDate = date.AddDays(7);
                    //PersianCalendarSRSanswer.SelectedDate = PersianCalendarSRS.SelectedDate.Value.AddDays(7);
                    //PersianCalendarAmaliti.SelectedDate = DateTime.Now;


                    dtDatesAmaliati = DateTime.Now;
                    drpDayAmaliti.Value = pc.GetDayOfMonth(dtDatesAmaliati);
                    drpMonthAmaliti.Value = pc.GetMonth(dtDatesAmaliati);
                    drpYearAmaliti.Value = pc.GetYear(dtDatesAmaliati);


                    dtDatePropozal = dtDatePropozal.AddDays(30);
                    drpDayPropozal.Value = pc.GetDayOfMonth(dtDatePropozal);
                    drpMonthPropozal.Value = pc.GetMonth(dtDatePropozal);
                    drpYearPropozal.Value = pc.GetYear(dtDatePropozal);


                    dtDatesSRS = dtDatesSRS.AddDays(7);
                    drpDaySRS.Value = pc.GetDayOfMonth(dtDatesSRS);
                    drpMonthSRS.Value = pc.GetMonth(dtDatesSRS);
                    drpYearSRS.Value = pc.GetYear(dtDatesSRS);


                    dtDateSRSanswer = dtDatesSRS.AddDays(7);
                    drpDaySRSanswer.Value = pc.GetDayOfMonth(dtDateSRSanswer);
                    drpMonthSRSanswer.Value = pc.GetMonth(dtDateSRSanswer);
                    drpYearSRSanswer.Value = pc.GetYear(dtDateSRSanswer);



                }
                else if (drpOlaviat.SelectedIndex == 1)
                {
                    //PersianCalendarPropozal.SelectedDate = date.AddDays(60);
                    //PersianCalendarSRS.SelectedDate = date.AddDays(14);
                    //PersianCalendarSRSanswer.SelectedDate = PersianCalendarSRS.SelectedDate.Value.AddDays(7);
                    //PersianCalendarAmaliti.SelectedDate = DateTime.Now;

                    dtDatesAmaliati = DateTime.Now;
                    drpDayAmaliti.Value = pc.GetDayOfMonth(dtDatesAmaliati);
                    drpMonthAmaliti.Value = pc.GetMonth(dtDatesAmaliati);
                    drpYearAmaliti.Value = pc.GetYear(dtDatesAmaliati);


                    dtDatePropozal = dtDatePropozal.AddDays(60);
                    drpDayPropozal.Value = pc.GetDayOfMonth(dtDatePropozal);
                    drpMonthPropozal.Value = pc.GetMonth(dtDatePropozal);
                    drpYearPropozal.Value = pc.GetYear(dtDatePropozal);


                    dtDatesSRS = dtDatesSRS.AddDays(14);
                    drpDaySRS.Value = pc.GetDayOfMonth(dtDatesSRS);
                    drpMonthSRS.Value = pc.GetMonth(dtDatesSRS);
                    drpYearSRS.Value = pc.GetYear(dtDatesSRS);


                    dtDateSRSanswer = dtDatesSRS.AddDays(7);
                    drpDaySRSanswer.Value = pc.GetDayOfMonth(dtDateSRSanswer);
                    drpMonthSRSanswer.Value = pc.GetMonth(dtDateSRSanswer);
                    drpYearSRSanswer.Value = pc.GetYear(dtDateSRSanswer);







                }
                else if (drpOlaviat.SelectedIndex == 2)
                {
                    //PersianCalendarPropozal.SelectedDate = date.AddDays(75);
                    //PersianCalendarSRS.SelectedDate = date.AddDays(21);
                    //PersianCalendarSRSanswer.SelectedDate = PersianCalendarSRS.SelectedDate.Value.AddDays(7);
                    //PersianCalendarAmaliti.SelectedDate = DateTime.Now;

                    dtDatesAmaliati = DateTime.Now;
                    drpDayAmaliti.Value = pc.GetDayOfMonth(dtDatesAmaliati);
                    drpMonthAmaliti.Value = pc.GetMonth(dtDatesAmaliati);
                    drpYearAmaliti.Value = pc.GetYear(dtDatesAmaliati);


                    dtDatePropozal = dtDatePropozal.AddDays(75);
                    drpDayPropozal.Value = pc.GetDayOfMonth(dtDatePropozal);
                    drpMonthPropozal.Value = pc.GetMonth(dtDatePropozal);
                    drpYearPropozal.Value = pc.GetYear(dtDatePropozal);


                    dtDatesSRS = dtDatesSRS.AddDays(21);
                    drpDaySRS.Value = pc.GetDayOfMonth(dtDatesSRS);
                    drpMonthSRS.Value = pc.GetMonth(dtDatesSRS);
                    drpYearSRS.Value = pc.GetYear(dtDatesSRS);


                    dtDateSRSanswer = dtDatesSRS.AddDays(7);
                    drpDaySRSanswer.Value = pc.GetDayOfMonth(dtDateSRSanswer);
                    drpMonthSRSanswer.Value = pc.GetMonth(dtDateSRSanswer);
                    drpYearSRSanswer.Value = pc.GetYear(dtDateSRSanswer);





                }
            }



        }
        protected void sourceMosavab_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {

            int intId = (int)e.Command.Parameters["@mosId"].Value;
            HiddenField2.Value = intId.ToString();
        }
    }
}
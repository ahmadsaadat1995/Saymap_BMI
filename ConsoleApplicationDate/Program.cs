using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;

namespace ConsoleApplicationDate
{
    class Program
    {
        static void Main(string[] args)
        {
            GenerateToDate(new DateTime(2033, 9, 22));
        }

        public static void GenerateToDate(DateTime dt)
        {
            DataClasses1DataContext dc = new DataClasses1DataContext();
            string value = dc.DimDates.Max(i => i.GregorianStr);
            DateTime currentDate = Convert.ToDateTime(value);
            DateTime nextDate = currentDate.AddDays(1);
            PersianCalendar pCal = new PersianCalendar();
            GregorianCalendar gCal = new GregorianCalendar();

            while (dt >= nextDate)
            {

                currentDate = nextDate;
                DimDate dd = new DimDate();
                dd.DateKey = currentDate.Year * 10000 + (currentDate.Month * 100) + currentDate.Day;

                int year = pCal.GetYear(currentDate);
                int month = pCal.GetMonth(currentDate);
                int day = pCal.GetDayOfMonth(currentDate);
                dd.GregorianDate = currentDate.ToString("yyyy-MM-dd");
                dd.GregorianStr = currentDate.ToString("yyyy/MM/dd");
                dd.GregorianYearInt = (short)currentDate.Year;
                dd.GregorianMonthNo = (byte)currentDate.Month;
                dd.GregorianDayInMonth = (byte)currentDate.Day;
                dd.GregorianMonthDayInt = (short)(currentDate.Month * 100 + currentDate.Day);
                dd.GregorianDayOfWeekInt = (byte)(int)currentDate.DayOfWeek;
                dd.GregorianMonthName = GetGMonth(currentDate.Month);
                dd.GregorianYearMonthInt = currentDate.Year * 100 + currentDate.Month;
                dd.GregorianYearMonthStr = currentDate.ToString("yyyy/MM");
                dd.GregorianDayOfWeekName = currentDate.DayOfWeek.ToString();
                dd.GrgorianWeekOfYearName = "Week " + gCal.GetWeekOfYear(currentDate, CalendarWeekRule.FirstDay, DayOfWeek.Sunday);
                dd.GregorianWeekOfYearNo = gCal.GetWeekOfYear(currentDate, CalendarWeekRule.FirstDay, DayOfWeek.Sunday);
                dd.GregorianWeekOfYearNo = gCal.GetWeekOfYear(currentDate, CalendarWeekRule.FirstDay, DayOfWeek.Sunday);
                dd.PersianInt = year * 10000 + month * 100 + day;
                dd.PersianYearInt = (short)year;
                dd.PersianMonthNo = (byte)month;
                dd.PersianDayInMonth = (byte)day;
                dd.PersianMonthDayInt = (short)(month * 100 + day);
                dd.PersianDayOfWeekInt = (byte)(int)pCal.GetDayOfWeek(currentDate);
                dd.PersianMonthName = GetPMonth(month);
                dd.PersianStr = year.ToString() + "/" + month.ToString("00") + "/" + day.ToString("00");
                dd.PersianYearMonthInt = year * 10000 + month * 100;
                dd.PersianDayOfWeekName = GetPWeek(currentDate.DayOfWeek);
                dd.PersianYearMonthStr = year.ToString() + "/" + month.ToString("00");
                dd.PersianWeekOfYearNo = pCal.GetWeekOfYear(currentDate,CalendarWeekRule.FirstDay,DayOfWeek.Saturday);
                dd.PersianWeekOfYearName ="هفته "+ dd.PersianWeekOfYearNo;
                dd.PersianFullName = dd.PersianDayOfWeekName +" " + day +" " +  dd.PersianMonthName + " " + year ;
                dd.SeasonCode = (byte)GetSession(month);
                dd.SeasonName = GetNSession(month);

                dc.DimDates.InsertOnSubmit(dd);

                dc.SubmitChanges();

                nextDate = currentDate.AddDays(1);

            }


        }
        public static string GetNSession(int month)
        {
            switch (month)
            {
                case 1:
                case 2:
                case 3: return "بهار";
                case 4:
                case 5:
                case 6: return "تابستان";
                case 7:
                case 8:
                case 9: return "پاییز";
                case 10:
                case 11:
                case 12: return "زمستان";
                default: return "";

            }
        }
        public static int GetSession(int month)
        {
            switch (month)
            {
                case 1: 
                case 2:
                case 3: return 1;
                case 4: 
                case 5:
                case 6: return 2;
                case 7: 
                case 8:
                case 9: return 3;
                case 10: 
                case 11:
                case 12: return 4;
                default: return 0;

            }
        }
        public static string GetGMonth(int month)
        {
            switch (month)
            {
                case 1: return "January";
                case 2: return "Faburary";
                case 3: return "March";
                case 4: return "April";
                case 5: return "May";
                case 6: return "June";
                case 7: return "July";
                case 8: return "August";
                case 9: return "September";
                case 10: return "October";
                case 11: return "November";
                case 12: return "December";
                default: return "";

            }
        }
        public static string GetPMonth(int month)
        {
            switch (month)
            {
                case 1: return "فروردین";
                case 2: return "اردیبهشت";
                case 3: return "خرداد";
                case 4: return "تیر";
                case 5: return "مرداد";
                case 6: return "شهریور";
                case 7: return "مهر";
                case 8: return "آبان";
                case 9: return "آذر";
                case 10: return "دی";
                case 11: return "بهمن";
                case 12: return "اسفند";
                default: return "";

            }
        }
        public static string GetPWeek(DayOfWeek day)
        {
            switch (day)
            {
                case DayOfWeek.Friday:
                    return "جمعه";
                case DayOfWeek.Monday:
                    return "دوشنبه";
                case DayOfWeek.Saturday:
                    return "شنبه";
                case DayOfWeek.Sunday:
                    return "یکشنبه";
                case DayOfWeek.Thursday:
                    return "پنجشنبه";
                case DayOfWeek.Tuesday:
                    return "سه شنبه";
                case DayOfWeek.Wednesday:
                    return "چهارشنبه";
                default:
                    return "";
            }
        }

    }
}


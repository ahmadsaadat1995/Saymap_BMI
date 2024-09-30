using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;

namespace NewMellatWinService
{
    public class Date
    {
        public int Year { get; set; }
        public int Month { get; set; }
        public int Day { get; set; }
        public int Session { get; set; }
        public DateTime DateTime { get; set; }

        PersianCalendar p = new PersianCalendar();

        public Date(string dateText)
        {
            string[] sp = dateText.Trim().Split('/');
            if (sp.Length == 3 && sp[2].Length == 4)
                sp = sp.Reverse().ToArray();
            if (sp[0].Length == 2)
                sp[0] = "13" + sp[0];
            Year = Convert.ToInt32(sp[0].Trim());
            Month = Convert.ToInt32(sp[1].Trim());
            if (Month > 12)
                Month = 12;
            if(Month <1)
                Month = 1;
            Day = Convert.ToInt32(sp[2].Trim());
            if (Month < 7 && Day > 31)
                Day = 31;
            else if (Month < 12 && Day > 30)
                Day = 30;
            else if (Month == 12 && Day > 29)
            {
                if (p.IsLeapYear(Year))
                    Day = 30;
                else
                    Day = 29;

            }

            Session = (Month - 1) / 3 + 1;
            DateTime = p.ToDateTime(Year, Month, Day, 0, 0, 0, 0);

        }
        public Date(DateTime dt)
        {
            Year = p.GetYear(dt);
            Month = p.GetMonth(dt);
            Day = p.GetDayOfMonth(dt);
            Session = (Month - 1) / 3 + 1;
            DateTime = dt;
        }
        public Date(int year, int session)
        {
            Year = year;
            Month = (session -1)*3 +1;
            Day = 1;
            Session = session;
            DateTime = p.ToDateTime(Year, Month, Day, 0, 0, 0, 0);

        }
        public Date NextSession()
        {
            if (Session == 4)
                return new Date(Year + 1, 1);
            else
                return new Date(Year , Session + 1);
        }
    }
}

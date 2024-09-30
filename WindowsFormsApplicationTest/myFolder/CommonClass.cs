using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Globalization;

namespace NewMellat
{
    public class CommonClass
    {

        public static byte[] StreamToBytes(Stream input)
        {
            byte[] buffer = new byte[16 * 1024];
            using (MemoryStream ms = new MemoryStream())
            {
                int read;
                while ((read = input.Read(buffer, 0, buffer.Length)) > 0)
                {
                    ms.Write(buffer, 0, read);
                }
                return ms.ToArray();
            }
        }

        public static DateTime ShamsiToMiladi(string shamsiDate)
        {
            int intYear = Convert.ToInt32(shamsiDate.Remove(4, 4));
            int intMonth = Convert.ToInt32(shamsiDate.Remove(0, 4).Remove(2, 2));
            int intDay = Convert.ToInt32(shamsiDate.Remove(0, 6));

            DateTime miladiDate = Persia.Calendar.ConvertToGregorian(intYear, intMonth, intDay);
            return miladiDate;}



        public static string DayName(DayOfWeek day)
        {
            if (day == DayOfWeek.Friday)
            {
                return "جمعه";
            }
            else if (day == DayOfWeek.Monday)
            {
                return "دوشنبه";
            }
            else if (day == DayOfWeek.Saturday)
            {
                return "شنبه";
            }
            else if (day == DayOfWeek.Sunday)
            {
                return "یکشنبه";
            }
            else if (day == DayOfWeek.Thursday)
            {
                return "پنج شنبه";
            }
            else if (day == DayOfWeek.Tuesday)
            {
                return "سه شنبه";
            }
            else if (day == DayOfWeek.Wednesday)
            {
                return "چهارشنبه";
            }
            else
            {
                return string.Empty;
            }
        }

        public static string ShamsiDate(DateTime date)
        {
            PersianCalendar pc = new PersianCalendar();
            int intYear = pc.GetYear(date);
            int intMonth = pc.GetMonth(date);
            int intDay = pc.GetDayOfMonth(date);
            string strDate = intYear.ToString() + intMonth.ToString().PadLeft(2, '0') + intDay.ToString().ToString().PadLeft(2, '0');
            return strDate;

        }
        public static string ShamsiDate(DateTime date,string seperator)
        {
            PersianCalendar pc = new PersianCalendar();
            int intYear = pc.GetYear(date);
            int intMonth = pc.GetMonth(date);
            int intDay = pc.GetDayOfMonth(date);
            string strDate = intYear.ToString() + seperator + intMonth.ToString().PadLeft(2, '0') + seperator + intDay.ToString().PadLeft(2, '0');
            return strDate;

        }


     
        public static string NumberWithGroup(long Number)
        {

            return Persia.Number.ConvertToPersian(Number.ToString("0,0", CultureInfo.InvariantCulture));
        }

        public static string ConvertToPersianString(string txt)
        {
            string RET = " ", STRVA = " ";
            string[] MainStr = STR_To_Int(txt);
            int Q = 0;
            for (int i = MainStr.Length - 1; i >= 0; i--)
            {
                STRVA = " ";
                if (RET != " " && RET != null)
                    STRVA = " و ";
                RET = Convert_STR(GETCountStr(MainStr[i]), Q) + STRVA + RET;
                Q++;
            }
            if (RET == " " || RET == null || RET == "  ")
                RET = "صفر";
            return RET + "ریال";
        }

        private static string[] STR_To_Int(string STR)
        {
            STR = GETCountStr(STR);
            string[] RET = new string[STR.Length / 3];
            int Q = 0;
            for (int I = 0; I < STR.Length; I += 3)
            {
                RET[Q] = STR.Substring(I, 3);
                Q++;
            }
            return RET;
        }

        private static string GETCountStr(string STR)
        {
            string RET = STR;
            int LEN = (STR.Length / 3 + 1) * 3 - STR.Length;
            if (LEN < 3)
            {
                for (int i = 0; i < LEN; i++)
                {
                    RET = "0" + RET;
                }
            }
            if (RET == "")
                return "000";
            return RET;
        }

        private static string Convert_STR(string INT, int Count)
        {
            string RET = "";
            //یک صد
            if (Count == 0)
            {
                if (INT.Substring(1, 1) == "1" && INT.Substring(2, 1) != "0")
                {
                    RET = GET_Number(3, Convert.ToInt32(INT.Substring(0, 1)), " ") + GET_Number(1, Convert.ToInt32(INT.Substring(2, 1)), "");
                }
                else
                {
                    string STR = GET_Number(0, Convert.ToInt32(INT.Substring(2, 1)), "");
                    RET = GET_Number(3, Convert.ToInt32(INT.Substring(0, 1)), GET_Number(2, Convert.ToInt32(INT.Substring(1, 1)), "") + STR) + GET_Number(2, Convert.ToInt32(INT.Substring(1, 1)), STR) + GET_Number(0, Convert.ToInt32(INT.Substring(2, 1)), "");
                }
            }
            //هزار
            else if (Count == 1)
            {
                RET = Convert_STR(INT, 0);
                RET += " هزار";
            }
            //میلیون
            else if (Count == 2)
            {
                RET = Convert_STR(INT, 0);
                RET += " میلیون";
            }
            //میلیارد
            else if (Count == 3)
            {
                RET = Convert_STR(INT, 0);
                RET += " میلیارد";
            }
            //میلیارد
            else if (Count == 4)
            {
                RET = Convert_STR(INT, 0);
                RET += " تیلیارد";
            }
            //میلیارد
            else if (Count == 5)
            {
                RET = Convert_STR(INT, 0);
                RET += " بیلیارد";
            }
            else
            {
                RET = Convert_STR(INT, 0);
                RET += Count.ToString();
            }
            return RET;
        }

        private static string GET_Number(int Count, int Number, string VA)
        {
            string RET = "";

            if (VA != "" && VA != null)
            {
                VA = " و ";
            }
            if (Count == 0 || Count == 1)
            {
                bool IsDah = Convert.ToBoolean(Count);
                string[] MySTR = new string[10];
                MySTR[1] = IsDah ? "یازده" : "یک" + VA;
                MySTR[2] = IsDah ? "دوازده" : "دو" + VA;
                MySTR[3] = IsDah ? "سیزده" : "سه" + VA;
                MySTR[4] = IsDah ? "چهارده" : "چهار" + VA;
                MySTR[5] = IsDah ? "پانزده" : "پنج" + VA;
                MySTR[6] = IsDah ? "شانزده" : "شش" + VA;
                MySTR[7] = IsDah ? "هفده" : "هفت" + VA;
                MySTR[8] = IsDah ? "هجده" : "هشت" + VA;
                MySTR[9] = IsDah ? "نوزده" : "نه" + VA;
                return MySTR[Number];
            }
            else if (Count == 2)
            {
                string[] MySTR = new string[10];
                MySTR[1] = "ده";
                MySTR[2] = "بیست" + VA;
                MySTR[3] = "سی" + VA;
                MySTR[4] = "چهل" + VA;
                MySTR[5] = "پنجاه" + VA;
                MySTR[6] = "شصت" + VA;
                MySTR[7] = "هفتاد" + VA;
                MySTR[8] = "هشتاد" + VA;
                MySTR[9] = "نود" + VA;
                return MySTR[Number];
            }
            else if (Count == 3)
            {
                string[] MySTR = new string[10];
                MySTR[1] = "یکصد" + VA;
                MySTR[2] = "دویست" + VA;
                MySTR[3] = "سیصد" + VA;
                MySTR[4] = "چهارصد" + VA;
                MySTR[5] = "پانصد" + VA;
                MySTR[6] = "ششصد" + VA;
                MySTR[7] = "هفتصد" + VA;
                MySTR[8] = "هشتصد" + VA;
                MySTR[9] = "نهصد" + VA;
                return MySTR[Number];
            }
            return RET;
        }

        public static string ConvertToPersian(string text)
        {
            
            return Persia.Number.ConvertToPersian(text);
        }
    }

}
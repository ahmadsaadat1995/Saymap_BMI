using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class PageSooratNazerPaper : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PersianCalendar1.Date = DateTime.Now;
            }
        }


        NewMellatEntities db = new NewMellatEntities();

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            sourcePages.InsertParameters["paDate"].DefaultValue = PersianCalendar1.Date.ToShortDateString();

            sourcePages.Insert();

            int intSoorat = Convert.ToInt32(Request.QueryString["project"]);

            // به روز رسانی صورتحساب
            if (ASPxComboBox1.Value.ToString() == "1" || ASPxComboBox1.Value.ToString() == "3")
            {
                // ارسال به تدارکات
                var soorat = db.tbSooratHesabs.SingleOrDefault(n => n.id == intSoorat);
                soorat.step5 = true;
                soorat.step4 = false;
                db.SaveChanges();
            }
            else
            {
                // ارسال به شرکت
                var soorat = db.tbSooratHesabs.SingleOrDefault(n => n.id == intSoorat);
                soorat.step3 = true;
                soorat.step4 = false;
                db.SaveChanges();



                // به روز رسانی نامه های قدیم
                var pish = db.tbSooratPishNevis.FirstOrDefault(n => n.pishProject == intSoorat);
                var paper = db.tbProjectPapers.Where(n => n.paAct == 1 && n.paProject == pish.pishId && n.paType == 1005);
                foreach (var item in paper)
                {
                    item.paStatus = 0;
                    //    db.SaveChanges();
                }

                db.SaveChanges();
            }
        }
    }
}
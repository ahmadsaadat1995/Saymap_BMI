using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class PageSooratPaperErsalMali : System.Web.UI.Page
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
        }

    }
}
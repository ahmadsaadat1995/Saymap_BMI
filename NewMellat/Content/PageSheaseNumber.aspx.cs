using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class PageSheaseNumber : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        NewMellatEntities db = new NewMellatEntities();

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            sourceShenas.Insert();
            ASPxGridView1.DataBind();





        }
    }
}
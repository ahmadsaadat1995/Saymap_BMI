using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class PageIsAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        NewMellatEntities mellat = new NewMellatEntities();

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            try
            {
                string username = SecurityClass.DecryptText(Request.QueryString["user"]);
                Roles.AddUserToRole(username, "admins");
                Label1.ForeColor = Color.Green;
                Label1.Text = "اطلاعات با موفقیت به ثبت رسید";
            }
            catch (Exception)
            {
                Label1.ForeColor = Color.Red;
                Label1.Text = "اطلاعات قبلا ثبت شده است";
            }



        }
    }
}
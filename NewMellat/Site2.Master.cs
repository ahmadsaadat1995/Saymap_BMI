using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat
{
    public partial class Site2 : System.Web.UI.MasterPage
    {

        NewMellatEntities db = new NewMellatEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

            var date = DateTime.Now;

            if (date >= DateTime.Parse("2018-10-27"))
            {
                // Response.Redirect("~/loginPage.aspx");
            }




            //  lbUserName.Text = Page.User.Identity.Name;
            //lbName2.Text = Page.User.Identity.Name;
            lbName3.Text = Page.User.Identity.Name;

            // lbNo1.Text = db.tbKhobreganMosavabs.Where(n => n.mosAct == 1).Count().ToString();
            //  lbNo2.Text = db.tbTarhPishnehadis.Where(n => n.thAct == 1).Count().ToString();
            // lbNo3.Text = db.tbElhaghies.Count().ToString();
            //   lbNo4.Text ="";
            // lbNo5.Text = db.tbSooratHesabs.Count().ToString();

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            System.Web.Security.FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();

        }
    }
}
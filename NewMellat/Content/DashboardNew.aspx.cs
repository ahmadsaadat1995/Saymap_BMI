using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace NewMellat.Content
{
    public partial class DashboardNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "داشبورد مدیریتی";


            NewMellatEntities db = new NewMellatEntities();

            lb1.Text = db.tbProjects.Where(n => n.prAct == 1).Count().ToString();
            lb2.Text = db.tbKhobreganMosavabs.Where(n => n.mosAct == 1).Count().ToString();
            lb4.Text = db.tbSooratHesabs.Count().ToString();
            lb3.Text = Membership.GetAllUsers().Count.ToString();
        }
    }
}
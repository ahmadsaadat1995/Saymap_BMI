using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace NewMellat.Content
{
    public partial class ReportDiagram : System.Web.UI.Page
    {

        DataClassesDiagramDataContext db2 = new DataClassesDiagramDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

            // کنترل امنیت

            if (!Page.User.IsInRole("admins"))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }


            g1.Value = string.Format(" ({0}) ", db.tbProjects.Where(n => n.prAct == 1 && n.prStatus == 0).Count()); g8.Value = db2.vwDiag8s.Count().ToString();


            //test
            g2.Value = db.tbTemps.SingleOrDefault(n => n.tmId == 1).tmData.Value.ToString();
            g4.Value = db.tbTemps.SingleOrDefault(n => n.tmId == 2).tmData.Value.ToString();
            g5.Value = db.tbTemps.SingleOrDefault(n => n.tmId == 3).tmData.Value.ToString();
            g6.Value = db.tbTemps.SingleOrDefault(n => n.tmId == 5).tmData.Value.ToString();
            g7.Value = db.tbTemps.SingleOrDefault(n => n.tmId == 6).tmData.Value.ToString();
            g9.Value = db.tbTemps.SingleOrDefault(n => n.tmId == 7).tmData.Value.ToString();
            g10.Value = db.tbTemps.SingleOrDefault(n => n.tmId == 9).tmData.Value.ToString();
        }

        NewMellatEntities db = new NewMellatEntities();



    }
}
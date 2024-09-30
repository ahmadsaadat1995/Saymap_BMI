using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content.Reports
{
    public partial class ReportMiningLoader : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["vr"] == "2")
            {
                ReportViewer1.ServerReport.ReportPath = "/Report Project1/" + Request.QueryString["rpt"];

            }
            else
            {
                ReportViewer1.ServerReport.ReportPath = "/MellatReports/" + Request.QueryString["rpt"];

            }
        }
    }
}
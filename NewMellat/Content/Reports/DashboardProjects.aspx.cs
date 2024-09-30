using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content.Reports
{
    public partial class DashboardProjects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            ReportViewer1.ProcessingMode = ProcessingMode.Remote;
            ReportViewer1.ShowParameterPrompts = false;
            ReportViewer1.ShowPromptAreaButton = false;
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            List<string> values = new List<string>();
            List<string> values2 = new List<string>();


            foreach (var item in drpVahed.SelectedValues)
            {
                values.Add(item.ToString());
            }


            foreach (var item in drpPeymankar.SelectedValues)
            {
                values2.Add(item.ToString());
            }

            string url = "http://172.22.65.20/ReportServer_SQL2016";


            ReportViewer1.ServerReport.ReportServerUrl = new Uri(url);
            ReportViewer1.ServerReport.ReportPath = "/MellatReports/ReportProjects";

            List<ReportParameter> parameters = new List<ReportParameter>();
            parameters.Add(new ReportParameter("prVahed"));
            parameters.Add(new ReportParameter("prPeymankar"));





            parameters[0].Values.AddRange(values.ToArray());


            parameters[1].Values.AddRange(values2.ToArray());



            ReportViewer1.ServerReport.SetParameters(parameters);





            ReportViewer1.ProcessingMode = ProcessingMode.Remote;
            ReportViewer1.ShowParameterPrompts = false;
            ReportViewer1.ShowPromptAreaButton = false;


            ReportViewer1.ServerReport.Refresh();
        }

    }
}
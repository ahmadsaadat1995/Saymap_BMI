using DevExpress.Web;
using DevExpress.XtraReports.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class rptProjectKhobregan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //XtraReportProjectKhobregan report = new XtraReportProjectKhobregan();
         //   report.Parameters["vahedParam"].Value = Convert.ToInt32(drpVahed.Value);
            //report.Parameters["vahedParam"].Value = 14;
            //   ASPxDocumentViewer1.Report = report;
            //DataBind();

        }

        protected void drpVahed_DataBound(object sender, EventArgs e)
        {
            drpVahed.Items.Insert(0, new ListEditItem("انتخاب", "-1"));
            drpVahed.SelectedIndex = 0;
        }

        protected void drpPeymankar_DataBound(object sender, EventArgs e)
        {
            drpPeymankar.Items.Insert(0, new ListEditItem("انتخاب", "-1"));
            drpPeymankar.SelectedIndex = 0;
        }

        protected void drpVahed_SelectedIndexChanged(object sender, EventArgs e)
        {
            XtraReportProjectKhobregan report = new XtraReportProjectKhobregan();
            report.Parameters["vahedParam"].Value = Convert.ToInt32(drpVahed.Value);
            //report.Parameters["vahedParam"].Value = 14;
            ASPxDocumentViewer1.Report = report;
            DataBind();
        }
    }
}
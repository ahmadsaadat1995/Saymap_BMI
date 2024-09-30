using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class PageZarfiatReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "گزارش ظرفیت سنجی";
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsxToResponse();
        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "mosAmaliatiDate")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label3") as Label;
                try
                {
                    lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;
                }
                catch
                { }
            }


            if (e.DataColumn.FieldName == "mosErsalDate")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label4") as Label;
                try
                {
                    lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;
                }
                catch
                { }
            }

            if (e.DataColumn.FieldName == "mosSRS")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label5") as Label;
                try
                {
                    lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;
                }
                catch
                { }
            }

            if (e.DataColumn.FieldName == "mosSRSanswer")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label6") as Label;
                try
                {
                    lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;
                }
                catch
                { }
            }

            if (e.DataColumn.FieldName == "mosDate")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label7") as Label;
                try
                {
                    lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;
                }
                catch
                { }
            }
        }
    }
}
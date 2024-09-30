using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class ReportBuilders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            // عدم نمایش ستونهای گرید به صورت پیش فرض




            if (!IsPostBack)
            {
                PersianCalendar1.Date = DateTime.Now;
                PersianCalendar2.Date = DateTime.Now;

                //foreach (GridViewColumn column in ASPxGridView1.AllColumns)
                //{
                //    column.Visible = false;
                //}



                Label panel = (Label)this.Master.FindControl("lbHeader");
                panel.Text = "گزارش ساز جامع";

            }
        }

        protected void ASPxGridView1_DataBound(object sender, EventArgs e)
        {
            if (ASPxCheckBoxList1.Items.Count == 0)
            {
                foreach (GridViewColumn column in ASPxGridView1.AllColumns)
                {
                    ASPxCheckBoxList1.Items.Add(new ListEditItem(column.Caption, column.Index));
                }
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                Label lb = (Label)e.Row.FindControl("Label1");

                lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;
            }
            catch { }
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsxToResponse();
        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "prRegDate")
            {
                Label lb1 =
                    ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label7") as Label;

                try
                {
                    lb1.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb1.Text)).Simple;
                }
                catch { }
            }




            if (e.DataColumn.FieldName == "prKhobreganStatusMosavab")
            {
                Label lb1 =
                    ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label11") as Label;

                if (lb1.Text == "1")
                {
                    lb1.Text = "اتمام یافته";
                }
                else if (lb1.Text == "2")
                {
                    lb1.Text = "ادغام شده";
                }
               else
                {
                    lb1.Text = "-----";
                }

            }


        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                Label lb = (Label)e.Row.FindControl("Label1");

                lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;
            }
            catch { }
        }
    }
}
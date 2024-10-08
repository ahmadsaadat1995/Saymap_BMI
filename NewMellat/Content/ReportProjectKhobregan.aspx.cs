﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace NewMellat.Content
{
    public partial class ReportProjectKhobregan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "گزارش پروژه ها";

            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }
        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "mosDate")
            {
                Label lb1 =
                    ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label1") as Label;

                try
                {
                    if (lb1.Text != "1/1/2001 12:00:00 AM")
                    {
                        lb1.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb1.Text)).Simple;
                    }
                    else
                    {
                        lb1.Text = "";
                    }
                }
                catch (Exception)
                {


                }

            }

            if (e.DataColumn.FieldName == "mosShenase")
            {
                Label lb1 =
                    ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label4") as Label;


                try{
                    if (lb1.Text != "-1")
                    {
                        lb1.Text = Persia.Number.ConvertToPersian(Int64.Parse(lb1.Text));}
                    else
                    {
                        lb1.Text = "";
                    }
                }
                catch (Exception)
                {


                }


            }

            if (e.DataColumn.FieldName == "mosAmaliatiDate")
            {
                Label lb1 =
                    ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label2") as Label;

                try
                {
                    if (lb1.Text != "1/1/2001 12:00:00 AM")
                    {
                        lb1.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb1.Text)).Simple;
                    }
                    else
                    {
                        lb1.Text = "";
                    }
                }
                catch (Exception)
                {


                }

            }

            if (e.DataColumn.FieldName == "mosErsalDate")
            {
                Label lb1 =
                    ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label3") as Label;

                try
                {
                    if (lb1.Text != "1/1/2001 12:00:00 AM")
                    {
                        lb1.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb1.Text)).Simple;
                    }
                    else
                    {lb1.Text = "";
                    }
                }
                catch (Exception)
                {


                }

            }

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsxToResponse();
        }
    }
}
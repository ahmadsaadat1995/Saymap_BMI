using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace NewMellat.Content
{
    public partial class ReportKhobreganEtmam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }



            Label panel = (Label)this.Master.FindControl("lbHeader");

            if (Request.QueryString["type"] == "101")
            {
                panel.Text = "گزارش مصوبات خبرگان اتمام یافته";
            }
            else if (Request.QueryString["type"] == "102")
            {
                panel.Text = "گزارش مصوبات خبرگان ادغام شده";

            }
            else if (Request.QueryString["type"] == "303")
            {
                panel.Text = "گزارش مصوبات خبرگان لغو شده";

            }
        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {

          

            if (e.DataColumn.FieldName == "paDate")
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

            if (e.DataColumn.FieldName == "paShenase")
            {
                Label lb1 =
                    ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label4") as Label;


                try
                {
                    if (lb1.Text != "-1")
                    {
                        lb1.Text = Persia.Number.ConvertToPersian(Int64.Parse(lb1.Text));
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
                    {
                        lb1.Text = "";
                    }
                }
                catch (Exception)
                {


                }

            }


            if (e.DataColumn.VisibleIndex == 0)
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label5") as Label;
                lb.Text = (e.VisibleIndex + 1).ToString();


                //ثبت آمار
                if (Request.QueryString["type"] == "101")
                {
                    var tmp = db.tbTemps.SingleOrDefault(n => n.tmId == 12);
                    tmp.tmData = int.Parse(lb.Text);
                    db.SaveChanges();
                }


                if (Request.QueryString["type"] == "102")
                {
                    var tmp = db.tbTemps.SingleOrDefault(n => n.tmId == 13);
                    tmp.tmData = int.Parse(lb.Text);
                    db.SaveChanges();
                }
            }


        }

        NewMellatEntities db=new NewMellatEntities();

    }
}
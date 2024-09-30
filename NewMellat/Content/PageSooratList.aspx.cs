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
    public partial class PageSooratList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        

            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }

            if (!IsPostBack)
            {
                PersianCalendar1.Date = DateTime.Now.AddYears(-7);
                PersianCalendar2.Date = DateTime.Now;
                PersianCalendar3.Date = DateTime.Now.AddYears(-7);
                PersianCalendar4.Date = DateTime.Now;
                PersianCalendar5.Date = DateTime.Now.AddYears(-7);
                PersianCalendar6.Date = DateTime.Now;
                PersianCalendar7.Date = DateTime.Now.AddYears(-7);
                PersianCalendar8.Date = DateTime.Now;
                PersianCalendar9.Date = DateTime.Now.AddYears(-7);
                PersianCalendar10.Date = DateTime.Now;


            }




            if (ASPxCheckBox1.Checked)
            {
                sourceHesab.SelectParameters["start1"].DefaultValue = CommonClass.ShamsiDate(PersianCalendar1.Date).Insert(4, "/").Insert(7, "/");
                sourceHesab.SelectParameters["start2"].DefaultValue = CommonClass.ShamsiDate(PersianCalendar2.Date).Insert(4, "/").Insert(7, "/");
            }
            else
            {
                sourceHesab.SelectParameters["start1"].DefaultValue = "-1";
            }



            if (ASPxCheckBox2.Checked)
            {
                sourceHesab.SelectParameters["end1"].DefaultValue = CommonClass.ShamsiDate(PersianCalendar3.Date).Insert(4, "/").Insert(7, "/");
                sourceHesab.SelectParameters["end2"].DefaultValue = CommonClass.ShamsiDate(PersianCalendar4.Date).Insert(4, "/").Insert(7, "/");

            }
            else
            {
                sourceHesab.SelectParameters["end1"].DefaultValue = "-1";
            }


            if (ASPxCheckBox3.Checked)
            {
                sourceHesab.SelectParameters["ex1"].DefaultValue = CommonClass.ShamsiDate(PersianCalendar5.Date).Insert(4, "/").Insert(7, "/");
                sourceHesab.SelectParameters["ex2"].DefaultValue = CommonClass.ShamsiDate(PersianCalendar6.Date).Insert(4, "/").Insert(7, "/");
            }
            else
            {
                sourceHesab.SelectParameters["ex1"].DefaultValue = "-1";
            }


            if (ASPxCheckBox4.Checked)
            {
                sourceHesab.SelectParameters["pa1"].DefaultValue = CommonClass.ShamsiDate(PersianCalendar7.Date).Insert(4, "/").Insert(7, "/");
                sourceHesab.SelectParameters["pa2"].DefaultValue = CommonClass.ShamsiDate(PersianCalendar8.Date).Insert(4, "/").Insert(7, "/");
            }
            else
            {
                sourceHesab.SelectParameters["pa1"].DefaultValue = "-1";
            }



            if (ASPxCheckBox5.Checked)
            {
                sourceHesab.SelectParameters["pa3"].DefaultValue = CommonClass.ShamsiDate(PersianCalendar9.Date).Insert(4, "/").Insert(7, "/");;
                sourceHesab.SelectParameters["pa4"].DefaultValue = CommonClass.ShamsiDate(PersianCalendar10.Date).Insert(4, "/").Insert(7, "/"); ;
            }
            else
            {
                sourceHesab.SelectParameters["pa3"].DefaultValue = "-1";
            }


            

            //ASPxGridView1.DataBind();

            foreach (GridViewColumn column in ASPxGridView1.AllColumns)
            {
                column.Visible = false;
            }


            loadColumns();
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsxToResponse();
        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "Expr1")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label3") as Label;
                try
                {
                    //lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;

                }
                catch
                {

                }
            }


            if (e.DataColumn.FieldName == "paDate2")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label6") as Label;
                try
                {
                  //  lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;

                }
                catch
                {

                }
            }
            //if (e.DataColumn.FieldName == "Price")
            //{
            //    Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label4") as Label;

            //    try
            //    {
            //        lb.Text = CommonClass.NumberWithGroup(long.Parse(lb.Text));
            //    }
            //    catch { }
            //}


            //if (e.DataColumn.FieldName == "SoorathesbPrice")
            //{
            //    Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label5") as Label;

            //    try
            //    {
            //        lb.Text = CommonClass.NumberWithGroup(long.Parse(lb.Text));
            //    }
            //    catch { }
            //}

            if (e.DataColumn.FieldName == "paDate3")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label7") as Label;
                try
                {
                    //lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;

                }
                catch
                {

                }
            }



        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {

        }

       

        protected void ASPxGridViewExporter1_Load(object sender, EventArgs e)
        {


        }

        void loadColumns()
        {
            foreach (ListEditItem item in chkColumns.Items)
            {
                if (item.Selected)
                {

                    ASPxGridView1.Columns[Convert.ToInt32(item.Value)].Visible = true;
                }
            }
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            foreach (ListEditItem item in chkColumns.Items)
            {
                item.Selected = true;
            }
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            loadColumns();
        }

        protected void ASPxGridView1_DataBound(object sender, EventArgs e)
        {
            if (chkColumns.Items.Count == 0)
            {
                foreach (GridViewColumn column in ASPxGridView1.AllColumns)
                {
                    chkColumns.Items.Add(new ListEditItem(column.Caption, column.Index));
                }
            }


            chkColumns.Items[1].Selected = true;
            chkColumns.Items[2].Selected = true;
            chkColumns.Items[3].Selected = true;
            chkColumns.Items[5].Selected = true;
            chkColumns.Items[6].Selected = true;
            chkColumns.Items[7].Selected = true;
            chkColumns.Items[8].Selected = true;
            chkColumns.Items[9].Selected = true;
            chkColumns.Items[4].Selected = true;
            chkColumns.Items[11].Selected = true;
            chkColumns.Items[10].Selected = true;

            loadColumns();

        }

        protected void ASPxGridView1_PageIndexChanged(object sender, EventArgs e)
        {
            loadColumns();
        }

        protected void ASPxGridView1_ProcessColumnAutoFilter(object sender, ASPxGridViewAutoFilterEventArgs e)
        {
            loadColumns();
        }
    }
}


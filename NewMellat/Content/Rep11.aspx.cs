using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class Rep11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["source"] == "1")
            {
                ASPxGridView1.DataSource = source1;
                ASPxGridView1.DataBind();
            }
            else if (Request.QueryString["source"] == "2")
            {
                ASPxGridView1.DataSource = source2;
                ASPxGridView1.DataBind();
            }
            else if (Request.QueryString["source"] == "3")
            {
                ASPxGridView1.DataSource = source3;
                ASPxGridView1.DataBind();
            }
            else if (Request.QueryString["source"] == "4")
            {
                ASPxGridView1.DataSource = source4;
                ASPxGridView1.DataBind();
            }
            else if (Request.QueryString["source"] == "5")
            {
                ASPxGridView1.DataSource = source5;
                ASPxGridView1.DataBind();
            }
            else if (Request.QueryString["source"] == "6")
            {
                ASPxGridView1.DataSource = source6;
                ASPxGridView1.DataBind();
            }
            else if (Request.QueryString["source"] == "7")
            {
                ASPxGridView1.DataSource = source7;
                ASPxGridView1.DataBind();
            }
            else if (Request.QueryString["source"] == "8")
            {
                ASPxGridView1.DataSource = source8;
                ASPxGridView1.DataBind();
            }
            else if (Request.QueryString["source"] == "12")
            {
                ASPxGridView1.DataSource = source12;
                ASPxGridView1.DataBind();
            }
            else if (Request.QueryString["source"] == "13")
            {
                ASPxGridView1.DataSource = source13;
                ASPxGridView1.DataBind();
            }
            else if (Request.QueryString["source"] == "14")
            {
                ASPxGridView1.DataSource = source14;
                ASPxGridView1.DataBind();
            }
            else if (Request.QueryString["source"] == "15")
            {
                ASPxGridView1.DataSource = source15;
                ASPxGridView1.DataBind();
            }
            else if (Request.QueryString["source"] == "16")
            {
                ASPxGridView1.DataSource = source16;
                ASPxGridView1.DataBind();
            }
            else if (Request.QueryString["source"] == "17")
            {
                ASPxGridView1.DataSource = source17;
                ASPxGridView1.DataBind();
            }
            else if (Request.QueryString["source"] == "21")
            {
                ASPxGridView1.DataSource = sourceSum1;
                ASPxGridView1.DataBind();
            }
            else if (Request.QueryString["source"] == "22")
            {
                ASPxGridView1.DataSource = sourceSum2;
                ASPxGridView1.DataBind();
            }
        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender,
            DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.VisibleIndex == 0)
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label1") as Label;
                try
                {
                    lb.Text = Persia.Number.ConvertToPersian((e.VisibleIndex + 1).ToString());

                }
                catch (Exception)
                {

                }
            }


            if (e.DataColumn.FieldName == "mosOlaviat")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label2") as Label;

                if (lb.Text == "173")
                {
                    lb.Text = "فوری";
                }
                else if (lb.Text == "174")
                {
                    lb.Text = "متوسط";
                }
                else if (lb.Text == "175")
                {
                    lb.Text = "عادی";
                }
            }

            if (e.DataColumn.FieldName == "mosDate")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label3") as Label;
                try
                {
                    lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;

                }
                catch (Exception)
                {


                }
            }


            if (e.DataColumn.FieldName == "mosSRS")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label7") as Label;
                try
                {
                    lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;

                }
                catch (Exception)
                {


                }
            }


            if (e.DataColumn.FieldName == "mosSRSanswer")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label8") as Label;
                try
                {
                    lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;

                }
                catch (Exception)
                {


                }
            }

            if (e.DataColumn.VisibleIndex == 8)
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label4") as Label;
                try
                {
                    lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;

                }
                catch (Exception)
                {


                }
            }

            if (e.DataColumn.VisibleIndex ==7)
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label5") as Label;
                try
                {
                    lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;

                }
                catch (Exception)
                {


                }
            }

            if (e.DataColumn.VisibleIndex == 4)
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label6") as Label;
                try
                {
                    lb.Text = Persia.Number.ConvertToPersian(lb.Text);

                }
                catch (Exception)
                {


                }
            }
        }



    }
}
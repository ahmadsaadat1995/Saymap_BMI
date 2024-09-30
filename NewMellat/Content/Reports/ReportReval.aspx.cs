using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content.Reports
{
    public partial class ReportReval : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

 
        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {

            if (e.DataColumn.FieldName == "reSanadType")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label31") as Label;
                if (lb.Text == "3000")
                {
                    lb.Text = "سند نیازمندیها";
                }
                else if (lb.Text == "4000")
                {
                    lb.Text = "پروتوتایپ";
                }
            }



            if (e.DataColumn.VisibleIndex == 5)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink2") as HyperLink;
                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc2({0}); return false;", strItembody[1]));
            }


            if (e.DataColumn.VisibleIndex == 4)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink1") as HyperLink;
                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc({0}); return false;", strItembody[1]));
            }


            // ستون پاسخ
            if (e.DataColumn.VisibleIndex == 8)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink4") as HyperLink;



                HiddenField hf2 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HiddenField4") as HiddenField;

                hp.NavigateUrl += "&type=" + hf2.Value; //+ "&sanadType=" + hf.Value;

            }



            if (e.DataColumn.VisibleIndex == 11)
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label30") as Label;

                try
                {
                    lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text).AddDays(7)).Simple;
                }
                catch { }
            }

            if (e.DataColumn.FieldName == "mosSRS")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label24") as Label;

                try
                {
                    lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;
                }
                catch { }

            }


            if (e.DataColumn.VisibleIndex == 11)
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label35") as Label;

                try
                {
                    lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;
                }
                catch { }
            }


        }

    }
}
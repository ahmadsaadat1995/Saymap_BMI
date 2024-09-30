using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class PageAnswer4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PersianCalendar1.Date = DateTime.Now;
            }
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            sourceNazar.InsertParameters["nzDate"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
            sourceNazar.Insert();
            ASPxGridView1.DataBind();

            RadNotification1.Show("اطلاعات با موفقیت به ثبت رسید");

        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {

            if (e.DataColumn.FieldName == "nzDate")
            {
                Label lb =
                   ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label12") as
                       Label;

                try
                {
                    lb.Text = CommonClass.ShamsiDate(DateTime.Parse(lb.Text)).Insert(4, "/").Insert(7, "/");
                }
                catch (Exception)
                {
                    lb.Text = "";
                }
            }


            if (e.DataColumn.VisibleIndex == 6)
            {
                HyperLink hp =
                    ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink1") as HyperLink;

                HiddenField hf =
                    ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HiddenField2") as HiddenField;

                if (hf.Value == "196")
                {
                    hp.Visible = true;
                }
                else
                {
                    hp.Visible = true;
                }





            }

        }

    }
}
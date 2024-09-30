using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class PageEstelamGharardad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                PersianCalendar1.Date = DateTime.Now;
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {




           
                Label8.Text = Persia.Calendar.ConvertToPersian(PersianCalendar1.Date.AddDays(5)).Simple;
           
        }


        NewMellatEntities db=new NewMellatEntities();
        protected void ASPxButton1_Click(object sender, EventArgs e)
        {

            sourcePages.InsertParameters["paDate"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
            sourcePages.Insert();

            ASPxGridView1.DataBind();

            if (Request.QueryString["id"] == "26")
            {
                int intId = Convert.ToInt32(Request.QueryString["project"]);
                var info = db.tbGharardads.SingleOrDefault(n => n.ghId == intId);
                var project = db.tbProjects.SingleOrDefault(n => n.prId == info.ghProject.Value);
                project.prEstelamPending = 1;
                db.SaveChanges();
            }
        }

        protected void ASPxGridView1_DataBound(object sender, EventArgs e)
        {

        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            try
            {
                if (e.DataColumn.FieldName == "paDate")
                {
                    Label lb =
                        ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label1") as Label;
                    lb.Text = CommonClass.ShamsiDate(Convert.ToDateTime(lb.Text)).Insert(4, "/").Insert(7, "/");
                }
            }
            catch { }
        }

    }
}
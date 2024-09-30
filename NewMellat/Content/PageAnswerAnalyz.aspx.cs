using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class PageAnswerAnalyz : System.Web.UI.Page
    {
        NewMellatEntities db=new NewMellatEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
           


            if (!IsPostBack)
            {
                PersianCalendar1.Date = DateTime.Now;
                int intId = Convert.ToInt32(Request.QueryString["project"]);
                var info = db.tbTarhPishnehadis.SingleOrDefault(n => n.thId == intId);
                try
                {
                    lbPricePosh.Text = CommonClass.NumberWithGroup(info.thPricePosh.Value);
                }
                catch { }

                try
                {
                    lbPriceTolid.Text = CommonClass.NumberWithGroup(info.thPriceTolid.Value);
                }
                catch { }}
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

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            sourcePages.InsertParameters["paDate"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
            sourcePages.Insert();


            if (Request.QueryString["type"] == "10")
            {
                int intId = Convert.ToInt32(Request.QueryString["project"]);
                var info = db.tbTarhPishnehadis.SingleOrDefault(n => n.thId == intId);
                var project = db.tbProjects.SingleOrDefault(n => n.prId == info.thProject.Value);
                project.irIsAnalyz = 1;

                //test الحاقیه
                project.prTemp = 0;


                db.SaveChanges();
            }
            ASPxGridView1.DataBind();




            RadNotification1.Show("نامه جدید با موفقیت به ثبت رسید");
        
        }
    }
}
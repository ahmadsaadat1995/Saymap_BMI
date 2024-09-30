using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class PageEdarat3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["type"] == "41")
            {
                tokenVahed.Visible = false;
                Label6.Visible = false;
            }


            if (!IsPostBack)
            {
                PersianCalendar1.Date = DateTime.Now;
            }

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {




            if (Request.QueryString["type"] == "2")
            {
                Label8.Text = Persia.Calendar.ConvertToPersian(PersianCalendar1.Date.AddDays(14)).Simple;

            }
            else
            {
                Label8.Text = Persia.Calendar.ConvertToPersian(PersianCalendar1.Date.AddDays(10)).Simple;
            }
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            foreach (string s in tokenVahed.Value.ToString().Split(','))
            {
                sourcePages.InsertParameters["paDate"].DefaultValue = PersianCalendar1.Date.ToShortDateString();

                sourcePages.InsertParameters["paEdare"].DefaultValue = s;




                sourcePages.Insert();

            }

            // موقتا غیر فعال
            //به روز رسانی پروژ]
            //int intPaperId = Convert.ToInt32(HiddenField1.Value);
            //var paper = db.tbProjectPapers.SingleOrDefault(n => n.paId == intPaperId);

            //var nazar = db.tbNazars.FirstOrDefault(n => n.nzParent == paper.paId);

            //var paper2 = db.tbProjectPapers.SingleOrDefault(n => n.paId == nazar.nzParent.Value);

            //int intTarh = db.tbTarhPishnehadis.SingleOrDefault(n => n.thId == paper2.paProject.Value).thProject.Value;

            //int intProject = intTarh;


         //   var projectInfo = db.tbProjects.SingleOrDefault(n => n.prId == intProject);

        //    projectInfo.prIsErsalBeSherkat = 1;
            //db.SaveChanges();


            ASPxGridView1.DataBind();
            RadNotification1.Show("اطلاعات با موفقیت به ثبت رسید");
            }

        NewMellatEntities db=new NewMellatEntities();

        protected void ASPxGridView1_DataBound(object sender, EventArgs e)
        {
        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "paDate")
            {
                Label lb =
                   ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label1") as
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
        }

        protected void sourcePages_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            int intId = (int)e.Command.Parameters["@paId"].Value;
            HiddenField1.Value = intId.ToString();
        }

    }
}
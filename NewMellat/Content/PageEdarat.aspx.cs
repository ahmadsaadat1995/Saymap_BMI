using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class PageEdarat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["type"] == "41")
            {
                tokenVahed.Visible = false;
                Label6.Visible = false;
            }
            int tarhId = Convert.ToInt32(Request.QueryString["project"]);
            int projectId = db.tbTarhPishnehadis.Where(t => t.thId == tarhId).First().thProject.Value;
           

            if (!IsPostBack)
            {
                PersianCalendar1.Date = DateTime.Now;
                var project = db.tbProjects.Where(p => p.prId == projectId).FirstOrDefault();
                if (project != null)
                {
                    string s = project.prVahed.ToString();
                    if (project.TechnicalSuvisor != null)
                    {
                        s += "," + project.TechnicalSuvisor;
                    }
                    tokenVahed.Value = s;

                    tokenVahed.DataBind();

                }
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
                Label8.Text = Persia.Calendar.ConvertToPersian(PersianCalendar1.Date.AddDays(7)).Simple;
            }
        }


        NewMellatEntities db = new NewMellatEntities();
        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            int intTarh = Convert.ToInt32(Request.QueryString["project"]);
            int intPaperCount = 0;

            if (Request.QueryString["Type"] == "8")
            {
                // کنترل داشتن سوابق نامه مشابه
                var paperInfo = db.tbProjectPapers.Where(n => n.paAct == 1 && n.paType == 8 && n.paProject == intTarh);
                intPaperCount = paperInfo.Count();

            }


            foreach (string s in tokenVahed.Value.ToString().Split(','))
            {
                sourcePages.InsertParameters["paDate"].DefaultValue = PersianCalendar1.Date.ToShortDateString();

                sourcePages.InsertParameters["paEdare"].DefaultValue = s;




                sourcePages.Insert();

            }

            // به روز رسانی طرح پیشنهادی
            if (Request.QueryString["Type"] == "8")
            {

                var tarh = db.tbTarhPishnehadis.SingleOrDefault(n => n.thId == intTarh);
                tarh.thIsEstelamPaper = 1;

                if (intPaperCount > 0)
                {
                    tarh.thIsEstelamRepeat = 1;}

                db.SaveChanges();



            }

        }

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
    }
}
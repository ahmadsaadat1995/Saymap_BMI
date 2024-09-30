using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class PageAnswerEdarat2 : System.Web.UI.Page
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
            NewMellatEntities db = new NewMellatEntities();
            int ppMiddleId = Convert.ToInt32(Request["id"]);
            tbProjectPaper pPaperMiddle = db.tbProjectPapers.Where(pp => pp.paId == ppMiddleId).FirstOrDefault();
            if (pPaperMiddle != null)
            {
                pPaperMiddle.paAct = 0;
                tbNazar nazarPrv =  db.tbNazars.Where(nz => nz.nzId == pPaperMiddle.paProject).FirstOrDefault();
                nazarPrv.nzAct = 0;
                tbProjectPaper pPaper = db.tbProjectPapers.Where(pp => pp.paId == nazarPrv.nzParent).FirstOrDefault();
                pPaper.paAct = 0;
                tbTarhPishnehadi tarh = db.tbTarhPishnehadis.Where(tp => tp.thId == pPaper.paProject).FirstOrDefault();
                tarh.thIsEstelamPaper = 0;
                tarh.thIsEstelamRepeat = 1;
                db.SaveChanges();
            }

            
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

            NewMellatEntities db=new NewMellatEntities();

            if (e.DataColumn.VisibleIndex == 6)
            {
                HyperLink hp =
                    ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink1") as HyperLink;


                // بازگشت به فرم اول
                int intPageId = Convert.ToInt32(Request.QueryString["id"]);
                var pageInfo1 = db.tbProjectPapers.SingleOrDefault(n => n.paId == intPageId);
                int nazarId1 = pageInfo1.paProject.Value;


 

                //var pageInfo2 = db.tbNazars.SingleOrDefault(n => n.nzId == nazarId1);

                // int intEdare = pageInfo2.nzParent.Value;


                //var pageInfo3 = db.tbProjectPapers.SingleOrDefault(n => n.paId == intEdare);

                //hp.NavigateUrl = "~/content/PageEdarat.aspx?project=" + pageInfo3.paProject.Value + "&type=8";
 
            

            }

        }

    }
}
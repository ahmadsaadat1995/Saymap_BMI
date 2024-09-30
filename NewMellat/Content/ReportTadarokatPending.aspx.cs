using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace NewMellat.Content
{
    public partial class ReportTadarokatPending : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "گزارش منتظر تدارکات - آنالیز قیمت";

            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }
        }

        DataTable tbl = new DataTable();
        NewMellatEntities db = new NewMellatEntities();

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsxToResponse();
        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {

            if (e.DataColumn.VisibleIndex == 13)
            {
                Image img = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "img1") as Image;

                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label1") as Label;

                HiddenField hf =
                    ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HiddenField1") as
                        HiddenField;

                HiddenField hf2 =
                    ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HiddenField2") as
                        HiddenField;
                int thId = Convert.ToInt32(hf.Value);

                var papers = db.tbProjectPapers.Where(n => n.paProject == thId && n.paType == 10 && n.paAct == 1);

                int intCountNazar = papers.Count();


                if (intCountNazar > 0)
                {
                    img.Visible = true;
                }
                else
                {
                    img.Visible = false;
                    lb.Text = "بدون پاسخ";

                    // ثبت در datatable
                    DataColumn colName = new DataColumn();
                    DataColumn colVahed = new DataColumn();
                    DataColumn colthId = new DataColumn();
                    DataColumn colMohlat = new DataColumn();
                    DataColumn colShenase = new DataColumn();
                    DataColumn colDate = new DataColumn();
                    DataColumn colPeymankar = new DataColumn();





                    tbl.Columns.Add(colName);
                    tbl.Columns.Add(colVahed);
                    tbl.Columns.Add(colthId);
                    tbl.Columns.Add(colMohlat);
                    tbl.Columns.Add(colShenase);
                    tbl.Columns.Add(colDate);
                    tbl.Columns.Add(colPeymankar);

                    int intId = Convert.ToInt32(hf.Value);
                    var paper1 = db.tbProjectPapers.Where(n => n.paAct == 1 && n.paType == 9 && n.paProject == intId);



                    if (paper1.Count() > 0)
                    {
                        DataRow row = tbl.NewRow();


                        int intProject = Convert.ToInt32(hf2.Value);
                        var project = db.tbProjects.SingleOrDefault(n => n.prId == intProject);


                        StringBuilder sb = new StringBuilder();
                        StringBuilder sb1 = new StringBuilder();
                        StringBuilder sb2 = new StringBuilder();


                        foreach (var paper in paper1)
                        {
                            try
                            {
                                sb.AppendLine(Persia.Number.ConvertToPersian(paper.paShenase));

                            }
                            catch
                            {
                            }

                            try
                            {
                                sb1.AppendLine(Persia.Calendar.ConvertToPersian(paper.paDate.Value).Simple);
                                sb2.AppendLine(Persia.Calendar.ConvertToPersian(paper.paDate.Value.AddDays(10)).Simple);
                            }
                            catch { }
                        }

                        row[0] = project.prTitle;
                        row[1] = db.prInformations.FirstOrDefault(n => n.infId == project.prVahed).infTitle;
                        row[2] = hf.Value;
                        row[3] = sb;
                        row[4] = sb1;
                        row[5] = sb2;
                        row[6] = db.prInformations.FirstOrDefault(n => n.infId == project.prPeymankar).infTitle;




                        tbl.Rows.Add(row);






                    }


                    //ثبت آمار
                    var tmp = db.tbTemps.SingleOrDefault(n => n.tmId == 3);
                    tmp.tmData = tbl.Rows.Count;
                    db.SaveChanges();

                    ASPxGridView2.DataSource = tbl;
                    ASPxGridView2.DataBind();

                    Session.Add("se3", tbl);

                }

            }


        }


        protected void ASPxGridView2_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {


        }


        protected void ASPxGridView2_BeforeColumnSortingGrouping(object sender,
      ASPxGridViewBeforeColumnGroupingSortingEventArgs e)
        {
            DataTable tbl2 = (DataTable)Session.Contents["se3"];
            ASPxGridView2.DataSource = tbl2;
            ASPxGridView2.DataBind();
        }
    }
}
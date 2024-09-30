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
    public partial class ReportGharardadPishnevis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "گزارش منتظر پیش نویس قرارداد";


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


        protected void ASPxGridView3_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            //if (e.DataColumn.VisibleIndex == 1)
            //{
            //    Label lb = ASPxGridView3.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label1") as Label;
            //    lb.Text = (e.VisibleIndex + 1).ToString();
            //}

            if (e.DataColumn.FieldName == "ghId")
            {
                HiddenField hf = ASPxGridView3.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HiddenField4") as HiddenField;
                HiddenField hf2 = ASPxGridView3.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HiddenField5") as HiddenField;

                // کنترل داشتن نامه پیش نویس
                int ghId = Convert.ToInt32(hf.Value);

                var papers = db.tbProjectPapers.Where(n => n.paAct == 1 && n.paType == 25 && n.paProject == ghId);
                if (papers.Count() == 0)
                {
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


                    DataRow row = tbl.NewRow();

                    int intProject = Convert.ToInt32(hf2.Value);
                    var project = db.tbProjects.SingleOrDefault(n => n.prId == intProject);

                    var heyatMosavab = db.tbHeyatNezaratMosavabs.Where(n => n.hmMainProjectId == intProject);






                    StringBuilder sb = new StringBuilder();
                    StringBuilder sb1 = new StringBuilder();
                    StringBuilder sb2 = new StringBuilder();

                    try
                    {



                        foreach (var item in heyatMosavab)
                        {

                            var paper =
                                db.tbProjectPapers.Where(n => n.paAct == 1 && n.paType == 81 && n.paProject == item.hmId);

                            foreach (var pa in paper)
                            {


                                sb.AppendLine(Persia.Number.ConvertToPersian(pa.paShenase));

                                try
                                {
                                    sb1.AppendLine(Persia.Calendar.ConvertToPersian(pa.paDate.Value).Simple);
                                    sb2.AppendLine(Persia.Calendar.ConvertToPersian(pa.paDate.Value.AddDays(10)).Simple);
                                }
                                catch (Exception)
                                {

                                }
                            }

                        }
                    }
                    catch (Exception)
                    {

                    }
                    row[0] = project.prTitle;
                    row[1] = db.prInformations.FirstOrDefault(n => n.infId == project.prVahed).infTitle;
                    row[2] = hf.Value;
                    row[3] = sb;
                    row[4] = sb1;
                    row[5] = sb2;
                    row[6] = db.prInformations.FirstOrDefault(n => n.infId == project.prPeymankar).infTitle;
                    tbl.Rows.Add(row);


                    //ثبت آمار
                    var tmp = db.tbTemps.SingleOrDefault(n => n.tmId == 5);
                    tmp.tmData = tbl.Rows.Count;
                    db.SaveChanges();



                    ASPxGridView2.DataSource = tbl;
                    ASPxGridView2.DataBind();


                    Session.Add("se4",tbl);
                }
            }
        }



        protected void ASPxGridView2_BeforeColumnSortingGrouping(object sender,
       ASPxGridViewBeforeColumnGroupingSortingEventArgs e)
        {
            DataTable tbl2 = (DataTable)Session.Contents["se4"];
            ASPxGridView2.DataSource = tbl2;
            ASPxGridView2.DataBind();

        }
    }
}
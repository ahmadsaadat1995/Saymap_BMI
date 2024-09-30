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
    public partial class ReportErsalBeSherkat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "گزارش منتظر پاسخ شرکت";

            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }
        }

        protected void ASPxGridView2_BeforeColumnSortingGrouping(object sender,
          ASPxGridViewBeforeColumnGroupingSortingEventArgs e)
        {
            DataTable tbl2 = (DataTable)Session.Contents["se2"];
            ASPxGridView2.DataSource = tbl2;
            ASPxGridView2.DataBind();

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





                Image img = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "img1") as Image;

                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label1") as Label;

                Label lb2 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label2") as Label;
                Label lb3 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label3") as Label;

                HiddenField hf =
                    ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HiddenField1") as
                        HiddenField;

                HiddenField hf2 =
                    ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HiddenField2") as
                        HiddenField;
                int thId = Convert.ToInt32(hf.Value);

                var papers = db.tbProjectPapers.Where(n => n.paProject == thId && n.paAct == 1);

                int intcountSherkat = 0;

                int intCountNazar = 0;
                foreach (var paper in papers)
                {
                    var nazarCount = db.tbNazars.Where(n => n.nzAct == 1 && n.nzParent == paper.paId && n.nzAct == 1);
                    intCountNazar += nazarCount.Count();


                    foreach (var itemNazar in nazarCount)
                    {
                        var paper22 = db.tbProjectPapers.Where(n => n.paProject == itemNazar.nzId && n.paType == 50 && n.paAct == 1);



                        var paper2 = db.tbProjectPapers.FirstOrDefault(n => n.paProject == itemNazar.nzId && n.paType == 50 && n.paAct == 1);
                        var p2 = paper2;

                        //-------------------tst
                        //foreach (var p2 in paper2)
                        //{

                        // پاسخ ارسال به شرکت
                        var answer2 = db.tbNazars.Where(n => n.nzAct == 1 && n.nzParent == p2.paId);



                        try
                        {



                            if (!answer2.Any())
                            {


                                DataRow row = tbl.NewRow();


                                int intProject = Convert.ToInt32(hf2.Value);
                                var project = db.tbProjects.SingleOrDefault(n => n.prId == intProject && n.prAct == 1);


                                StringBuilder sb = new StringBuilder();
                                StringBuilder sb1 = new StringBuilder();
                                StringBuilder sb2 = new StringBuilder();
                                try
                                {
                                    sb.AppendLine(Persia.Number.ConvertToPersian(p2.paShenase));
                                }
                                catch { }
                                try
                                {
                                    sb1.AppendLine(Persia.Calendar.ConvertToPersian(p2.paDate.Value).Simple);
                                    sb2.AppendLine(Persia.Calendar.ConvertToPersian(p2.paDate.Value.AddDays(10)).Simple);


                                }
                                catch (Exception)
                                {
                                }

                                row[0] = project.prTitle;
                                row[1] = db.prInformations.FirstOrDefault(n => n.infId == project.prVahed).infTitle; row[2] = hf.Value;
                                row[3] = sb;
                                row[4] = sb1;
                                row[5] = sb2;
                                row[6] = db.prInformations.FirstOrDefault(n => n.infId == project.prPeymankar).infTitle;




                                tbl.Rows.Add(row);

                            }
                        }
                        catch (Exception)
                        {


                        }
                        //------------------------------

                        intcountSherkat += paper22.Count();
                        //}





                    }


                }

                lb2.Text = intcountSherkat.ToString();

                if (intCountNazar > 0)
                {
                    img.Visible = true;




                }
                else
                {
                    img.Visible = false;
                    lb.Text = "بدون پاسخ";


                }
                ASPxGridView2.DataSource = tbl;
                ASPxGridView2.DataBind();



                //ثبت آمار
                var tmp = db.tbTemps.SingleOrDefault(n => n.tmId == 2);
                tmp.tmData = tbl.Rows.Count;
                db.SaveChanges();


                //test
                Session.Add("se2", tbl);

            }


        }


        protected void ASPxGridView2_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            //if (e.DataColumn.VisibleIndex == 3)
            //{

            //    Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label1") as Label;

            //}

        }

        protected void ASPxGridView2_CustomColumnDisplayText(object sender, ASPxGridViewColumnDisplayTextEventArgs e)
        {



        }



    }
}
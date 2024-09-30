using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace NewMellat.Content
{
    public partial class pageMosavabat : System.Web.UI.Page
    {

        void loadColumns()
        {
            foreach (ListEditItem item in chkColumns.Items)
            {
                if (item.Selected)
                {

                    ASPxGridView1.Columns[Convert.ToInt32(item.Value)].Visible = true;
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "مصوبات ";


            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }


            foreach (GridViewColumn column in ASPxGridView1.AllColumns)
            {
                column.Visible = false;
            }

            SqlDataSource1.SelectParameters["prCode"].DefaultValue = Page.User.Identity.Name;


            loadColumns();


        }
        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {

            if (e.DataColumn.VisibleIndex == 10)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink1") as HyperLink;
                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc({0}); return false;", strItembody[1]));
            }

            if (e.DataColumn.VisibleIndex == 11)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink2") as HyperLink;
                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc2({0}); return false;", strItembody[1]));
            }

            if (e.DataColumn.VisibleIndex == 12)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink111") as HyperLink;
                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc3({0}); return false;", strItembody[1]));
            }




            if (e.DataColumn.FieldName == "mosDate")
            {
                Label lb1 =
                    ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label1") as Label;

                try
                {
                    if (lb1.Text != "1/1/2001 12:00:00 AM")
                    {
                        lb1.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb1.Text)).Simple;
                    }
                    else
                    {
                        lb1.Text = "";
                    }
                }
                catch (Exception)
                {


                }

            }

            if (e.DataColumn.FieldName == "meetingDate")
            {
                Label lb1 =
                    ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label7") as Label;


                try
                {
                    if (lb1.Text != "1/1/2001 12:00:00 AM")
                    {
                        lb1.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb1.Text)).Simple;
                    }
                    else
                    {
                        lb1.Text = "";
                    }
                }
                catch (Exception)
                {


                }


            }

            if (e.DataColumn.FieldName == "mosAmaliatiDate")
            {
                Label lb1 =
                    ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label2") as Label;

                try
                {
                    if (lb1.Text != "1/1/2001 12:00:00 AM")
                    {
                        lb1.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb1.Text)).Simple;
                    }
                    else
                    {
                        lb1.Text = "";
                    }
                }
                catch (Exception)
                {


                }

            }

            if (e.DataColumn.FieldName == "mosErsalDate")
            {
                Label lb1 =
                    ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label3") as Label;

                try
                {
                    if (lb1.Text != "1/1/2001 12:00:00 AM")
                    {
                        lb1.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb1.Text)).Simple;
                    }
                    else
                    {
                        lb1.Text = "";
                    }
                }
                catch (Exception)
                {


                }

            }



            if (e.DataColumn.FieldName == "mosSRS")
            {
                Label lb1 =
                    ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label5") as Label;

                try
                {
                    if (lb1.Text != "1/1/2001 12:00:00 AM")
                    {
                        lb1.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb1.Text)).Simple;
                    }
                    else
                    {
                        lb1.Text = "";
                    }
                }
                catch (Exception)
                {


                }

            }


            if (e.DataColumn.FieldName == "mosSRSanswer")
            {
                Label lb1 =
                    ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label6") as Label;

                try
                {
                    if (lb1.Text != "1/1/2001 12:00:00 AM")
                    {
                        lb1.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb1.Text)).Simple;
                    }
                    else
                    {
                        lb1.Text = "";
                    }
                }
                catch (Exception)
                {


                }

            }




        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsxToResponse();
        }

        protected void ASPxGridView1_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Delete)
            {

                DataRow dr = ((DataRowView)(sender as ASPxGridView).GetRow(e.VisibleIndex)).Row;
                if (!SecurityClass.IsAccess(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath), 1))
                {
                    e.Visible = false;
                }
            }


            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Edit)
            {
                //  DataRow dr = ((DataRowView)(sender as ASPxGridView).GetRow(e.VisibleIndex)).Row;
                if (!SecurityClass.IsAccess(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath), 3))
                {
                    e.Visible = false;
                }
            }
        }

        private NewMellatEntities db = new NewMellatEntities();

        protected void ASPxGridView1_RowCommand(object sender, ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "bk")
            {
                try
                {
                    var mosavabId = Convert.ToInt32(e.CommandArgs.CommandArgument);
                    var mosavab = db.tbKhobreganMosavabs.SingleOrDefault(n => n.mosId == mosavabId);

                    //  به روز رسانی خبرگان
                    var khobregan = db.tbKhbregans.SingleOrDefault(n => n.khId == mosavab.mosKhob);
                    khobregan.khStatus = 0;
                    db.SaveChanges();


                    // حذف مصوب
                    db.tbKhobreganMosavabs.Remove(mosavab);
                    db.SaveChanges();


                    DataBind();
                }
                catch { }
            }
        }


        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            loadColumns();
        }

     


        protected void ASPxGridView1_DataBound(object sender, EventArgs e)
        {
            if (chkColumns.Items.Count == 0)
            {
                foreach (GridViewColumn column in ASPxGridView1.AllColumns)
                {
                    chkColumns.Items.Add(new ListEditItem(column.Caption, column.Index));
                }
            }


            chkColumns.Items[1].Selected = true;
            chkColumns.Items[2].Selected = true;
            chkColumns.Items[3].Selected = true;
            chkColumns.Items[5].Selected = true;
            chkColumns.Items[6].Selected = true;
            chkColumns.Items[7].Selected = true;
            chkColumns.Items[8].Selected = true;
            chkColumns.Items[9].Selected = true;
            chkColumns.Items[4].Selected = true;
            chkColumns.Items[11].Selected = true;
            chkColumns.Items[10].Selected = true;
            chkColumns.Items[12].Selected = true;
            loadColumns();

        }

        protected void ASPxGridView1_PageIndexChanged(object sender, EventArgs e)
        {
            loadColumns();
        }

        protected void ASPxGridView1_ProcessColumnAutoFilter(object sender, ASPxGridViewAutoFilterEventArgs e)
        {
            loadColumns();
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            foreach (ListEditItem item in chkColumns.Items)
            {
                item.Selected = true;
            }
        }
    }
}
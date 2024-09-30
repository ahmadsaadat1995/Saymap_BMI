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
    public partial class PageProjectList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }

            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "مدیریت پروژه ها";


            sourceProjects.SelectParameters["prCode"].DefaultValue = Page.User.Identity.Name;


            foreach (GridViewColumn column in ASPxGridView1.AllColumns)
            {
                column.Visible = false;
            }


        

            loadColumns();

            GridViewDataComboBoxColumn col = ASPxGridView1.Columns["TechnicalSuvisor"]
            as GridViewDataComboBoxColumn;
            ListEditItem itm = new ListEditItem("انتخاب کنید", null);

            col.PropertiesComboBox.Items.Insert(0, itm);
        }


        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {

            if (e.DataColumn.VisibleIndex == 11)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink1") as HyperLink;
                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc({0}); return false;", strItembody[1]));



            }

            if (e.DataColumn.VisibleIndex == 12)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink2") as HyperLink;
                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc2({0}); return false;", strItembody[1]));
            }
            if (e.DataColumn.VisibleIndex == 13)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink3") as HyperLink;
                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc3({0}); return false;", strItembody[1]));
            }


            if (e.DataColumn.VisibleIndex == 14)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink4") as HyperLink;
                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc4({0}); return false;", strItembody[1]));
            }
            if (e.DataColumn.VisibleIndex == 34)
            {
                 try
                {
                    HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink5") as HyperLink;
                    string[] strItembody = hp.NavigateUrl.Split('=');
                    hp.Attributes.Add("onclick", string.Format("loadDoc5({0}); return false;", strItembody[1]));
               
                }
                catch (Exception)
                {

                    
                }
            }
            if (e.DataColumn.VisibleIndex == 17)
            {
                Label hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label3") as Label;
                try
                {
                    hp.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(hp.Text)).Simple;
                }
                catch { }
            }
            if (e.DataColumn.VisibleIndex == 132)
            {
                Label hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label112") as Label;
                try
                {
                    hp.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(hp.Text)).Simple;
                }
                catch { }
            }
            if (e.DataColumn.VisibleIndex == 133)
            {
                Label hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label116") as Label;
                try
                {
                    hp.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(hp.Text)).Simple;
                }
                catch { }
            }
            try
            {
                if (e.DataColumn.FieldName == "prRegDate")
                {
                    Label lb =
                        ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label1") as Label;
                    lb.Text = CommonClass.ShamsiDate(Convert.ToDateTime(lb.Text)).Insert(4, "/").Insert(7, "/");
                }
            }
            catch { }
        }

        protected void ASPxGridView1_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Delete)
            {


                if (!SecurityClass.IsAccess(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath), 1))
                {
                    e.Visible = false;
                }


            }


            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Edit)
            {


                if (!SecurityClass.IsAccess(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath), 3))
                {
                    e.Visible = false;
                }


            }
        }

        protected void ASPxGridView1_HtmlRowCreated(object sender, ASPxGridViewTableRowEventArgs e)
        {
            //if (e.RowType != GridViewRowType.Data) return;

            HiddenField hf = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, null,
         "HiddenField1") as HiddenField;



            //e.Row.Visible = false;

        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
 
            ASPxGridViewExporter1.WriteXlsxToResponse();

        }


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
            chkColumns.Items[10].Selected = true;


            loadColumns();
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            loadColumns();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            sourceProjects.SelectParameters["prCode"].DefaultValue = Page.User.Identity.Name;

            foreach (ListEditItem item in chkColumns.Items)
            {
                item.Selected = true;
            }
        }

        protected void ASPxGridView1_ProcessColumnAutoFilter(object sender, ASPxGridViewAutoFilterEventArgs e)
        {
            loadColumns();
        }

        protected void ASPxGridView1_PageIndexChanged(object sender, EventArgs e)
        {
            loadColumns();
        }
    }
}
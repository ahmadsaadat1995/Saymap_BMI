using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace NewMellat.Content
{
    public partial class PageAdminPages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "مدیران دسترسی صفحات";


            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }

            // کنترل امنیت

            if (!Page.User.IsInRole("admins"))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }


        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {

            SqlConnection openDb = new SqlConnection();
            openDb.ConnectionString = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;


            NewMellatEntities db = new NewMellatEntities();
            string strUser = SecurityClass.EncryptText(ASPxComboBox1.Value.ToString());


            //حذف قبل
            var info = db.tbAdminInPages.Where(n => n.pgCode == strUser).Select(n => n);
            foreach (var item in info)
            {
                var details = db.tbAdminInPages.SingleOrDefault(n => n.pgId == item.pgId);
                db.tbAdminInPages.Remove(details);
            }

            db.SaveChanges();

            foreach (ListEditItem item in ASPxCheckBoxList1.Items)
            {
                if (item.Selected)
                {

                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "spInsertAccessPage";
                    cmd.Connection = openDb;

                    //string strPageName = SecurityClass.EncryptText(item.Value.ToString());
                    string strPageName = item.Value.ToString();
                    string strPageCode = SecurityClass.EncryptText(ASPxComboBox1.Value.ToString());


                    cmd.Parameters.AddWithValue("@pgPageName", strPageName);
                    cmd.Parameters.AddWithValue("@pgCode", strPageCode);
                    openDb.Open();
                    cmd.ExecuteNonQuery();
                    openDb.Close();
                }
            }

            ASPxGridView1.DataBind();

        }


        NewMellatEntities db = new NewMellatEntities();

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "pgPageName")
            {
                try
                {
                    Label hp =
                        ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label13") as Label;
                    //    hp.Text = SecurityClass.DecryptText(hp.Text);
                    hp.Text = hp.Text;
                    hp.Text = db.tbPages.FirstOrDefault(n => n.pgName == hp.Text).pgTitle;
                }
                catch { }
            }


            if (e.DataColumn.FieldName == "pgCode")
            {
                Label hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label14") as Label;
                hp.Text = SecurityClass.DecryptText(hp.Text);




            }
        }

        protected void ASPxComboBox1_DataBound(object sender, EventArgs e)
        {
            ASPxComboBox1.Items.Insert(0, new ListEditItem("انتخاب", "-1"));
            ASPxComboBox1.SelectedIndex = 0;
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
                DataRow dr = ((DataRowView)(sender as ASPxGridView).GetRow(e.VisibleIndex)).Row;
                if (!SecurityClass.IsAccess(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath), 3))
                {
                    e.Visible = false;
                }
            }
        }

        protected void ASPxComboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            NewMellatEntities db = new NewMellatEntities();
            string strUser = SecurityClass.EncryptText(ASPxComboBox1.Value.ToString());



            var info = db.tbAdminInPages.Where(n => n.pgCode == strUser).Select(n => n);

            foreach (ListEditItem item in ASPxCheckBoxList1.Items)
            {
                var itm = info.Where(a => a.pgPageName == item.Value).FirstOrDefault();
                if (itm != null)
                {
                    item.Selected = true;
                }

            }

        }

        protected void ASPxButtonAll_Click(object sender, EventArgs e)
        {
            foreach (ListEditItem item in ASPxCheckBoxList1.Items)
            {
                item.Selected = true;
            }
        }

        protected void ASPxButtonReverse_Click(object sender, EventArgs e)
        {
            foreach (ListEditItem item in ASPxCheckBoxList1.Items)
            {
                item.Selected = !item.Selected;
            }
        }

    }
}
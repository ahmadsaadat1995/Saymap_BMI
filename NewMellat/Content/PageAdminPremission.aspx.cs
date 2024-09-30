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
    public partial class PageAdminPremission : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Label panel = (Label)this.Master.FindControl("lbHeader");

            panel.Text = "مدیریت دسترسی کاربران";

            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }

            if (!Page.User.IsInRole("admins"))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }


            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                //  Response.Redirect(@"~\content\PageDenied.aspx");
            }
        }


        NewMellatEntities db = new NewMellatEntities();


        protected void ASPxButton1_Click(object sender, EventArgs e)
        {

            //حذف آیتم های قبلی
            string strUser = SecurityClass.EncryptText(drpUsers.Value.ToString());
            int perm = Convert.ToInt32(drpPermissions.Value.ToString());
            if (Convert.ToInt32(drpPermissions.Value.ToString()) == -1)
                return;
            var info = db.tbAminPremissionAccesses.Where(n => n.acCode == strUser && n.acPremission == perm).Select(n => n);
            foreach (var access in info)
            {
                var details = db.tbAminPremissionAccesses.SingleOrDefault(n => n.acId == access.acId);
                db.tbAminPremissionAccesses.Remove(details);

            }
            db.SaveChanges();
            //---------------------
            foreach (ListEditItem item in ASPxCheckBoxList1.Items)
            {
                if (item.Selected)
                {

                    tbAminPremissionAccess access = new tbAminPremissionAccess();
                    access.acAct = 1;
                    access.acCode = SecurityClass.EncryptText(drpUsers.Value.ToString());
                    access.acPage = SecurityClass.EncryptText(item.Value.ToString());
                    access.acPremission = Convert.ToInt32(drpPermissions.Value.ToString());
                    db.tbAminPremissionAccesses.Add(access);
                    try
                    {
                        db.SaveChanges();
                    }
                    catch (Exception)
                    {
                    }


                }
            }

            ASPxGridView1.DataBind();
            


            //}
        }



        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "acPage")
            {
                Label hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label14") as Label;
                hp.Text = SecurityClass.DecryptText(hp.Text);

                var info = db.tbPages.FirstOrDefault(n => n.pgName == hp.Text);
                hp.Text = info.pgTitle;
            }

            if (e.DataColumn.FieldName == "acCode")
            {
                Label hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label15") as Label;
                hp.Text = SecurityClass.DecryptText(hp.Text);
            }
        }

        protected void drpUsers_DataBound(object sender, EventArgs e)
        {
            drpUsers.Items.Insert(0, new ListEditItem("انتخاب", "-1"));
            drpUsers.SelectedIndex = 0;

        }
        protected void drpPermissions_DataBound(object sender, EventArgs e)
        {
            drpPermissions.Items.Insert(0, new ListEditItem("انتخاب", "-1"));
            drpPermissions.SelectedIndex = 0;

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



        protected void drpUsers_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadCurrentPermissions();
        }

        protected void drpPermissions_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadCurrentPermissions();
        }
        private void LoadCurrentPermissions()
        {
            if (drpUsers.Value.ToString() != "-1" && Convert.ToInt32(drpPermissions.Value) > 0)
            {
                string strUser = SecurityClass.EncryptText(drpUsers.Value.ToString());
                int permId = Convert.ToInt32(drpPermissions.Value);
                var info = db.tbAminPremissionAccesses.Where(n => n.acCode == strUser && n.acPremission == permId).Select(n => n).ToList();
                foreach (ListEditItem item in ASPxCheckBoxList1.Items)
                {
                    string p = SecurityClass.EncryptText(item.Value.ToString());

                    item.Selected = info.Exists(n => n.acPage == p);





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
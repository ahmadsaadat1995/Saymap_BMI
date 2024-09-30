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
    public partial class PageAdminProject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label panel = (Label)this.Master.FindControl("lbHeader");

            panel.Text = "مدیریت دسترسی پروژه";


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
        protected void ASPxButton2_Click(object sender, EventArgs e)
        {
            NewMellatEntities db = new NewMellatEntities();
            string strcode = drpUsers.Value.ToString();

            List<tbAdminProject> adProjItems = db.tbAdminProjects.Where(n => n.prCode == strcode).ToList();
            List<tbAdminProject> adPeyItems  = adProjItems.FindAll(ad => ad.prType == 1);
            foreach (ListEditItem item1 in ASPxCheckBoxList1.Items)
            {
                item1.Selected = adPeyItems.FirstOrDefault(ad => ad.prProject == Convert.ToInt32(item1.Value)) != null;
            }
            int typeId = CheckboxProjectList.Checked ? 3 : 2;
            List<tbAdminProject> adOffItems = adProjItems.FindAll(ad => ad.prType == typeId);
            
            foreach (ListEditItem item1 in ASPxCheckBoxList2.Items)
            {
                item1.Selected = adOffItems.FirstOrDefault(ad => ad.prProject == Convert.ToInt32(item1.Value)) != null;
            }
          
        }
        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            NewMellatEntities db = new NewMellatEntities();

            //try
            //{


            if (ASPxCheckBoxList1.SelectedItems.Count > 0 )
            {
                string strcode = drpUsers.Value.ToString();

                // حذف موارد قبلی
                var info = db.tbAdminProjects.Where(n => n.prCode == strcode && n.prType == 1).Select(n => n);

                foreach (var item in info)
                {
                    db.tbAdminProjects.Remove(item);

                }
                db.SaveChanges();


                foreach (ListEditItem item2 in ASPxCheckBoxList1.Items)
                {
                    if (item2.Selected)
                    {
                        SqlDataSource1.InsertParameters["prProject"].DefaultValue = item2.Value.ToString();
                        SqlDataSource1.InsertParameters["prType"].DefaultValue = "1";
                        SqlDataSource1.Insert();
                    }
                }


            }
            if (ASPxCheckBoxList2.SelectedItems.Count > 0)
            {

                string strcode = drpUsers.Value.ToString();

                int typeId = CheckboxProjectList.Checked ? 3 : 2;
                // حذف موارد قبلی
                var info = db.tbAdminProjects.Where(n => n.prCode == strcode && n.prType == typeId).Select(n => n);

                foreach (var item in info)
                {
                    db.tbAdminProjects.Remove(item);
                }
                db.SaveChanges();


                foreach (ListEditItem item2 in ASPxCheckBoxList2.Items)
                {
                    if (item2.Selected)
                    {
                        SqlDataSource1.InsertParameters["prProject"].DefaultValue = item2.Value.ToString();
                        SqlDataSource1.InsertParameters["prType"].DefaultValue = typeId.ToString();
                        SqlDataSource1.Insert();
                    }
                }
            }


            //}
            //catch (Exception)
            //{

            //}

            ASPxGridView1.DataBind();
            Label14.Text = "اطلاعات با موفقیت به ثبت رسید";
        }

        protected void drpUsers_DataBound(object sender, EventArgs e)
        {

        }

        protected void ASPxGridView1_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            //if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Delete)
            //{

            //    DataRow dr = ((DataRowView)(sender as ASPxGridView).GetRow(e.VisibleIndex)).Row;
            //    if (!SecurityClass.IsAccess(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath), 1))
            //    {
            //        e.Visible = false;
            //    }
            //}


            //if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Edit)
            //{
            //    DataRow dr = ((DataRowView)(sender as ASPxGridView).GetRow(e.VisibleIndex)).Row;
            //    if (!SecurityClass.IsAccess(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath), 3))
            //    {
            //        e.Visible = false;
            //    }
            //}
        }

        protected void drpUsers_SelectedIndexChanged(object sender, EventArgs e)
        {

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
        protected void ASPxButtonAll1_Click(object sender, EventArgs e)
        {
            foreach (ListEditItem item in ASPxCheckBoxList2.Items)
            {
                item.Selected = true;
            }
        }

        protected void ASPxButtonReverse1_Click(object sender, EventArgs e)
        {
            foreach (ListEditItem item in ASPxCheckBoxList2.Items)
            {
                item.Selected = !item.Selected;
            }
        }


    }
}
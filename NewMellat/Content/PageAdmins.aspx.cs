using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace NewMellat.Content
{
    public partial class PageAdmins : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //ASPxRoundPanel panel = (ASPxRoundPanel)this.Master.FindControl("ASPxRoundPanel1");
            //panel.HeaderText = "مدیران سیستم";


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

        NewMellatEntities db = new NewMellatEntities();

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            tbAdmin admin = new tbAdmin();
            admin.adAct = 1;
            admin.adPersonCode = SecurityClass.EncryptText(ASPxComboBox1.Value.ToString());
            db.tbAdmins.Add(admin);
            db.SaveChanges();
            ASPxGridView1.DataBind();

            if (ASPxCheckBox1.Checked)
            {
                try
                {
                    Roles.AddUserToRole(ASPxComboBox1.Value.ToString(), "admins");

                }
                catch (Exception)
                {

                }
            }
        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {

            if (e.DataColumn.FieldName == "adPersonCode")
            {
                Label hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label11") as Label;
                hp.Text = SecurityClass.DecryptText(hp.Text);
            }



            if (e.DataColumn.VisibleIndex == 2)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink1") as HyperLink;
                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc({0}); return false;", strItembody[1]));

            }
        }

        protected void ASPxGridView1_CustomButtonInitialize(object sender, ASPxGridViewCustomButtonEventArgs e)
        {

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


    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace NewMellat.Content
{
    public partial class PagePropozalFirst : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.User.IsInRole("admins"))
            {
              //  Response.Redirect(@"~\content\PageDenied.aspx");
            }


            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "ثبت پروپوزال جدید";



        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {

            sourceProject.SelectParameters["prId"].DefaultValue = drpProject.Value.ToString();

            if (!string.IsNullOrEmpty(txtGharardadCode.Text))
            {
                sourceProject.SelectParameters["code"].DefaultValue = txtGharardadCode.Text;
            }
            else
            {
                sourceProject.SelectParameters["code"].DefaultValue = "-1";
            }
            ASPxGridView1.DataBind();
        }

        protected void drpProject_DataBound(object sender, EventArgs e)
        {
            drpProject.Items.Insert(0, new ListEditItem("انتخاب", "-1"));
            drpProject.SelectedIndex = 0;
        }

        protected void ASPxGridView1_RowCommand(object sender, ASPxGridViewRowCommandEventArgs e)
        {
            if(e.CommandArgs.CommandName=="n")
            {
                HiddenField1.Value = e.CommandArgs.CommandArgument.ToString();

                ASPxGridView2.Visible = true;
                ASPxGridView3.Visible = true;

                ASPxGridView2.DataBind();
                ASPxGridView3.DataBind();

            }
        }
    }
}
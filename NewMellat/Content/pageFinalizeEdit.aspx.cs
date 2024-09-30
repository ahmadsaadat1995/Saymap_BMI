using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class pageFinalizeEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "ویرایش نظرسنجی";
            var userName = Page.User.Identity.Name;
             if (userName != "m.khanahmadi" && userName != "a.hadimanesh")
             {
                 Response.Redirect("http://172.22.65.16:1983/");
             }
            if (!IsPostBack)
            {
                DataAccessBase db = new DataAccessBase();
                DataTable dt = db.ReaderText("select * from tbSurvey where id = " + Request.QueryString["id"]);
                useSelect.SelectedValue = dt.Rows[0]["inUse"].ToString();
                userCount.Text = dt.Rows[0]["usersCount"].ToString();
                description.Text = dt.Rows[0]["descriptions"].ToString();
            }
        }

        protected void saveBtn_Click(object sender, EventArgs e)
        {
            DataAccessBase db = new DataAccessBase();
            int res = db.NonQueryTxt(string.Format(@"UPDATE [dbo].[tbSurvey]
                SET [inUse] = {0}
                   ,[usersCount] = {1}
                   ,[descriptions] = N'{2}'
                WHERE id={3}",useSelect.SelectedValue,userCount.Text,description.Text,Request.QueryString["id"]));
            if (res == 1)
                Response.Write("<script>alert('عملیات با موفقیت انجام شد')</script>");            
            else
                Response.Write("<script>alert('خطا در ذخیره سازی اطلاعات')</script>");
        }
    }
}
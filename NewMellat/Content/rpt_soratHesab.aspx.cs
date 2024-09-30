using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class rpt_soratHesab : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }
            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "گزارش صورتحساب ها";
            string userName = Page.User.Identity.Name;
            lit1.Text = "<script>var username='" + userName + "'</script>";
        }
        protected void btn1_Click(object sender, EventArgs e)
        {
            string Cs = "Data Source=172.22.65.20;Initial Catalog=NewMellat;Persist Security Info=True;User ID=sa;Password=awer_1111";
            SqlConnection DbConn = new SqlConnection(Cs);
            SqlCommand ExecJob = new SqlCommand();
            ExecJob.CommandType = CommandType.StoredProcedure;
            ExecJob.CommandText = "msdb.dbo.sp_start_job";
            ExecJob.Parameters.AddWithValue("@job_name", "rpt_sorathesab");
            ExecJob.Connection = DbConn; //assign the connection to the command.

            using (DbConn)
            {
                DbConn.Open();
                using (ExecJob)
                {
                    ExecJob.ExecuteNonQuery();
                    string userName = Page.User.Identity.Name;
                    lit1.Text = "<script>var username='" + userName + ";getData();'</script>";
                }
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class pageFinalize2 : System.Web.UI.Page
    {
       
      //  string userName = Page.User.Identity.Name;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string connetionString = ConfigurationManager.ConnectionStrings["NewMellatConnectionString"].ConnectionString;
                var userName = Page.User.Identity.Name;
                DataTable dt = new DataTable();
                using (var conn = new SqlConnection(connetionString))
                using (var command = new SqlCommand("pageFinalize", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("userName",userName );
                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(command);
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
                        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
                        Dictionary<string, object> row;
                        foreach (DataRow dr in dt.Rows)
                        {
                            row = new Dictionary<string, object>();
                            foreach (DataColumn col in dt.Columns)
                            {
                                row.Add(col.ColumnName, dr[col]);
                            }
                            rows.Add(row);
                        }

                        Lit1.Text = "<script>var myData=" + serializer.Serialize(rows) + ";var userName='"+userName+"'</script>";
                    }
                    else
                    {
                        Response.Redirect("http://172.22.65.16:1983/content/dashboardHN.aspx");
                    }

                }
            }


        }

        [WebMethod]
        public static string InsertSurvey(int prId,int inUse,int userCount,int depId,string desc,string userName)
        {
            string result = "in method";
            string query = string.Format("INSERT INTO [dbo].[tbSurvey]([inUse],[date],[doneUser],[usersCount],[descriptions],[prId],[depId]) VALUES({0},'{1}','{2}',{3},N'{4}',{5},{6})", inUse, DateTime.Now,userName, userCount,desc, prId,depId);
            try
            {
                using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["NewMellatConnectionString"].ConnectionString))
                using (var command = new SqlCommand(query, conn))
                {
                    command.CommandType = CommandType.Text;
                    conn.Open();
                    command.ExecuteNonQuery();
                    result = "ok";
                }
            }
            catch (Exception ex)
            {

                result = ex.Message;
            }

            return result;

        }
    }
}
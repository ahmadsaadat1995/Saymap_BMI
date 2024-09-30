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
    public partial class pageFinalizeView2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string connetionString = ConfigurationManager.ConnectionStrings["NewMellatConnectionString"].ConnectionString;
                var userName = Page.User.Identity.Name;
                DataTable dt = new DataTable();
                using (var conn = new SqlConnection(connetionString))
                using (var command = new SqlCommand("pageFinalizeView2", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("userName", userName);
                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(command);
                    da.Fill(dt);
                   
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

                        Lit1.Text = "<script>var myData=" + serializer.Serialize(rows) + "</script>";
                    
                   

                }
            }
        }
    }
}
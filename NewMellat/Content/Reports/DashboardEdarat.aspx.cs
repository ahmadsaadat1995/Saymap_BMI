using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace NewMellat.Content.Reports
{
    public partial class DashboardEdarat : System.Web.UI.Page
    {

        NewMellatEntities db = new NewMellatEntities();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                loadInfo();
            }

        }


        void loadInfo()
        {
            SqlConnection openDb = new SqlConnection();
            openDb.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["NewMellatConnectionString"].ConnectionString;

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT count(*) as counts FROM tbProjectPaper INNER JOIN tbGharardad ON tbProjectPaper.paProject = tbGharardad.ghId WHERE(tbProjectPaper.paType = 26) AND(tbProjectPaper.paAct = 1) AND (tbGharardad.ghAct = 1) and tbProjectPaper.paId not in (select nzParent from tbNazar where nzStatus in (195,196))";

            cmd.Connection = openDb;

            openDb.Open();


            ASPxGaugeControl1.Value = cmd.ExecuteScalar().ToString();
            openDb.Close();

         

            //test
            string str = "";
            string str2 = "";
            var items = drpVahed2.SelectedItems;
            var items2 = drpPeymankar0.SelectedItems;

            foreach (  DevExpress.Web.ListEditItem it in items)
            {
               str += it.Value+",";
            }

            try
            {
                str = str.Remove(str.Length - 1, 1);
            }
            catch { }



            foreach (DevExpress.Web.ListEditItem it in items2)
            {
                str2 += it.Value + ",";
            }

            try
            {
                str2 = str.Remove(str2.Length - 1, 1);
            }
            catch { }


            SqlCommand cmd2 = new SqlCommand();
            cmd2.Connection = openDb;

            //if (str != "")
            //{
            //cmd2.CommandText = "SELECT count(*) as counts FROM  tbProjects INNER JOIN tbTarhPishnehadi ON tbProjects.prId = tbTarhPishnehadi.thProject where thIsEstelamPaper=0 and prVahed in (@vahed) and prPeymankar in (@peymankar)";
            //cmd2.Parameters.AddWithValue("@vahed", str);
            //cmd2.Parameters.AddWithValue("@peymankar", str2);
            //}
            //else
            //{
            cmd2.CommandText = "SELECT count(*) as counts FROM  tbProjects INNER JOIN tbTarhPishnehadi ON tbProjects.prId = tbTarhPishnehadi.thProject where thIsEstelamPaper=0";
            //}
            openDb.Open();
            ASPxGaugeControl3.Value = cmd2.ExecuteScalar().ToString();
            openDb.Close();

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            loadInfo();
        }
    }
}
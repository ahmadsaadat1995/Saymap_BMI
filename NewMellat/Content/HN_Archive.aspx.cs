using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class HN_Archive : System.Web.UI.Page
    {
        DataAccessBase db = new DataAccessBase();
        protected void Page_Load(object sender, EventArgs e)
        {
            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "آرشیو فایل ها";

            //if (IsPostBack)
            //{
            //    ClientScript.RegisterHiddenField("isPostBack", "1");
            //}
            //else
            //{
                // کنترل امنیت
                if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
                {
                    // Response.Redirect(@"~\content\PageDenied.aspx");
                }
                string prCode = Page.User.Identity.Name;

                System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();

                DataTable dt = db.ReaderText("SELECT prInformation.infId, prInformation.infTitle, tbAdminProjects.prProject, tbAdminProjects.prCode, tbAdminProjects.prType, tbAdminProjects.prId, prInformation.infType FROM prInformation INNER JOIN tbAdminProjects ON prInformation.infId = tbAdminProjects.prProject WHERE (prInformation.infAct = 1) AND tbAdminProjects.prCode = '" + prCode + "' AND (prInformation.infType = 1) And (prType =2)");


                List<Dictionary<string, object>> vahed = new List<Dictionary<string, object>>();
                Dictionary<string, object> row;
                foreach (DataRow dr in dt.Rows)
                {
                    row = new Dictionary<string, object>();
                    foreach (DataColumn col in dt.Columns)
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }
                    vahed.Add(row);
                }

                dt = db.ReaderText("SELECT prInformation.infId, prInformation.infTitle, tbAdminProjects.prProject, tbAdminProjects.prCode, tbAdminProjects.prType, tbAdminProjects.prId, prInformation.infType FROM prInformation INNER JOIN tbAdminProjects ON prInformation.infId = tbAdminProjects.prProject WHERE (prInformation.infAct = 1) AND tbAdminProjects.prCode = '" + prCode + "' AND (prInformation.infType = 5) And (prType =1)");


                List<Dictionary<string, object>> peymankar = new List<Dictionary<string, object>>();
                // Dictionary<string, object> row;
                foreach (DataRow dr in dt.Rows)
                {
                    row = new Dictionary<string, object>();
                    foreach (DataColumn col in dt.Columns)
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }
                    peymankar.Add(row);
                }

                dt = db.ReaderText(@"SELECT prId,prTitle,prVahed,prPeymankar ,tbGharardad.ghCode
            FROM tbprojects left join tbGharardad on tbProjects.prId =tbGharardad.ghProject
            WHERE ((prVahed IN (SELECT prProject  FROM tbAdminProjects WHERE (prType = 3)  AND (prCode = '" + prCode + @"')  )) 
		    OR(TechnicalSuvisor IN (SELECT prProject  FROM tbAdminProjects  WHERE (prType = 3) AND (prCode = '" + prCode + @"') ))) 
            AND (prPeymankar IN (SELECT prProject FROM tbAdminProjects AS tbAdminProjects_1 WHERE (prType = 1)  AND (prCode = '" + prCode + @"')))");


                List<Dictionary<string, object>> projects = new List<Dictionary<string, object>>();
                // Dictionary<string, object> row;
                foreach (DataRow dr in dt.Rows)
                {
                    row = new Dictionary<string, object>();
                    foreach (DataColumn col in dt.Columns)
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }
                    projects.Add(row);
                }

                Lit1.Text = "<script>var server_projects=" + serializer.Serialize(projects) + ";var server_peymankar=" + serializer.Serialize(peymankar) + ";var server_vahed=" + serializer.Serialize(vahed) + ";</script>";
           // }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           // HiddenField hf = hf1.Value;
            DataTable dt = db.ReaderText(string.Format(@"SELECT *,case(fiType) when 1 then N'مستندات درخواست' 
					 when 6 then N'طرح پیشنهادی' 
					 when 8 then N'قرارداد'  
					 when 5 then N'سند نیازمندی/پورتوتایپ' end as type
        FROM [NewMellat].[dbo].[tbFiles] 
        where (fiParent = {0} and fiType=1) or
              (fiParent in (select reId from tbReval where reProject={0} )and fiType=5) or
              (fiParent in (select thId from tbTarhPishnehadi where thProject={0} )and fiType=6) or
              (fiParent in (select ghId from tbGharardad where ghProject={0} ) and fiType=8)
           order by fiType", hf1.Value));
            
            //System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            //List<Dictionary<string, object>> data = new List<Dictionary<string, object>>();
            //Dictionary<string, object> row;
           // string str = "";
            DataTable dt2 = new DataTable();
            dt2.Columns.Add("type");
            dt2.Columns.Add("date");
            dt2.Columns.Add("title");
            dt2.Columns.Add("url");
            foreach (DataRow dr in dt.Rows)
            {
                
              //  string typ=dr["type"].ToString();
               
              //  row = new Dictionary<string, object>();
              
              //  row.Add("fiDate",CommonClass.ShamsiDate(DateTime.Parse(dr["fiDate"].ToString()),"/"));
              //  row.Add("fiTitle", dr["fiTitle"]);
              //  row.Add("fiType", typ);
                string fileName = Path.GetFileNameWithoutExtension(Path.GetRandomFileName()) + Path.GetExtension(dr["fiExt"].ToString());
                FileStream file = new FileStream(Server.MapPath(@"~\content\images\documents\" + fileName), FileMode.CreateNew, FileAccess.ReadWrite, FileShare.ReadWrite);
                byte[] fff = (byte[])dr["fiData"];
                file.Write(fff, 0, fff.Length);
                file.Flush();
                file.Close();
              ////  str += string.Format("<tr><td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td></tr>", dr["fiTitle"].ToString(), CommonClass.ShamsiDate(DateTime.Parse(dr["fiDate"].ToString()), "/"), typ, @"~\content\images\documents\" + fileName);
              //   row.Add("fiUrl",  @"~\content\images\documents\" + fileName);
                
              //  data.Add(row);

                DataRow dr2 = dt2.NewRow();
                dr2["type"] = dr["type"].ToString();
                dr2["date"]= CommonClass.ShamsiDate(DateTime.Parse(dr["fiDate"].ToString()), "/");
                dr2["title"] = dr["fiTitle"].ToString();
                dr2["url"]= @"~\content\images\documents\" + fileName;
                dt2.Rows.Add(dr2);
            }

            //GridView1.DataSource = dt2;
            //GridView1.DataBind();
            ASPxGridView1.DataSource = dt2;
            ASPxGridView1.DataBind();
//            Lit2.Text = @"<script>var files=" + serializer.Serialize(data) + @";
//                    $('#tbl1 tbody').html('"+str+@"');
//            </script>";
            ClientScript.RegisterHiddenField("isPostBack", "1");
        }
        
      
    }
}
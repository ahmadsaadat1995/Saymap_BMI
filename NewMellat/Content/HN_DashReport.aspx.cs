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
    public partial class HN_DashReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "گزارش داشبورد";
            if (!IsPostBack)
            {
                  string userName = Page.User.Identity.Name;
                string query = "";
               
                string entityName = Request.QueryString["en"].ToString();
                string peymankar = Request.QueryString["f1"].ToString();
                string vahed = Request.QueryString["f2"].ToString();

                string from = string.Format(@" tbProjects as p on p.prId=t.prId join prInformation as inf1 on p.prVahed=inf1.infId join  prInformation as inf2 on p.prPeymankar=inf2.infId 
                       where ((p.prVahed IN (SELECT prProject  FROM tbAdminProjects WHERE (prType = 3)  AND (prCode = '{0}')  )) 
                         OR  (p.TechnicalSuvisor IN (SELECT prProject  FROM tbAdminProjects  WHERE (prType = 3) AND (prCode = '{0}') ))) 
                         AND (p.prPeymankar IN (SELECT prProject FROM tbAdminProjects AS tbAdminProjects WHERE (prType = 1)  AND (prCode = '{0}') ))", userName);

                if (peymankar != "" && peymankar != "-1" && peymankar != "null" && peymankar != null)
                    from += " and p.prPeymankar = " + peymankar;
                if (vahed != "" && vahed != "-1" && vahed != "null" && vahed != null)
                    from += " and p.prVahed = " + vahed;
                
                switch (entityName)
                {
                    case "HeyatNezarat":
                        query = @"select t.*,inf1.infTitle as vahed,inf2.infTitle as peymankar 
                         from DashboardHeyatNezarat as t join  "+from ;
                        break;
                    case "commission":
                        query = string.Format(@"select p.*,inf1.infTitle as vahed,inf2.infTitle as peymankar 
	,((SELECT TOP (1) paDate FROM tbProjectPaper WHERE (paType = 1) AND (paAct = 1) AND (paProject = p.prId))) AS paDate,
	 (SELECT TOP (1) paShenase FROM tbProjectPaper WHERE (paType = 1) AND (paAct = 1) AND (paProject = p.prId)) AS paShenase
from  tbProjects as p join prInformation as inf1 on p.prVahed=inf1.infId
		join  prInformation as inf2 on p.prPeymankar=inf2.infId    where ((p.prVahed IN (SELECT prProject  FROM tbAdminProjects WHERE (prType = 3)  AND (prCode = '{0}')  )) 
                         OR  (p.TechnicalSuvisor IN (SELECT prProject  FROM tbAdminProjects  WHERE (prType = 3) AND (prCode = '{0}') ))) 
                         AND (p.prPeymankar IN (SELECT prProject FROM tbAdminProjects AS tbAdminProjects WHERE (prType = 1)  AND (prCode = '{0}') ))  and prStatus = 0 and prAct = 1 and prProjectStatus = N'در حال اجرا'", userName);
                        break;
                    case "AnalyzeTadarokat":
                        query = @"select t.*,inf1.infTitle as vahed,inf2.infTitle as peymankar,
                            ((SELECT TOP (1) paDate FROM tbProjectPaper WHERE (paType = 9) AND (paAct = 1) AND (paProject =t.thId))) AS paDate,
	                        (SELECT TOP (1) paShenase FROM tbProjectPaper WHERE (paType = 9) AND (paAct = 1) AND (paProject = t.thId)) AS paShenase
                         from DashboardAnalyzeTadarokat as t join " + from;
                        break;
                    case "GharardadPishnevis":
                        query = @"select t.*,inf1.infTitle as vahed,inf2.infTitle as peymankar
                         from DashboardGharardadPishnevis as t join " + from;
                        break;
                    case "GharardadEblagh":
                        query = @"select t.*,inf1.infTitle as vahed,inf2.infTitle as peymankar,((SELECT TOP (1) paDate FROM tbProjectPaper WHERE (paType = 1) AND (paAct = 1) AND (paProject = p.prId))) AS paDate,(SELECT TOP (1) paShenase FROM tbProjectPaper WHERE (paType = 1) AND (paAct = 1) AND (paProject = p.prId)) AS paShenase
                         from DashboardGharardadEblagh as t join " + from;
                        break;
                    case "SoratTadarokat":
                        query =string.Format( @"select t.*,inf1.infTitle as vahed,inf2.infTitle as peymankar
                         from DashboardSoratTadarokat as t join  "+from);
                        break;
                    case "TahvilProje":
                        query = @"select t.*,inf1.infTitle as vahed,inf2.infTitle as peymankar
                         from DashboardTahvilProje as t join " + from;
                        break;
                    case "Proposal":
                        query = @"select t.*,inf1.infTitle as vahed,inf2.infTitle as peymankar
                         from DashboardProposal as t join " + from;
                        break;
                    case "ProposalEslahi":
                        query = @"select t.*,inf1.infTitle as vahed,inf2.infTitle as peymankar
                         from DashboardProposalEslahi as t join " + from;
                        break;
                    case "Portotype":
                        query = @"select t.*,inf1.infTitle as vahed,inf2.infTitle as peymankar,((SELECT TOP (1) paDate FROM tbProjectPaper WHERE (paType = 1) AND (paAct = 1) AND (paProject = p.prId))) AS paDate,(SELECT TOP (1) paShenase FROM tbProjectPaper WHERE (paType = 1) AND (paAct = 1) AND (paProject = p.prId)) AS paShenase
                         from DashboardSoratTadarokat as t join " + from;
                        break;
                    case "SherkatAnswer1":
                        query = @"select t.*,p.prTitle,inf1.infTitle as vahed,inf2.infTitle as peymankar
                         from DashboardSherkatAnswer as t join " + from + " and Gharardad not in (N'استرداد-تضامین',N'استرداد-حسن انجام کار',N'استرداد-مفصا حساب')";
                        break;
                    case "SherkatAnswer2":
                        query = @"select t.*,p.prTitle,inf1.infTitle as vahed,inf2.infTitle as peymankar
                         from DashboardSherkatAnswer as t join " + from + " and Gharardad in (N'استرداد-تضامین',N'استرداد-حسن انجام کار',N'استرداد-مفصا حساب')";
                        break;

                    case "NazerPorpozal":
                        query = @"select t.*,inf1.infTitle as vahed,inf2.infTitle as peymankar
                         from DashboardNazerPorpozal as t join " + from;
                        break;
                    case "NazerPishnevis":
                        query = @"select t.*,inf1.infTitle as vahed,inf2.infTitle as peymankar
                         from DashboardNazerPishnevis as t join " + from;
                        break;
                    case "NazerAnswer1":
                        query = @"select t.*,inf1.infTitle as vahed,inf2.infTitle as peymankar 
                         from DashboardNazerAnswer as t join " + from + " and Gharardad not in (N'استرداد-تضامین',N'استرداد-حسن انجام کار',N'استرداد-مفصا حساب')";
                        break;
                    case "NazerAnswer2":
                        query = @"select t.*,inf1.infTitle as vahed,inf2.infTitle as peymankar 
                         from DashboardNazerAnswer as t join " + from + " and Gharardad in (N'استرداد-تضامین',N'استرداد-حسن انجام کار',N'استرداد-مفصا حساب')";
                        break;

                    default:
                        break;
                }

                string connetionString = ConfigurationManager.ConnectionStrings["NewMellatConnectionString"].ConnectionString;
               
                DataTable dt = new DataTable();
                using (var conn = new SqlConnection(connetionString))
                using (var command = new SqlCommand(query, conn))
                {
                    command.CommandType = CommandType.Text;
                   
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
                    serializer.MaxJsonLength = int.MaxValue;
                    Lit1.Text = "<script>var myData=" + serializer.Serialize(rows) + "</script>";



                }
            }
        }
    }
}
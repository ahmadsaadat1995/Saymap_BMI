using DataAccessLayer;
using OfficeAutomationServiceTest;
using OfficeAutomationServiceClient.LetterServiceProxy;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;
using NewMellatWinService;

namespace serviceForGam
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            update();
            DirectoryInfo di = new DirectoryInfo("D:\\Projects\\NewMellat\\letterTemplate\\temp\\");

            foreach (FileInfo file in di.GetFiles())
            {
                file.Delete();
            }
            if (DateTime.Now.Hour == 4)
            {
                updateCapacity();


            }
        }

        private void updateCapacity()
        {
            label1.Text = "start Updating ... ";
            //   try
            {
                CalculateProjectMosavab();
                CalculateProjectSeason();
            }
            //  catch (Exception ex)
            //  {
            //      listBox1.Items.Add("CAP ERROR : " + ex.Message + "   " + DateTime.Now.ToString());
            //  }
            label1.Text = "update completed.  " + DateTime.Now.ToString();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

            //  update();
            timer1.Interval = 3600000;
            timer1.Start();
        }

        private void update()
        {
            System.Net.ServicePointManager.ServerCertificateValidationCallback += (se, cert, chain, sslerror) =>{return true; };
            label1.Text = "start Updating ... ";

            try
            {

                BaseClientSymap bs = new BaseClientSymap();
                com_gam_secretariat_webservice_complextypes_SecurityContextWTO SecurityContextWTOLetterService = new com_gam_secretariat_webservice_complextypes_SecurityContextWTO()
                {
                    systemName = "simapws",
                    systemPass = "simap@1398",
                    depId = 1814302,
                    perId = 16933
                };


                DataAccessBase db = new DataAccessBase();
                DataTable dt = db.ReaderText("select * from  tbGamLetterNumber");


                foreach (DataRow row in dt.Rows)
                {
                    com_gam_secretariat_webservice_complextypes_Item[] items = new com_gam_secretariat_webservice_complextypes_Item[1];
                    items[0] = new com_gam_secretariat_webservice_complextypes_Item();
                    items[0].key = "letterId";
                    items[0].value = row["letterNo"].ToString();

                    com_gam_secretariat_webservice_complextypes_FetchLetterParamWTO fetchLetter = new com_gam_secretariat_webservice_complextypes_FetchLetterParamWTO() { items = items };

                    var res = bs.LetterServiceClient.fetchLetter(SecurityContextWTOLetterService, fetchLetter);



                    if (res[0].letRegisterNumber != null && res[0].letFinalRegDate != null)
                    {
                        switch (row["entity"].ToString())
                        {
                            case "PageSooratEstelam":
                                string xx = "";
                                if (row["edare2"].ToString() != "-1")
                                {
                                    xx = string.Format(",('{0}', '{1}', '{2}', {3}, 1, 1002, '','{4}')", row["letterNo"].ToString(), res[0].letRegisterNumber, res[0].letFinalRegDate, row["pishId"].ToString(), row["edare2"].ToString());
                                }
                                int result = db.NonQueryTxt(string.Format("INSERT INTO tbProjectPaper(paShenase, paNumber, paDate, paProject, paAct, paType, paBody,paEdare) VALUES ('{0}', '{1}', '{2}', {3}, 1, 1002, '','{4}') {5}",
                              row["letterNo"].ToString(), res[0].letRegisterNumber, res[0].letFinalRegDate, row["paProject"].ToString(), row["edare"].ToString(), xx));//row["paProject"].ToString()


                                string intId = row["pishId"].ToString();
                                db.NonQueryTxt("update tbSooratPishNevis set pishIsNazer=1 where pishid=" + intId);
                                string intSoorat = db.ScalarTxt("select pishProject from tbSooratPishNevis where pishid=" + intId).ToString();

                                // به روز رسانی ثبت نامه
                                db.NonQueryTxt("update tbSooratHesab set step2=1 where id=" + intSoorat);

                                db.NonQueryTxt("DELETE FROM [dbo].[tbGamLetterNumber] where id=" + row["id"].ToString());

                                break;
                            //--------------------------------------------------------------------------------------
                            case "PageSooratErsalSHerkat":
                                db.NonQueryTxt(string.Format("INSERT INTO tbProjectPaper(paShenase, paNumber, paDate, paProject, paAct, paType, paStatus)       VALUES ('{0}', {1}, '{2}', {3},  1, 1005,1)", row["letterNo"].ToString(), res[0].letRegisterNumber, res[0].letFinalRegDate, row["pishId"].ToString()));
                                db.NonQueryTxt(@"update tbSooratHesab set step4=1 where id =(select pishProject from tbSooratPishNevis where pishid =" + row["pishId"].ToString() + ")");
                                db.NonQueryTxt("DELETE FROM [dbo].[tbGamLetterNumber] where id=" + row["id"].ToString());
                                break;
                            //--------------------------------------------------------------------------------------
                            case "PageSooratAnswers":
                                db.NonQueryTxt(string.Format("INSERT INTO tbProjectPaper(paShenase, paNumber, paDate, paProject, paAct, paType, paStatus)       VALUES ('{0}', {1}, '{2}', {3},  1, 1007,1)", row["letterNo"].ToString(), res[0].letRegisterNumber, res[0].letFinalRegDate, row["pishId"].ToString()));
                                db.NonQueryTxt(@"update tbSooratHesab set step6=1 where id =(select pishProject from tbSooratPishNevis where pishid =" + row["pishId"].ToString() + ")");
                                db.NonQueryTxt(@"update tbSooratPishNevis set pishIsNazer=0 where pishId =" + row["pishId"].ToString());
                                db.NonQueryTxt("DELETE FROM [dbo].[tbGamLetterNumber] where id=" + row["id"].ToString());
                                break;
                            //--------------------------------------------------------------------------------------
                            case "PageEstelamMohtavayi":
                                //--update previos paper data
                                db.NonQueryTxt(string.Format("update tbProjectPaper set paAct=0 where paProject={0} and paType=8", row["paProject"].ToString()));

                                //--add new paper data
                                var query = string.Format("INSERT INTO tbProjectPaper(paShenase, paNumber, paDate, paProject, paAct, paType, paEdare) VALUES ('{0}', '{1}', '{2}', {3}, 1, 8, {4})", row["letterNo"].ToString(), res[0].letRegisterNumber, res[0].letFinalRegDate, row["paProject"].ToString(), row["edare"].ToString());
                                var tmp = "";
                                if (row["edare2"].ToString() != "-1")
                                {
                                    query += string.Format(@" ,('{0}', '{1}', '{2}', {3}, 1, 8, {4})", row["letterNo"].ToString(), res[0].letRegisterNumber, res[0].letFinalRegDate, row["paProject"].ToString(), row["edare2"].ToString());
                                    tmp = " ,thIsEstelamRepeat = 1 ";
                                }
                                db.NonQueryTxt(query);
                                //--update tarh Pishnahadi 
                                string query2 = string.Format(@"update tbTarhPishnehadi set  thIsEstelamPaper = 1 {0} where thId={1}", tmp, row["paProject"].ToString());
                                db.NonQueryTxt(query2);
                                db.NonQueryTxt("DELETE FROM [dbo].[tbGamLetterNumber] where id=" + row["id"].ToString());
                                break;
                            //--------------------------------------------------------------------------------------
                            case "PageEstelamStep3":

                                //--add new paper data
                                var query1 = string.Format("INSERT INTO tbProjectPaper(paShenase, paNumber, paDate, paProject, paAct, paType, paEdare) VALUES ('{0}', '{1}', '{2}', {3}, 1, 50, {4})", row["letterNo"].ToString(), res[0].letRegisterNumber, res[0].letFinalRegDate, row["pishId"].ToString(), row["edare"].ToString());

                                db.NonQueryTxt(query1);

                                db.NonQueryTxt("DELETE FROM [dbo].[tbGamLetterNumber] where id=" + row["id"].ToString());
                                break;
                            //--------------------------------------------------------------------------------------
                            case "PageEstelamStep5":

                                //--add new paper data
                                var query3 = string.Format("INSERT INTO tbProjectPaper(paShenase, paNumber, paDate, paProject, paAct, paType) VALUES ('{0}', '{1}', '{2}', {3}, 1, 9)", row["letterNo"].ToString(), res[0].letRegisterNumber, res[0].letFinalRegDate, row["paProject"].ToString());

                                db.NonQueryTxt(query3);

                                db.NonQueryTxt("DELETE FROM [dbo].[tbGamLetterNumber] where id=" + row["id"].ToString());
                                break;
                            //--------------------------------------------------------------------------------------
                            case "PageGharardad":

                                //--add new paper data
                                var query4 = string.Format("INSERT INTO tbProjectPaper(paShenase, paNumber, paDate, paProject, paAct, paType) VALUES ('{0}', '{1}', '{2}', {3}, 1, 27)", row["letterNo"].ToString(), res[0].letRegisterNumber, res[0].letFinalRegDate, row["paProject"].ToString());

                                db.NonQueryTxt(query4);

                                db.NonQueryTxt("DELETE FROM [dbo].[tbGamLetterNumber] where id=" + row["id"].ToString());
                                break;
                        }
                    }


                }

            }
            catch (Exception ex)
            {

                listBox1.Items.Add(ex.Message + "   " + DateTime.Now.ToString());
            }
            label1.Text = "update completed.  " + DateTime.Now.ToString();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //label1.Text = "start Updating ... ";
            update();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            listBox1.Items.Clear();
        }



        public void CalculateProjectMosavab()
        {

            string cs = "Server=172.22.65.20;Database=NewMellat;User Idsa;Password=awer_1111;";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["NewMellat"].ConnectionString);
            // SqlConnection conn = new SqlConnection(cs);
            SqlCommand command = new SqlCommand("delete from CapacityProject where HasContract=0", conn);
            conn.Open();
            command.ExecuteNonQuery();
            command = new SqlCommand("delete from CapacityProjectDuration where HasContract=0", conn);
            command.ExecuteNonQuery();
            conn.Close();
            NewMellatWinService.ModelContainer m = new ModelContainer();
            var capView = (from a in m.CapacityView2 select a).ToList();
            foreach (var item in capView)
            {
                Date start = new Date((DateTime)item.mosDate);
                Date end = new Date((DateTime)item.mosAmaliatiDate);
                if (start.DateTime >= end.DateTime)
                    continue;
                int pType = GetCapacityType(item.prProjectType ?? 0);
                if (pType == 0)
                    continue;

                CapacityProjectDuration pd = new CapacityProjectDuration
                {
                    ProjectId = item.prId,
                    Duration = (int)end.DateTime.Subtract(start.DateTime).TotalDays,
                    HasContract = false,
                    CapacityTypeId = pType,
                    CompanyId = item.prPeymankar ?? 0
                };
                m.CapacityProjectDurations.Add(pd);

                bool finish = false;
                do
                {
                    Date nex = start.NextSession();

                    if (start.Session == end.Session && start.Year == end.Year)
                    {
                        nex = end;
                        finish = true;
                    }
                    CapacityProject cp = new CapacityProject();

                    cp.CompanyId = item.prPeymankar ?? 0;
                    cp.ProjectId = item.prId;

                    cp.Season = start.Session;
                    cp.Year = start.Year;
                    cp.Days = (int)nex.DateTime.Subtract(start.DateTime).TotalDays;
                    cp.HasContract = false;
                    cp.CapacityTypeId = pType;
                    m.CapacityProjects.Add(cp);
                    m.SaveChanges();

                    start = nex;
                } while (!finish);

            }
        }
        private int GetCapacityType(int prTypeId)
        {
            switch (prTypeId)
            {

                // return 2;
                case 88:
                case 291:
                    return 1;
                case 290:
                case 87:

                    return 2;
                case 204:
                    return 3;
                case 390:
                case 393:
                case 394:
                case 395:
                case 396:
                case 397:
                case 398:
                    return 4;
                default:
                    return 0;
            }
        }

        public void CalculateProjectSeason()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["NewMellat"].ConnectionString);
            SqlCommand command = new SqlCommand("delete from CapacityProject where HasContract=1", conn);
            conn.Open();
            command.ExecuteNonQuery();
            command = new SqlCommand("delete from CapacityProjectDuration where HasContract=1", conn);
            command.ExecuteNonQuery();
            conn.Close();
            NewMellatWinService.ModelContainer m = new ModelContainer();
            var capView = (from a in m.CapacityView1 select a).ToList();


            foreach (var item in capView)
            {
                Date start = new Date(item.GharardadStartTolid);
                Date end = new Date(item.GharardadEndTolid);

                if (start.DateTime >= end.DateTime)
                    continue;
                int pType = GetCapacityType(item.prProjectType ?? 0);
                if (pType == 0)
                    continue;
                Double jame;
                Double.TryParse((item.thHajmTolid ?? "0").ToString(), out jame);

                CapacityProjectDuration pd = new CapacityProjectDuration
                {
                    ProjectId = item.prId,
                    Duration = (int)end.DateTime.Subtract(start.DateTime).TotalDays,
                    HasContract = true,
                    CapacityTypeId = pType,
                    CompanyId = item.prPeymankar ?? 0,
                    TotalNafarSaat = (int)jame * 176

                };

                m.CapacityProjectDurations.Add(pd);



                bool finish = false;
                do
                {
                    Date nex = start.NextSession();

                    if (start.Session == end.Session && start.Year == end.Year)
                    {
                        nex = end;
                        finish = true;
                    }
                    CapacityProject cp = new CapacityProject();

                    cp.CompanyId = item.prPeymankar ?? 0;
                    cp.ProjectId = item.prId;

                    cp.Season = start.Session;
                    cp.Year = start.Year;
                    cp.Days = (int)nex.DateTime.Subtract(start.DateTime).TotalDays;
                    cp.HasContract = true;
                    cp.CapacityTypeId = pType;
                    m.CapacityProjects.Add(cp);
                    m.SaveChanges();

                    start = nex;
                } while (!finish);

            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            updateCapacity();
        }
    }
}

using NewMellatWinService;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApplicationTest
{
    public partial class testForCapacity : Form
    {
        public testForCapacity()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            CalculateProjectMosavab();
            CalculateProjectSeason();
        }


        public void CalculateProjectMosavab()
        {
            //SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["NewMellat"].ConnectionString);
            //SqlCommand command = new SqlCommand("delete from CapacityProject where HasContract=0", conn);
            //conn.Open();
            //command.ExecuteNonQuery();
            //command = new SqlCommand("delete from CapacityProjectDuration where HasContract=0", conn);
            //command.ExecuteNonQuery();
            //conn.Close();
            //NewMellatWinService.ModelContainer m = new ModelContainer();
            //var capView = (from a in m.CapacityView2 select a).ToList();
            //foreach (var item in capView)
            //{
            //    Date start = new Date((DateTime)item.mosDate);
            //    Date end = new Date((DateTime)item.mosAmaliatiDate);
            //    if (start.DateTime >= end.DateTime)
            //        continue;
            //    int pType = GetCapacityType(item.prProjectType ?? 0);
            //    if (pType == 0)
            //        continue;

            //    CapacityProjectDuration pd = new CapacityProjectDuration
            //    {
            //        ProjectId = item.prId,
            //        Duration = (int)end.DateTime.Subtract(start.DateTime).TotalDays,
            //        HasContract = false,
            //        CapacityTypeId = pType,
            //        CompanyId = item.prPeymankar ?? 0
            //    };
            //    m.CapacityProjectDurations.Add(pd);

            //    bool finish = false;
            //    do
            //    {
            //        Date nex = start.NextSession();

            //        if (start.Session == end.Session && start.Year == end.Year)
            //        {
            //            nex = end;
            //            finish = true;
            //        }
            //        CapacityProject cp = new CapacityProject();

            //        cp.CompanyId = item.prPeymankar ?? 0;
            //        cp.ProjectId = item.prId;

            //        cp.Season = start.Session;
            //        cp.Year = start.Year;
            //        cp.Days = (int)nex.DateTime.Subtract(start.DateTime).TotalDays;
            //        cp.HasContract = false;
            //        cp.CapacityTypeId = pType;
            //        m.CapacityProjects.Add(cp);
            //        m.SaveChanges();

            //        start = nex;
            //    } while (!finish);

            //}
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
            //SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["NewMellat"].ConnectionString);
            //SqlCommand command = new SqlCommand("delete from CapacityProject where HasContract=1", conn);
            //conn.Open();
            //command.ExecuteNonQuery();
            //command = new SqlCommand("delete from CapacityProjectDuration where HasContract=1", conn);
            //command.ExecuteNonQuery();
            //conn.Close();
            //NewMellatWinService.ModelContainer m = new ModelContainer();
            //var capView = (from a in m.CapacityView1 select a).ToList();


            //foreach (var item in capView)
            //{
            //    Date start = new Date(item.GharardadStartTolid);
            //    Date end = new Date(item.GharardadEndTolid);

            //    if (start.DateTime >= end.DateTime)
            //        continue;
            //    int pType = GetCapacityType(item.prProjectType ?? 0);
            //    if (pType == 0)
            //        continue;
            //    Double jame;
            //    Double.TryParse((item.thHajmTolid ?? "0").ToString(), out jame);

            //    CapacityProjectDuration pd = new CapacityProjectDuration
            //    {
            //        ProjectId = item.prId,
            //        Duration = (int)end.DateTime.Subtract(start.DateTime).TotalDays,
            //        HasContract = true,
            //        CapacityTypeId = pType,
            //        CompanyId = item.prPeymankar ?? 0,
            //        TotalNafarSaat = (int)jame * 176

            //    };

            //    m.CapacityProjectDurations.Add(pd);



            //    bool finish = false;
            //    do
            //    {
            //        Date nex = start.NextSession();

            //        if (start.Session == end.Session && start.Year == end.Year)
            //        {
            //            nex = end;
            //            finish = true;
            //        }
            //        CapacityProject cp = new CapacityProject();

            //        cp.CompanyId = item.prPeymankar ?? 0;
            //        cp.ProjectId = item.prId;

            //        cp.Season = start.Session;
            //        cp.Year = start.Year;
            //        cp.Days = (int)nex.DateTime.Subtract(start.DateTime).TotalDays;
            //        cp.HasContract = true;
            //        cp.CapacityTypeId = pType;
            //        m.CapacityProjects.Add(cp);
            //        m.SaveChanges();

            //        start = nex;
            //    } while (!finish);

            //}
        }
    }
}

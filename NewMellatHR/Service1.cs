using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;

namespace NewMellatHR
{
    public partial class Service1 : ServiceBase
    {
        public Service1()
        {
            InitializeComponent();
        }

        protected override void OnStart(string[] args)
        {
            try
            {
                Update();
                System.Timers.Timer t = new System.Timers.Timer();
                t.Interval = 3600000;
                t.Elapsed += t_Elapsed;
                t.Start();
            }
            catch (Exception)
            {

                
            }
        }

        void t_Elapsed(object sender, System.Timers.ElapsedEventArgs e)
        {
            try
            {
                if (DateTime.Now.Hour == 6)
                    Update();
            }
            catch (Exception)
            {

                
            }
        }

        public void Update()
        {
            HrService.PRSClient prsClient = new HrService.PRSClient();

            ProjectServer_Reporting_faEntities entities = new ProjectServer_Reporting_faEntities();
            var data = from emp in entities.MSP_EpmResource_UserView where emp.کد_پرسنلی != null select emp.کد_پرسنلی;
            foreach (var empCode in data)
            {
                int empId = 0;
                if (!int.TryParse(empCode, out empId))
                    continue;
                try
                {
                    var pm = prsClient.getEmployeeSpec(empId, "20", "Epm1", "*pm123");
                    if (pm.PersonCode == null)
                        continue;
                    var hrEmployee = (from hrEmp in entities.HrEmployeeDetails where hrEmp.EmployeeCode == empId select hrEmp).FirstOrDefault();
                    if (hrEmployee == null)
                    {
                        hrEmployee = new HrEmployeeDetail
                        {
                            EmployeeCode = empId,
                            FirstName = pm.FName,
                            LastName = pm.LName,
                            Status = pm.PrsVazKhedmatName,
                            StatusCode = pm.PrsVazKhedmaTCode,
                            Department = pm.DepTitle,
                            DepartmentCode = (int)(pm.DPCode ?? 0),
                            Unit = pm.UnitName,
                            UnitCode = (int)(pm.UnitCode ?? 0)



                        };
                        entities.HrEmployeeDetails.Add(hrEmployee);

                    }
                    else
                    {
                        hrEmployee.FirstName = pm.FName;
                        hrEmployee.LastName = pm.LName;
                        hrEmployee.Status = pm.PrsVazKhedmatName;
                        hrEmployee.StatusCode = pm.PrsVazKhedmaTCode;
                        hrEmployee.Department = pm.DepTitle;
                        hrEmployee.DepartmentCode = (int)(pm.DPCode ?? 0);
                        hrEmployee.Unit = pm.UnitName;
                        hrEmployee.UnitCode = (int)(pm.UnitCode ?? 0);
                    }
                    entities.SaveChanges();

                }
                catch (Exception)
                {

                }

            }


        }
        protected override void OnStop()
        {
        }
    }
}

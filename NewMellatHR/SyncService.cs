using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Timers;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace NewMellatHR
{
    partial class SyncService : ServiceBase
    {

        #region [Props]
        HttpClient client;
        string authToken = "";
        string ServiceName = "getEmployeeSpec";
        int ModeCode = 13;
        string baseUri = "http://172.26.5.46:7070/"; 
        #endregion
        public SyncService()
        {
            InitializeComponent();
        }
        protected override void OnStart(string[] args)
        {
            Task.Run(async () => await Update()).GetAwaiter().GetResult() ;
        }


        public async Task Update()
        {
            HrService.PRSClient prsClient = new HrService.PRSClient();

            ProjectServer_Reporting_faEntities entities = new ProjectServer_Reporting_faEntities();
            var data = from emp in entities.MSP_EpmResource_UserView where emp.کد_پرسنلی != null select emp.کد_پرسنلی;

            await HttpClientInit("epm2", "E123456");

            foreach (var empCode in data)
            {
                int empId = 0;
                if (!int.TryParse(empCode.Trim(), out empId))
                    continue;
                try
                {
                    //var pm = prsClient.getEmployeeSpec(empId, "13", "epm2", "E123456");
                    var pm = await GetPersonelInfo(empId);
                    
                    if (pm == null || pm.PersonCode == null)
                        continue;
                    var hrEmployee = (from hrEmp in entities.HrEmployeeDetails where hrEmp.EmployeeCode == empId select hrEmp).FirstOrDefault();
                    if (hrEmployee == null)
                    {
                        File.AppendAllText(@"D:\Projects\Log.txt", "hrEmployee : hasvalue "+ Environment.NewLine);
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
                        File.AppendAllText(@"D:\Projects\Log.txt", "hrEmployee : hasn't value " + Environment.NewLine);

                        File.AppendAllText(@"D:\Projects\Log.txt", hrEmployee.ToString() + Environment.NewLine);
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
                catch (Exception ex)
                {
                    LogExcepton(ex);
                    throw new Exception();
                }
                

            }


        }

        private async Task HttpClientInit(string userName, string passwd)
        {
           
            client = new HttpClient();
            client.BaseAddress = new Uri(baseUri);
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(
                new MediaTypeWithQualityHeaderValue("application/json"));
            client.Timeout = new TimeSpan(0, 10, 0);

            File.AppendAllText(@"D:\Projects\Log.txt", "Start Call HttpClient => Client BaseAddress :  " + client.BaseAddress  +Environment.NewLine);
            var response = await client.GetAsync(String.Format("api/User/Login?userName={0}&passwd={1}", userName, passwd));
            File.AppendAllText(@"D:\Projects\Log.txt", "response.Content  : " + response.Content + "," 
                + Environment.NewLine + "response.IsSuccessStatusCode : " + response.IsSuccessStatusCode + ","
                + Environment.NewLine + "response.RequestMessage : " + response.RequestMessage + ","
                + Environment.NewLine + "response.StatusCode  : " + response.StatusCode);
            if (response.IsSuccessStatusCode)
            {
                string resultJSON = await response.Content.ReadAsStringAsync();
                authToken = (string)JsonConvert.DeserializeObject(resultJSON, authToken.GetType());
            }
            else authToken = null;
        }

        private async Task<NewMellatHR.HrService.empSpecData> GetPersonelInfo(int employeecode)
        {
            if (!string.IsNullOrEmpty(authToken))
            {

                var paramsJSON = "{\"employeecode\":\"0\"}";
                paramsJSON = paramsJSON.Replace("0", employeecode.ToString());
                var requestUri = string.Format("api/RhbnDataPublish/Call?serviceName={0}&authToken={1}&paramsJSON={2}&modeCode={3}",
                                    "getEmployeeSpec", authToken, paramsJSON, ModeCode);                

                var response = await client.GetAsync(requestUri);

                if (response.IsSuccessStatusCode)
                {
                    string resultJSON = await response.Content.ReadAsStringAsync();                    
                    if (!string.IsNullOrEmpty(resultJSON))
                    {
                        return (JsonConvert.DeserializeObject<List<NewMellatHR.HrService.empSpecData>>(resultJSON)).FirstOrDefault();                        
                    }
                    else
                    {
                        File.AppendAllText(@"D:\Projects\Log.txt", string.Format("response=>resultJSON : Empty") + Environment.NewLine);
                        throw new Exception();
                    }
                }
                else
                {                    
                    File.AppendAllText(@"D:\Projects\Log.txt", "RequestUri :" + requestUri + " , " + Environment.NewLine);
                    File.AppendAllText(@"D:\Projects\Log.txt", string.Format("response=>IsSuccessStatusCode : {0}", response.IsSuccessStatusCode)  + Environment.NewLine);
                    throw new Exception();
                }
            }
            else
            {
                File.AppendAllText(@"D:\Projects\Log.txt", string.Format("Token=>Empty")  + Environment.NewLine);
                throw new Exception();
            }
            return null;
        }


        private void LogExcepton(Exception ex)
        {
            if (ex.InnerException != null)
                LogExcepton(ex.InnerException);
            File.AppendAllText(@"D:\Projects\Log.txt" , "-----------------------"+Environment.NewLine);
            File.AppendAllText(@"D:\Projects\Log.txt", ex.Message + Environment.NewLine);
            File.AppendAllText(@"D:\Projects\Log.txt", ex.StackTrace + Environment.NewLine);
        }


        protected override void OnStop()
        {
            // TODO: Add code here to perform any tear-down necessary to stop your service.
        }
    }
}

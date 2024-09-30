
//using OfficeAutomationServiceClient.LetterServiceProxy;
//using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using NewMellatHR;
using System.Threading.Tasks;
using System.IO;
using System.Net.Http;
using System.Net.Http.Headers;
using Newtonsoft.Json;
using System.Data.SqlClient;

namespace ConsoleApplicationTest
{
    class Program
    {


        static void Main(string[] args)
        {
            //HrService.PRSClient prsClient = new HrService.PRSClient();
            //var pm = prsClient.getEmployeeSpec(417386, "13", "epm2", "E123456");

            var x = new test();
            Task.Run(async () => await x.Update()).GetAwaiter().GetResult();

        }

        //  test t =new test();


        //com_gam_secretariat_webservice_complextypes_SecurityContextWTO SecurityContextWTOPerson = new com_gam_secretariat_webservice_complextypes_SecurityContextWTO();

        //SecurityContextWTOPerson.systemName = "Simapws";
        //SecurityContextWTOPerson.systemPass = "Simap@1398";

        //com_gam_secretariat_webservice_complextypes_LetterWTO LetterWTO = new com_gam_secretariat_webservice_complextypes_LetterWTO();
        //LetterWTO.letAccessType = "1";
        //LetterWTO.letComment = "test letComment";
        ////LetterWTO.letDocTypeId = 5;
        //ListProviderServicePortTypeClient ListProviderClient=new ListProviderServicePortTypeClient();
        //OfficeAutomationServiceClient.ListProviderServiceProxy.com_gam_secretariat_webservice_complextypes_ListProviderWTO param1 = new OfficeAutomationServiceClient.ListProviderServiceProxy.com_gam_secretariat_webservice_complextypes_ListProviderWTO();
        //  OfficeAutomationServiceClient.ListProviderServiceProxy.com_gam_secretariat_webservice_complextypes_ListResultWTO[] actual = ListProviderClient.getDocumentTypes(SecurityContextWTOListProvider, param1);
        //LetterWTO.letDocTypeId = SecurityContextWTOPerson.depId
        //LetterWTO.letPriorityId = this.GetPriorityId();
        //LetterWTO.letTransfer = TransferType;
        //LetterWTO.letRegistrarDepId = this.GetPersonDepartmentsID();
        //LetterWTO.receivers = this.GetLetterReceivers();
        //var letterID = LetterServiceClient.insertLetter(SecurityContextWTOLetterService, param1);

        //WebClient client = new WebClient();
        //client.Encoding = Encoding.UTF8;
        //client.Credentials = new NetworkCredential("symap", "Test@1234");
        //string str = client.UploadString("http://172.26.97.102/api/getservices", "");

        //JObject j = JObject.Parse(str);
        //js.Deserialize()
        //ServiceReference1.ServiceClient srv = new ServiceReference1.ServiceClient();
        //srv.ClientCredentials.UserName.UserName = "hq\\epm";
        //srv.ClientCredentials.UserName.Password = "Pass!@#qwerty";
        //ServiceReference1.CallbackMessage m = srv.SetStatus(new ServiceReference1.ProposalStatus());
    }

    public class test
    {
        static HttpClient client;
        static string authToken = "";
        static string ServiceName = "getEmployeeSpecGroup";//"getEmployeeSpec";
        static int ModeCode = 13;
        static string baseUri = "http://172.26.5.46:7070/";

        public test()
        {

        }
        public async Task Update()
        {
            HrService.PRSClient prsClient = new HrService.PRSClient();

            await HttpClientInit("epm2", "E123456");
            string connectionString = "data source=172.22.65.20;initial catalog=NewMellat;user id=sa;password=awer_1111;multipleactiveresultsets=True";
            string q = "INSERT INTO [dbo].[HrEmployeeDetailNew]([EmployeeCode],[FirstName],[LastName],[Department],[DepartmentCode],[Unit],[UnitCode],[Status],[StatusCode]) VALUES ";
            List<string> queries = new List<string>();

            var requestUri = string.Format("api/RhbnDataPublish/Call?serviceName={0}&authToken={1}&paramsJSON={2}",
                                     "getVazkhedmatKind", authToken, "{}");//&modeCode={3}

                 var response = await client.GetAsync(requestUri);

                if (response.IsSuccessStatusCode)
               {
                   string resultJSON = await response.Content.ReadAsStringAsync();
                   if (!string.IsNullOrEmpty(resultJSON))
                   {
                     var result = JsonConvert.DeserializeObject<List<NewMellatHR.HrService.VazKhedmat>>(resultJSON);
                     foreach (NewMellatHR.HrService.VazKhedmat vzKhedmat in result)
             {
            int i = 0;
            string query = q;
            try
            {


                var pm = await GetPersonelInfo2("vazKhedmatIdStr", vzKhedmat.Vazkhedmatcode.ToString(), 25, "getEmployeeSpecGroup");
                foreach (var item in pm)
                {
                    if (i != 0 && i % 999 == 0)
                    {
                        query = query.Remove(query.Length - 1, 1);
                        query = query.Replace(",,", ",null,");
                        queries.Add(query);
                        query = q;
                    }
                    query += string.Format("({0},N'{1}',N'{2}',N'{3}',{4},N'{5}',{6},N'{7}',{8}),",
                        item.PersonCode, item.FName, item.LName, item.DepTitle, item.DPCode, item.UnitName, item.UnitCode, item.PrsVazKhedmatName, item.NezamVaz_Code);
                    i++;
                }
                query = query.Remove(query.Length - 1, 1);
                query = query.Replace(",,", ",null,");
                queries.Add(query);
                query = q;
            }
            catch (Exception ex)
            {
            }
                }
             }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                foreach (string qq in queries)
                {
                    using (SqlCommand command = new SqlCommand(qq, connection))
                    {
                        connection.Open();
                        command.CommandTimeout = 0;
                        int res = command.ExecuteNonQuery();
                        connection.Close();
                    }
                }
            }
            Console.WriteLine("end");
            Console.Read();
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

            File.AppendAllText(@"D:\Projects\Log.txt", "Start Call HttpClient => Client BaseAddress :  " + client.BaseAddress + Environment.NewLine);
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
                    File.AppendAllText(@"D:\Projects\Log.txt", string.Format("response=>IsSuccessStatusCode : {0}", response.IsSuccessStatusCode) + Environment.NewLine);
                    throw new Exception();
                }
            }
            else
            {
                File.AppendAllText(@"D:\Projects\Log.txt", string.Format("Token=>Empty") + Environment.NewLine);
                throw new Exception();
            }
            return null;
        }
        private async Task<List<NewMellatHR.HrService.empSpecData>> GetPersonelInfo2(string paramName, string paramValue, int code, string methodName)
        {
            if (!string.IsNullOrEmpty(authToken))
            {

                var paramsJSON = "{\"1\":\"0\"}";

                paramsJSON = paramsJSON.Replace("0", paramValue);
                paramsJSON = paramsJSON.Replace("1", paramName);
                if (paramName == null) paramsJSON = "{}";
                var requestUri = string.Format("api/RhbnDataPublish/Call?serviceName={0}&authToken={1}&paramsJSON={2}&modeCode={3}",
                                    methodName, authToken, paramsJSON, code);

                var response = await client.GetAsync(requestUri);

                if (response.IsSuccessStatusCode)
                {
                    string resultJSON = await response.Content.ReadAsStringAsync();
                    if (!string.IsNullOrEmpty(resultJSON))
                    {
                        return (JsonConvert.DeserializeObject<List<NewMellatHR.HrService.empSpecData>>(resultJSON));
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
                    File.AppendAllText(@"D:\Projects\Log.txt", string.Format("response=>IsSuccessStatusCode : {0}", response.IsSuccessStatusCode) + Environment.NewLine);
                    throw new Exception();
                }
            }
            else
            {
                File.AppendAllText(@"D:\Projects\Log.txt", string.Format("Token=>Empty") + Environment.NewLine);
                throw new Exception();
            }
            return null;
        }

        private void LogExcepton(Exception ex)
        {
            if (ex.InnerException != null)
                LogExcepton(ex.InnerException);
            File.AppendAllText(@"D:\Projects\Log.txt", "-----------------------" + Environment.NewLine);
            File.AppendAllText(@"D:\Projects\Log.txt", ex.Message + Environment.NewLine);
            File.AppendAllText(@"D:\Projects\Log.txt", ex.StackTrace + Environment.NewLine);
        }
    }

    public class test2
    {
        static HttpClient client;
        static string authToken = "";
        static string ServiceName = "getEmployeeSalaryGroup";
        static int ModeCode = 4;
        static string baseUri = "http://172.26.5.46:7070/";

        public test2()
        {

        }
        public async Task Update()
        {
            HrService.PRSClient prsClient = new HrService.PRSClient();
            //prsClient.getEmployeeSalaryGroup()
            //  ProjectServer_Reporting_faEntities entities = new ProjectServer_Reporting_faEntities();
            //  var data = from emp in entities.MSP_EpmResource_UserView where emp.کد_پرسنلی != null select emp.کد_پرسنلی;

            // var x = data.ToList<string>();

            await HttpClientInit("epm2", "E123456");

            //foreach (var empCode in data)
            //{
            //int empId = 0;
            // if (!int.TryParse(empCode.Trim(), out empId))
            //     continue;
            //  try
            // {
            // var pm = prsClient.getEmployeeSpec(434118, "13", "epm2", "E123456");
            var pm = await GetPersonelInfo(434118);

            if (pm != null)
            {
                string s = "";
            }

            //    return;// continue;
            //var hrEmployee = (from hrEmp in entities.HrEmployeeDetails where hrEmp.EmployeeCode == empId select hrEmp).FirstOrDefault();
            //if (hrEmployee == null)
            //{

            //    File.AppendAllText(@"D:\Projects\Log.txt", "Start Call HttpClient => Client BaseAddress :  " + client.BaseAddress + Environment.NewLine);
            //    hrEmployee = new HrEmployeeDetail
            //    {
            //        EmployeeCode = empId,
            //        FirstName = pm.FName,
            //        LastName = pm.LName,
            //        Status = pm.PrsVazKhedmatName,
            //        StatusCode = pm.PrsVazKhedmaTCode,
            //        Department = pm.DepTitle,
            //        DepartmentCode = (int)(pm.DPCode ?? 0),
            //        Unit = pm.UnitName,
            //        UnitCode = (int)(pm.UnitCode ?? 0)


            //    };
            //    entities.HrEmployeeDetails.Add(hrEmployee);

            //}
            //else
            //{
            //    hrEmployee.FirstName = pm.FName;
            //    hrEmployee.LastName = pm.LName;
            //    hrEmployee.Status = pm.PrsVazKhedmatName;
            //    hrEmployee.StatusCode = pm.PrsVazKhedmaTCode;
            //    hrEmployee.Department = pm.DepTitle;
            //    hrEmployee.DepartmentCode = (int)(pm.DPCode ?? 0);
            //    hrEmployee.Unit = pm.UnitName;
            //    hrEmployee.UnitCode = (int)(pm.UnitCode ?? 0);
            //}
            //entities.SaveChanges();

            //}
            //catch (Exception ex)
            //{
            //    throw new Exception();
            //}


            //}


        }

        private async Task HttpClientInit(string userName, string passwd)
        {

            client = new HttpClient();
            client.BaseAddress = new Uri(baseUri);
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(
                new MediaTypeWithQualityHeaderValue("application/json"));
            client.Timeout = new TimeSpan(0, 10, 0);

            File.AppendAllText(@"D:\Projects\Log.txt", "Start Call HttpClient => Client BaseAddress :  " + client.BaseAddress + Environment.NewLine);
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
                                    "getEmployeeSalaryGroup", authToken, paramsJSON, ModeCode);

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
                    File.AppendAllText(@"D:\Projects\Log.txt", string.Format("response=>IsSuccessStatusCode : {0}", response.IsSuccessStatusCode) + Environment.NewLine);
                    throw new Exception();
                }
            }
            else
            {
                File.AppendAllText(@"D:\Projects\Log.txt", string.Format("Token=>Empty") + Environment.NewLine);
                throw new Exception();
            }
            return null;
        }


        private void LogExcepton(Exception ex)
        {
            if (ex.InnerException != null)
                LogExcepton(ex.InnerException);
            File.AppendAllText(@"D:\Projects\Log.txt", "-----------------------" + Environment.NewLine);
            File.AppendAllText(@"D:\Projects\Log.txt", ex.Message + Environment.NewLine);
            File.AppendAllText(@"D:\Projects\Log.txt", ex.StackTrace + Environment.NewLine);
        }
    }


}

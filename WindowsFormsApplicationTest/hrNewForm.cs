using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Windows.Forms;
using System.Threading.Tasks;
using System.Net.Http.Headers;
using System.IO;

namespace WindowsFormsApplicationTest
{
    public partial class hrNewForm : Form
    {

        HttpClient client;
        string authToken = "";
        string ServiceName = "getEmployeeSalaryGroup";
        int ModeCode = 4;
        string baseUri = "http://172.26.5.46:7070/";

        public hrNewForm()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
           
        }

        //private  Task getDate() {
           
        //    HRServiceReference.PRSClient prsClient = new HRServiceReference.PRSClient();
        //     HttpClientInit("epm2", "E123456");
        //}
        //private  Task HttpClientInit(string userName, string passwd)
        //{

        //    client = new HttpClient();
        //    client.BaseAddress = new Uri(baseUri);
        //    client.DefaultRequestHeaders.Accept.Clear();
        //    client.DefaultRequestHeaders.Accept.Add(
        //        new MediaTypeWithQualityHeaderValue("application/json"));
        //    client.Timeout = new TimeSpan(0, 10, 0);

        //    File.AppendAllText(@"D:\Projects\Log.txt", "Start Call HttpClient => Client BaseAddress :  " + client.BaseAddress + Environment.NewLine);
        //    var response =  client.GetAsync(String.Format("api/User/Login?userName={0}&passwd={1}", userName, passwd));
        //    File.AppendAllText(@"D:\Projects\Log.txt", "response.Content  : " + response.Content + ","
        //        + Environment.NewLine + "response.IsSuccessStatusCode : " + response.IsSuccessStatusCode + ","
        //        + Environment.NewLine + "response.RequestMessage : " + response.RequestMessage + ","
        //        + Environment.NewLine + "response.StatusCode  : " + response.StatusCode);
        //    if (response.IsSuccessStatusCode)
        //    {
        //        string resultJSON = await response.Content.ReadAsStringAsync();
        //        authToken = (string)JsonConvert.DeserializeObject(resultJSON, authToken.GetType());
        //    }
        //    else authToken = null;
        //}
    }
}

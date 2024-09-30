using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;

namespace NewMellat.Code
{
    public class VendiaServiceManager
    {
        public void Send(VendiaObject vo)
        {
            WebClient client = new WebClient();
            client.Encoding = Encoding.UTF8;
            client.Credentials = new NetworkCredential("symap", "Test@1234");

            string str = client.UploadString("http://172.26.97.102/api/CreateChangeOrder", JsonConvert.SerializeObject(vo));

        }
    }
}
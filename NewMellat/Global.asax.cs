using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Threading;
using GSD.Globalization;
using System.IO;

namespace NewMellat
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {


        }

        protected void Session_Start(object sender, EventArgs e)
        {
            // سال 93
            Session.Add("sum1-93", 0);
            Session.Add("sum2-93", 0);
            Session.Add("sum3-93", 0);
            Session.Add("sum4-93", 0);


            // سال 94
            Session.Add("sum1-94", 0);
            Session.Add("sum2-94", 0);
            Session.Add("sum3-94", 0);
            Session.Add("sum4-94", 0);


            // سال 95
            Session.Add("sum1-95", 0);
            Session.Add("sum2-95", 0);
            Session.Add("sum3-95", 0);
            Session.Add("sum4-95", 0);


            // سال 96
            Session.Add("sum1-96", 0);
            Session.Add("sum2-96", 0);
            Session.Add("sum3-96", 0);
            Session.Add("sum4-96", 0);




        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            HttpContext.Current.Response.AddHeader("Access-Control-Allow-Origin", "*");
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            Exception ex = Server.GetLastError();
            File.AppendAllText(String.Format("D:\\Log\\error_{0}.log",DateTime.Now.ToString("yyyyMMdd")),""+DateTime.Now.ToString("yyyy-MM-dd:hh:mm:ss")+"->"+ex.ToString()+"\n\r");
            if(Context.IsCustomErrorEnabled)

                this.Response.Redirect("http://172.22.65.16:1983/Error.aspx");
          
        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}
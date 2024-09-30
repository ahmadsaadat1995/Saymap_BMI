using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Routing;

namespace MellatApi
{
    public class WebApiApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            GlobalConfiguration.Configure(WebApiConfig.Register);
        }
        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            HttpContext.Current.Response.AddHeader("Access-Control-Allow-Headers", "Accept,Content-Type,Authorization");
            HttpContext.Current.Response.AddHeader("Access-Control-Allow-Methods", "POST,GET,OPTIONS");
            HttpContext.Current.Response.AddHeader("Access-Control-Allow-Origin", "*");

        }
    }
}

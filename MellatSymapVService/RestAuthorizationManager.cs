using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Web;

namespace MellatSymapVService
{
    public class RestAuthorizationManager :ServiceAuthorizationManager
    {
        public override bool CheckAccess(OperationContext operationContext)
        {
            var authHeader = WebOperationContext.Current.IncomingRequest.Headers["Authorization"];
            if (!string.IsNullOrEmpty(authHeader))
            {
                var svcCredentials = System.Text.ASCIIEncoding.ASCII.GetString(Convert.FromBase64String(authHeader.Substring(6))).Split(':');
                if (svcCredentials[0].ToLower() == "popuser" && svcCredentials[1] == "U$3r@4581")
                {
                    return true;
                }
                return false;
            }
            WebOperationContext.Current.OutgoingResponse.Headers.Add("WWW-Authenticate: Basic realm=\"MellatSymapVService\"");
            throw new WebFaultException(System.Net.HttpStatusCode.Unauthorized);
            
            //return base.CheckAccess(operationContext);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace MellatApi
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "ISqlOData" in both code and config file together.
    [ServiceContract]
    public interface ISqlOData
    {

        [OperationContract(Name = "GetData")]
        [WebInvoke(UriTemplate = "GetData/{tableName}?$select={selectExp}&$filter={filterExp}&$sort={sortExp}&$group={groupExp}",
            ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, Method = "GET")]
        string GetData(string tableName, string selectExp = "", string filterExp = "", string sortExp = "", string groupExp = "");

        [OperationContract(Name = "GetData2")]
        [WebInvoke(UriTemplate = "GetData2/{userName}/{tableName}?$select={selectExp}&$filter={filterExp}&$sort={sortExp}&$group={groupExp}",
            ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, Method = "GET")]
        string GetData2(string userName,string tableName, string selectExp = "", string filterExp = "", string sortExp = "", string groupExp = "");

        [OperationContract(Name = "GetDataFromSP")]
        [WebInvoke(UriTemplate = "GetDataFromSP/{userName}/{spName}",
            ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, Method = "GET")]
        string GetDataFromSP(string userName, string spName);
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace MellatSymapVService
{
    [DataContract]
    public class Change
    {
        [DataMember]
        public string SymapId { get; set; }
        [DataMember]
        public string PobId { get; set; }

        [DataMember]
        public string ChangeStatus { get; set; }
        [DataMember]
        public string ChangeDescription { get; set; }
    }
}
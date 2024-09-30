using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace MellatSymapVService
{
    [DataContract]
    public class ProposalStatus
    {
        [DataMember]
        public string SymapId { get; set; }
        [DataMember]
        public DateTime ChangeDateTime { get; set; }
        [DataMember]
        public string ChangeFieldName { get; set; }
        [DataMember]
        public string ChangeFieldValue { get; set; }
        [DataMember]
        public string ChangeDescription { get; set; }
    }
}
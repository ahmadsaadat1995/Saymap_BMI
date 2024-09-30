using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NewMellat.Code
{
    [Serializable]
    public class VendiaObject
    {
        public string Callback { get; set; }
        public string CreateDateTime { get; set; }
        public string Description { get; set; }
        public int PlanningType { get; set; }
        public string PlanningDateTime { get; set; }
        public int ImplementationDuration { get; set; }
        public string OrganizationId { get; set; }
        public string CustomerId { get; set; }
        public string ServiceId { get; set; }
        public string PriorityId { get; set; }
        public string ChangeOrderTypeId { get; set; }
        public int ChangeEstimatedCost { get; set; }
        public string ChangeMemo { get; set; }
    }
}
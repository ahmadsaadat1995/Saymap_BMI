using MellatApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http.OData;

namespace MellatApi.Controllers
{
    public class ViewProjectSearchController: ODataController
    {
        [EnableQuery]
        public IQueryable<ViewProjectSearch> Get()
        {
            return new NewMellatEntities().ViewProjectSearches;
        
        }
    }
}
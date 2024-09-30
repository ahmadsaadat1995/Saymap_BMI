using MellatApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http.OData;

namespace MellatApi.Controllers
{
    public class ViewGharardadController : ODataController
    {
        [EnableQuery]
        public IQueryable<ViewGharardad> Get()
        {
            return new NewMellatEntities().ViewGharardads;
        
        }
    }
}
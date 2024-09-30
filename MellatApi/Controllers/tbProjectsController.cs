using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.ModelBinding;
using System.Web.Http.OData;
using System.Web.Http.OData.Routing;
using MellatApi.Models;

namespace MellatApi.Controllers
{
    /*
    The WebApiConfig class may require additional changes to add a route for this controller. Merge these statements into the Register method of the WebApiConfig class as applicable. Note that OData URLs are case sensitive.

    using System.Web.Http.OData.Builder;
    using System.Web.Http.OData.Extensions;
    using MellatApi.Models;
    ODataConventionModelBuilder builder = new ODataConventionModelBuilder();
    builder.EntitySet<tbProject>("tbProjects");
    config.Routes.MapODataServiceRoute("odata", "odata", builder.GetEdmModel());
    */
    public class tbProjectsController : ODataController
    {
        private NewMellatEntities db = new NewMellatEntities();

        // GET: odata/tbProjects
        [EnableQuery]
        public IQueryable<tbProject> GettbProjects()
        {
            return db.tbProjects;
        }

        // GET: odata/tbProjects(5)
        [EnableQuery]
        public SingleResult<tbProject> GettbProject([FromODataUri] int key)
        {
            return SingleResult.Create(db.tbProjects.Where(tbProject => tbProject.prId == key));
        }

        // PUT: odata/tbProjects(5)
        public IHttpActionResult Put([FromODataUri] int key, Delta<tbProject> patch)
        {
            Validate(patch.GetEntity());

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            tbProject tbProject = db.tbProjects.Find(key);
            if (tbProject == null)
            {
                return NotFound();
            }

            patch.Put(tbProject);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!tbProjectExists(key))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return Updated(tbProject);
        }

        // POST: odata/tbProjects
        public IHttpActionResult Post(tbProject tbProject)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.tbProjects.Add(tbProject);
            db.SaveChanges();

            return Created(tbProject);
        }

        // PATCH: odata/tbProjects(5)
        [AcceptVerbs("PATCH", "MERGE")]
        public IHttpActionResult Patch([FromODataUri] int key, Delta<tbProject> patch)
        {
            Validate(patch.GetEntity());

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            tbProject tbProject = db.tbProjects.Find(key);
            if (tbProject == null)
            {
                return NotFound();
            }

            patch.Patch(tbProject);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!tbProjectExists(key))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return Updated(tbProject);
        }

        // DELETE: odata/tbProjects(5)
        public IHttpActionResult Delete([FromODataUri] int key)
        {
            tbProject tbProject = db.tbProjects.Find(key);
            if (tbProject == null)
            {
                return NotFound();
            }

            db.tbProjects.Remove(tbProject);
            db.SaveChanges();

            return StatusCode(HttpStatusCode.NoContent);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool tbProjectExists(int key)
        {
            return db.tbProjects.Count(e => e.prId == key) > 0;
        }
    }
}

using System;
using Negocio;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using CapaDatos.Models;





namespace EVR_GlobalHitss.Controllers
{
    public class CLIENTESController : Controller
    {
        private TEST_GLOBALHITSSEntities1 db = new TEST_GLOBALHITSSEntities1();

        // GET: CLIENTES
        public ActionResult Index()
        {
            //var cLIENTES = db.CLIENTES.Include(c => c.TIPO_IDENTIFICACION);

            var objNegocio = new Negocio.Clientes();

            
            return View(objNegocio.numero());
        }

        // GET: CLIENTES/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CLIENTES cLIENTES = db.CLIENTES.Find(id);
            if (cLIENTES == null)
            {
                return HttpNotFound();
            }
            return View(cLIENTES);
        }

        // GET: CLIENTES/Create
        public ActionResult Create()
        {
            ViewBag.dbidTipoIdentificacion = new SelectList(db.TIPO_IDENTIFICACION, "dbid", "Descripcion");
            return View();
        }

        // POST: CLIENTES/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "dbid,dbidTipoIdentificacion,Nombre,Numero_identificacion,email,Movil,Direccion,Direccion_Instalacion,Fechacreacion,FechaModificacion,Estado")] CLIENTES cLIENTES)
        {
            if (ModelState.IsValid)
            {
                db.CLIENTES.Add(cLIENTES);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.dbidTipoIdentificacion = new SelectList(db.TIPO_IDENTIFICACION, "dbid", "Descripcion", cLIENTES.dbidTipoIdentificacion);
            return View(cLIENTES);
        }

        // GET: CLIENTES/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CLIENTES cLIENTES = db.CLIENTES.Find(id);
            if (cLIENTES == null)
            {
                return HttpNotFound();
            }
            ViewBag.dbidTipoIdentificacion = new SelectList(db.TIPO_IDENTIFICACION, "dbid", "Descripcion", cLIENTES.dbidTipoIdentificacion);
            return View(cLIENTES);
        }

        // POST: CLIENTES/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "dbid,dbidTipoIdentificacion,Nombre,Numero_identificacion,email,Movil,Direccion,Direccion_Instalacion,Fechacreacion,FechaModificacion,Estado")] CLIENTES cLIENTES)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cLIENTES).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.dbidTipoIdentificacion = new SelectList(db.TIPO_IDENTIFICACION, "dbid", "Descripcion", cLIENTES.dbidTipoIdentificacion);
            return View(cLIENTES);
        }

        // GET: CLIENTES/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CLIENTES cLIENTES = db.CLIENTES.Find(id);
            if (cLIENTES == null)
            {
                return HttpNotFound();
            }
            return View(cLIENTES);
        }

        // POST: CLIENTES/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            CLIENTES cLIENTES = db.CLIENTES.Find(id);
            db.CLIENTES.Remove(cLIENTES);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}

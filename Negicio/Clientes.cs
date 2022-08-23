using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.Entity;
using System.Net;
using System.Web;
using CapaDatos.Models;

namespace Negocio
{

    public class Clientes
    {
        private TEST_GLOBALHITSSEntities1 db = new TEST_GLOBALHITSSEntities1();

        public Object numero()
        {
            var cLIENTES = db.CLIENTES.Include(c => c.TIPO_IDENTIFICACION);
            return (cLIENTES.ToList());
        }
        public void prueba()
        {

        }
    }
}


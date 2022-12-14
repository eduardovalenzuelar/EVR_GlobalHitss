using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.Entity;
using System.Net;
using System.Web;
using System.Data.Entity.Infrastructure;
using CapaDatos.Models;


namespace Negocio
{

    public class Clientes
    {
        private TEST_GLOBALHITSSEntities1 db = new TEST_GLOBALHITSSEntities1();

        public Object ListarClientes()
        {
            var cLIENTES = db.CLIENTES.Include(c => c.TIPO_IDENTIFICACION);
            return (cLIENTES.ToList());
        }


        public object VerDetalle(long? IdCliente)
        {

            if (IdCliente == null)
            {
                return null;
            }
            CLIENTES cLIENTES = db.CLIENTES.Find(IdCliente);
            if (cLIENTES == null)
            {
                return null;
            }

            return (cLIENTES);

        }
        public object CambioEstado(long? IdCliente)
        {
            CLIENTES cLIENTES = db.CLIENTES.Find(IdCliente);
            db.SP_CLIENTE_CAMBIO_ESTADO(IdCliente);
            return null;
        }

     }
}


using DATOS;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NEGOCIO
{
    public class NegocioProvincia
    {
        DaoProvincia daoProvincia = new DaoProvincia();

        public DataTable obtenerProvincias()
        {
            return daoProvincia.ObtenerProvincias();
        }
    }
}

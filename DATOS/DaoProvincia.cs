using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DATOS
{
    public class DaoProvincia
    {
        AccesoDatos accesoDatos = new AccesoDatos();

        public DataTable ObtenerProvincias()
        {
            return accesoDatos.ObtenerTabla("PROVINCIA", "SELECT id_prov, nombre_prov FROM PROVINCIA");
        }
    }
}

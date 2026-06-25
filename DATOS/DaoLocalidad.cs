using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DATOS
{
    public class DaoLocalidad
    {
        AccesoDatos accesoDatos = new AccesoDatos();

        public DataTable ObtenerLocalidades()
        {
            return accesoDatos.ObtenerTabla("LOCALIDAD", "SELECT id_loc, nombre_loc, id_pro FROM LOCALIDAD");
        }

        public DataTable ObtenerLocalidadesPorProvincia(int idProvincia)
        {
            return accesoDatos.ObtenerTabla("LOCALIDAD", "SELECT id_loc, nombre_loc, id_pro FROM LOCALIDAD WHERE id_pro = " + idProvincia);
        }
    }
}

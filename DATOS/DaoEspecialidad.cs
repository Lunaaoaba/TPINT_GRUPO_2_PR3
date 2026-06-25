using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DATOS
{
    public class DaoEspecialidad
    {
        AccesoDatos accesoDatos = new AccesoDatos();

        public DataTable ObtenerEspecialidades()
        {
            return accesoDatos.ObtenerTabla("ESPECIALIDAD", "SELECT id_esp, nombre_esp FROM ESPECIALIDAD");
        }
    }
}


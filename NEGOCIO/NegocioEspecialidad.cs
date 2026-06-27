using DATOS;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace NEGOCIO
{
    public class NegocioEspecialidad
    {
        DaoEspecialidad dao = new DaoEspecialidad();

        public DataTable ObtenerEspecialidades()
        {
            return dao.ObtenerEspecialidades();
        }
    }
}

using DATOS;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NEGOCIO
{
    public class NegocioLectura
    {
        DaoProvincia daoProvincia = new DaoProvincia();
        DaoLocalidad daoLocalidad = new DaoLocalidad();
        DaoEspecialidad daoEspecialidad = new DaoEspecialidad();

        public DataTable obtenerProvincias()
        {
            return daoProvincia.ObtenerProvincias();
        }

        public DataTable obtenerLocalidades()
        {
            return daoLocalidad.ObtenerLocalidades();
        }

        public DataTable obtenerLocalidadesPorProvincia(int idProvincia)
        {
            return daoLocalidad.ObtenerLocalidadesPorProvincia(idProvincia);
        }

        public DataTable obtenerEspecialidades()
        {
            return daoEspecialidad.ObtenerEspecialidades();
        }
    }
}

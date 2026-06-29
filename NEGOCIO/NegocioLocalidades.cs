using DATOS;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace NEGOCIO
{
    public class NegocioLocalidades
    {
        DaoLocalidad dao = new DaoLocalidad();

        public DataTable obtenerLocalidades()
        {
            return dao.ObtenerLocalidades();
        }
        public DataTable obtenerLocalidadesPorProvincia(int idProvincia)
        {
            return dao.ObtenerLocalidadesPorProvincia(idProvincia);
        }
    }
}

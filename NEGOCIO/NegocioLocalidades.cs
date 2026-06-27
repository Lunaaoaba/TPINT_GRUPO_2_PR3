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

        public DataTable ObtenerLocalidades()
        {
            return dao.ObtenerLocalidades();
        }
    }
}

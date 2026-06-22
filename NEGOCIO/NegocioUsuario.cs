using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DATOS;

namespace NEGOCIO
{
    public class NegocioUsuario
    {
        DaoUsuario dao = new DaoUsuario();
        public DataTable Login(string usuario,
                               string password)
        {
            return dao.ObtenerUsuario(usuario,
                                      password);
        }
    }
}

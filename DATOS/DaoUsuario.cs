using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DATOS
{
    public class DaoUsuario
    {
        AccesoDatos accesoDatos = new AccesoDatos();
        public bool ExisteUsuario(string usuario, string password)
        {
            string consulta = "SELECT * FROM USUARIO" + "'WHERE username_usu='" + usuario + "' AND password_usu='" + password + "' AND activo_usu=1'";
            return accesoDatos.existe(consulta);
        }
        public DataTable ObtenerUsuario(string usuario, string password)
        {
            string consulta = "SELECT * FROM USUARIO" + "'WHERE username_usu='" + usuario + "' AND password_usu='" + password + "'";
            return accesoDatos.ObtenerTabla("USUARIO", consulta);
        }
    }
}

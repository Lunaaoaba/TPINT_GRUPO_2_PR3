using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ENTIDADES;


namespace DATOS
{
    public class DaoUsuario
    {
        AccesoDatos accesoDatos = new AccesoDatos();
        public bool ExisteUsuario(string usuario, string password)
        {
            string consulta = "SELECT * FROM USUARIO" + "WHERE username_usu='" + usuario + "'" + " AND password_usu='" + password + "'" + " AND activo_usu=1";
            return accesoDatos.existe(consulta);
        }
        public DataTable ObtenerUsuario(string usuario, string password)
        {
            string consulta = "SELECT * FROM USUARIO" + " WHERE username_usu='" + usuario + "'" + " AND password_usu='" + password + "'" + " AND activo_usu=1";
            return accesoDatos.ObtenerTabla("USUARIO", consulta);
        }
        public int AgregarUsuario(Usuario usuario)
        {
            SqlCommand comando = new SqlCommand();

            comando.Parameters.Add("@Username", SqlDbType.VarChar).Value = usuario.username;
            comando.Parameters.Add("@Password", SqlDbType.VarChar).Value = usuario.password;
            comando.Parameters.Add("@Tipo", SqlDbType.VarChar).Value = usuario.tipo;
            comando.Parameters.Add("@Activo", SqlDbType.Bit).Value = usuario.activo;

            return accesoDatos.EjecutarProcedimientoEscalar(comando, "spAgregarUsuario");
        }
    }
}

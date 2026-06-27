using DATOS;
using ENTIDADES;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NEGOCIO
{
    public class NegocioUsuario
    {
        DaoUsuario dao = new DaoUsuario();
        public DataTable Login(string usuario, string password)
        {
            return dao.ObtenerUsuario(usuario, password);
        }
        public int AgregarUsuario(string username, string password)
        {
            Usuario usuario = new Usuario();

            usuario.username = username;
            usuario.password = password;
            usuario.tipo = "Medico";
            usuario.activo = true;

            return dao.AgregarUsuario(usuario);
        }
    }
}

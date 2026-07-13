using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    public class Usuario
    {
        private int id_usuario;
        private string username;
        private string password;
        private string tipo;        // "Admin" o "Medico" (por eso string)
        private bool activo;

        public Usuario() {}
        public Usuario(int idUsuario, string username, string password, string tipo, bool activo)
        {
            id_usuario = idUsuario;
            this.username = username;
            this.password = password;
            this.tipo = tipo;
            this.activo = activo;
        }

        public int Id_usuario
        {
            get { return id_usuario; }
            set { id_usuario = value; }
        }
        public string Username
        {
            get { return username; }
            set { username = value; }
        }
        public string Password
        {
            get { return password; }
            set { password = value; }
        }
        public string Tipo
        {
            get { return tipo; }
            set { tipo = value; }
        }
        public bool Activo
        {
            get { return activo; }
            set { activo = value; }
        }

        public bool EsAdmin{get { return tipo == "Admin"; } }
        public bool EsMedico{get { return tipo == "Medico"; } }
    }
}
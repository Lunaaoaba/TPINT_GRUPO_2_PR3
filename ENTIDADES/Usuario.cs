using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    public class Usuario
    {
        private int Id_usuario;
        private string Username;
        private string Password;
        private string Tipo;        // "Admin" o "Medico" (por eso string)
        private bool Activo;

        public Usuario() {}
        public Usuario(int idUsuario, string username, string password, string tipo, bool activo)
        {
            Id_usuario = idUsuario;
            Username = username;
            Password = password;
            Tipo = tipo;
            Activo = activo;
        }

        public int id_usuario
        {
            get { return Id_usuario; }
            set { Id_usuario = value; }
        }
        public string username
        {
            get { return Username; }
            set { Username = value; }
        }
        public string password
        {
            get { return Password; }
            set { Password = value; }
        }
        public string tipo
        {
            get { return Tipo; }
            set { Tipo = value; }
        }
        public bool activo
        {
            get { return Activo; }
            set { Activo = value; }
        }

        public bool EsAdmin{get { return Tipo == "Admin"; } }
        public bool EsMedico{get { return Tipo == "Medico"; } }
    }
}
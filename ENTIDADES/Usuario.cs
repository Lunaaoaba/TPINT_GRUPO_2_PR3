using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    public class Usuario
    {
        public int UsuarioId { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Tipo { get; set; }        // "Admin" o "Medico" (pa eso string)
        public bool Activo { get; set; }

        public bool EsAdmin => Tipo == "Admin";
        public bool EsMedico => Tipo == "Medico";
    }
}

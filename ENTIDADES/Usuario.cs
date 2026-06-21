using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    public class Usuario
    {
        public int id_usuario { get; set; }
        public string username { get; set; }
        public string password { get; set; }
        public string tipo { get; set; }        // "Admin" o "Medico" (pa eso string)
        public bool activo { get; set; }
        public bool EsAdmin => tipo == "Admin";
        public bool EsMedico => tipo == "Medico";
    }
}

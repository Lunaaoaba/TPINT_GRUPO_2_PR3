using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    public abstract class Persona
    {
        public string dni { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public char sexo { get; set; }   
        public string nacionalidad { get; set; }
        public DateTime fecha_nacimiento { get; set; }
        public string direccion { get; set; }
        public Localidad id_loc { get; set; } 
        public string email { get; set; }
        public string telefono { get; set; }
        public string nombre_completo => $"{apellido}, {nombre}";
    }
}

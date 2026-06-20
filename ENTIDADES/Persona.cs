using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    public abstract class Persona
    {
        public string Dni { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public char Sexo { get; set; }   
        public string Nacionalidad { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Direccion { get; set; }
        public Localidad Localidad { get; set; } 
        public string Email { get; set; }
        public string Telefono { get; set; }

        public string NombreCompleto => $"{Apellido}, {Nombre}";
    }
}

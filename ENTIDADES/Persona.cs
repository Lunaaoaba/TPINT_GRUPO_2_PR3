using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    public abstract class Persona
    {
        private string Dni;
        private string Nombre;
        private string Apellido;
        private char Sexo;
        private string Nacionalidad;
        private DateTime Fecha_nacimiento;
        private string Direccion;
        private Localidad Id_loc;
        private string Email;
        private string Telefono;

        public string dni
        {
            get { return Dni; }
            set { Dni = value; }
        }
        public string nombre
        {
            get { return Nombre; }
            set { Nombre = value; }
        }
        public string apellido
        {
            get { return Apellido; }
            set { Apellido = value; }
        }
        public char sexo
        {
            get { return Sexo; }
            set { Sexo = value; }
        }
        public string nacionalidad
        {
            get { return Nacionalidad; }
            set { Nacionalidad = value; }
        }
        public DateTime fecha_nacimiento
        {
            get { return Fecha_nacimiento; }
            set { Fecha_nacimiento = value; }
        }
        public string direccion
        {
            get { return Direccion; }
            set { Direccion = value; }
        }
        public Localidad id_loc
        {
            get { return Id_loc; }
            set { Id_loc = value; }
        }
        public string email
        {
            get { return Email; }
            set { Email = value; }
        }
        public string telefono
        {
            get { return Telefono; }
            set { Telefono = value; }
        }

        public string nombre_completo { get {return $"{Apellido}, {Nombre}"; } }
    }
}

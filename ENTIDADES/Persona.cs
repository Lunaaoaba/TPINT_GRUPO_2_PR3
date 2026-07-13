using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    public abstract class Persona
    {
        private string dni;
        private string nombre;
        private string apellido;
        private char sexo;
        private string nacionalidad;
        private DateTime fecha_nacimiento;
        private string direccion;
        private Localidad id_loc;
        private string email;
        private string telefono;

        public string Dni
        {
            get { return dni; }
            set { dni = value; }
        }
        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }
        public string Apellido
        {
            get { return apellido; }
            set { apellido = value; }
        }
        public char Sexo
        {
            get { return sexo; }
            set { sexo = value; }
        }
        public string Nacionalidad
        {
            get { return nacionalidad; }
            set { nacionalidad = value; }
        }
        public DateTime Fecha_nacimiento
        {
            get { return fecha_nacimiento; }
            set { fecha_nacimiento = value; }
        }
        public string Direccion
        {
            get { return direccion; }
            set { direccion = value; }
        }
        public Localidad Id_loc
        {
            get { return id_loc; }
            set { id_loc = value; }
        }
        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        public string Telefono
        {
            get { return telefono; }
            set { telefono = value; }
        }

        public string NombreCompleto { get {return $"{Apellido}, {Nombre}"; } }
    }
}

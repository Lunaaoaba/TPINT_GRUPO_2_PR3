using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    public class Paciente : Persona
    {
        private int id_pac;
        private bool activo_pac;

        public Paciente() {}
        public Paciente(int idPac) { id_pac = idPac; }
        public Paciente(int idPac, string dni, string nombre, string apellido, char sexo,
                         string nacionalidad, DateTime fechaNacimiento, string direccion,
                         Localidad idLoc, string email, string telefono, bool activoPac)
        {
            id_pac = idPac;
            this.dni = dni;
            this.nombre = nombre;
            this.apellido = apellido;
            this.sexo = sexo;
            this.nacionalidad = nacionalidad;
            this.fecha_nacimiento = fechaNacimiento;
            this.direccion = direccion;
            this.id_loc = idLoc;
            this.email = email;
            this.telefono = telefono;
            Activo_pac = activoPac;
        }

        public int Id_pac
        {   get { return id_pac; }
            set { id_pac = value; }
        }
        public bool Activo_pac
        {   get { return activo_pac; }
            set { activo_pac = value; }
        }
    }
}
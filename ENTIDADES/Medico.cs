using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    public class Medico : Persona
    {
        private int id_med;
        private string legajo_med;
        private Especialidad id_esp;
        private List<HorarioMedico> horarios;
        private Usuario credenciales;
        private bool activo;

        public Medico()
        {
            horarios = new List<HorarioMedico>();
        }
        public Medico(int idMed) { id_med = idMed; }

        public Medico(int idMed, string dni, string nombre, string apellido, char sexo, string nacionalidad, DateTime fechaNacimiento, string direccion,
                      Localidad idLoc, string email, string telefono, string legajoMed, Especialidad idEsp, Usuario credenciales, bool activo)
        {
            id_med = idMed;
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
            Legajo_med = legajoMed;
            Id_esp = idEsp;
            Credenciales = credenciales;
            Activo = activo;
            Horarios = new List<HorarioMedico>();
        }

        public int Id_med
        {   get { return id_med; }
            set { id_med = value; }
        }
        public string Legajo_med
        {   get { return legajo_med; }
            set { legajo_med = value; }
        }
        public Especialidad Id_esp
        {   get { return id_esp; }
            set { id_esp = value; }
        }
        public List<HorarioMedico> Horarios
        {   get { return horarios; }
            set { horarios = value; }
        }
        public Usuario Credenciales
        {   get { return credenciales; }
            set { credenciales = value; }
        }
        public bool Activo
        {   get { return activo; }
            set { activo = value; }
        }
    }
}
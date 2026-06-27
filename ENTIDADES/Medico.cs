using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    public class Medico : Persona
    {
        private int Id_med;
        private string Legajo_med;
        private Especialidad Id_esp;
        private string _nombreEspecialidad; 
        private List<HorarioMedico> Horarios;
        private Usuario Credenciales;
        private bool Activo;

        public Medico()
        {
            Horarios = new List<HorarioMedico>();
        }
        public Medico(int idMed) { Id_med = idMed; }

        public Medico(int idMed, string dni, string nombre, string apellido, char sexo, string nacionalidad, DateTime fechaNacimiento, string direccion,
                      Localidad idLoc, string email, string telefono, string legajoMed, Especialidad idEsp, Usuario credenciales, bool activo)
        {
            Id_med = idMed;
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

        public int id_med
        {   get { return Id_med; }
            set { Id_med = value; }
        }
        public string legajo_med
        {   get { return Legajo_med; }
            set { Legajo_med = value; }
        }
        public Especialidad id_esp
        {   get { return Id_esp; }
            set { Id_esp = value; }
        }
      
        public List<HorarioMedico> horarios
        {   get { return Horarios; }
            set { Horarios = value; }
        }
        public Usuario credenciales
        {   get { return Credenciales; }
            set { Credenciales = value; }
        }
        public bool activo
        {   get { return Activo; }
            set { Activo = value; }
        }
    }
}
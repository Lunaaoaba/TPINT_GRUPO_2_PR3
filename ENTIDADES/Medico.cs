using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    public class Medico : Persona
    {

        public Medico()
        {
            Horarios = new List<HorarioMedico>();
        }

        public int MedicoId { get; set; }
        public string Legajo { get; set; }
        public Especialidad Especialidad { get; set; }   
        public List<HorarioMedico> Horarios { get; set; }   
        public Usuario Credenciales { get; set; }          
        public bool Activo { get; set; }

        
    }
}

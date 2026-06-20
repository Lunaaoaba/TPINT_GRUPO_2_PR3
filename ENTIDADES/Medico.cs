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

        public int id_medico { get; set; }
        public string legajo { get; set; }
        public Especialidad especialidad { get; set; }   
        public List<HorarioMedico> horarios { get; set; }   
        public Usuario credenciales { get; set; }          
        public bool activo { get; set; }
        
    }
}

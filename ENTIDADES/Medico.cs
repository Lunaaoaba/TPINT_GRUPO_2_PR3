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
             horarios = new List<HorarioMedico>();
        }

        public int id_med { get; set; }
        public string legajo_med { get; set; }
        public Especialidad id_esp { get; set; }
        public List<HorarioMedico> horarios { get; set; }   
        //public Usuario credenciales { get; set; }          
        public bool activo { get; set; }
        
    }
}

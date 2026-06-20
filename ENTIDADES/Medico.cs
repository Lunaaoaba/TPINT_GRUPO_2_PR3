using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    public class Medico : Persona
    {
        public int MedicoId { get; set; }
        public string Legajo { get; set; }
        public Especialidad Especialidad { get; set; }       // objeto navegable
        public List<HorarioMedico> Horarios { get; set; }    // dias/horarios de atencion
        public UsuarioMedico Credenciales { get; set; }       // null si no tiene usuario asignado

        public Medico()
        {
            Horarios = new List<HorarioMedico>();
        }
    }
}

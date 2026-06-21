using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    internal class Turno
    {
        public int id_tur { get; set; }
        public Medico id_med { get; set; }
        public int id_pac { get; set; } // dsp lo cambio a public Paciente ya q ahora no existe
        public Especialidad id_esp { get; set; }
        public string fecha_tur { get; set; } // pendiente realizar algo para fecha
        public HorarioMedico hora_tur { get; set; }  //hora de inicio
        public string estado_tur { get; set; }
        public string observacion_tur { get; set; }
        public bool activo_tur { get; set; }
    }
}

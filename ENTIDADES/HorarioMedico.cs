using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    public class HorarioMedico
    {
        public int horarioId { get; set; }
        public int medicoId { get; set; }
        public int diaSemana { get; set; }     // 1=Lunes ... 7=Domingo
        public TimeSpan horaInicio { get; set; }
        public TimeSpan horaFin { get; set; }
        public bool activo { get; set; }

        public string NombreDia
        {
            get
            {
                string[] dias = { "", "Lunes", "Martes", "Miercoles",
                                   "Jueves", "Viernes", "Sabado", "Domingo" };
                return (diaSemana >= 1 && diaSemana <= 7) ? dias[diaSemana] : "";
            }
        }
    }
}

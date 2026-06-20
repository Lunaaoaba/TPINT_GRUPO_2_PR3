using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    public class HorarioMedico
    {
        public int HorarioId { get; set; }
        public int MedicoId { get; set; }
        public int DiaSemana { get; set; }     // 1=Lunes ... 7=Domingo
        public TimeSpan HoraInicio { get; set; }
        public TimeSpan HoraFin { get; set; }
        public bool Activo { get; set; }

        public string NombreDia
        {
            get
            {
                string[] dias = { "", "Lunes", "Martes", "Miercoles",
                                   "Jueves", "Viernes", "Sabado", "Domingo" };
                return (DiaSemana >= 1 && DiaSemana <= 7) ? dias[DiaSemana] : "";
            }
        }
    }
}

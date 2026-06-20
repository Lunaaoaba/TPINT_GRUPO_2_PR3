using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    public class HorarioMedico
    {
        public int id_hor { get; set; }
        public int id_med { get; set; }
        public int dia_semana_hor { get; set; }     // 1=Lunes ... 7=Domingo
        public TimeSpan hora_inicio_hor { get; set; }
        public TimeSpan hora_fin_hor { get; set; }
        public bool activo_hor { get; set; }

        public string nombre_dia
        {
            get
            {
                string[] dias = { "", "Lunes", "Martes", "Miercoles",
                                   "Jueves", "Viernes", "Sabado", "Domingo" };
                return (dia_semana_hor >= 1 && dia_semana_hor <= 7) ? dias[dia_semana_hor] : "";
            }
        }
    }
}

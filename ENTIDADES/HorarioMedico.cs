using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    public class HorarioMedico
    {
        private int id_hor;
        private int id_med;
        private int dia_semana_hor;
        private TimeSpan hora_inicio_hor;
        private TimeSpan hora_fin_hor;
        private bool activo_hor;

        public int Id_hor
        {
            get { return id_hor; }
            set { id_hor = value; }
        }

        public int Id_med
        {
            get { return id_med; }
            set { id_med = value; }
        }

        public int Dia_semana_hor
        {
            get { return dia_semana_hor; }
            set { dia_semana_hor = value; }
        }

        public TimeSpan Hora_inicio_hor
        {
            get { return hora_inicio_hor; }
            set { hora_inicio_hor = value; }
        }

        public TimeSpan Hora_Fin_hor
        {
            get { return hora_inicio_hor; }
            set { hora_inicio_hor = value; }
        }

        public bool Activo_hor
        {
            get { return activo_hor; }
            set { activo_hor = value; }
        }

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

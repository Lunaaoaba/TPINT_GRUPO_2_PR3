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
        public Medico medico;
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
            get { return medico.Id_med; }
            set { medico.Id_med = value; }
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

        public TimeSpan Hora_fin_hor
        {
            get { return hora_fin_hor; }
            set { hora_fin_hor = value; }
        }

        public bool Activo_hor
        {
            get { return activo_hor; }
            set { activo_hor = value; }
        }
    }
}

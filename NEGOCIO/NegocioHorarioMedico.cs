using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DATOS;
using ENTIDADES;
using System.Data;

namespace NEGOCIO
{
    public class NegocioHorarioMedico
    {
        DaoHorarioMedico dao = new DaoHorarioMedico();
        HorarioMedico horarioMedico = new HorarioMedico();
        

        public int AgregarHorario(int id_Medico, int dia_Semana, TimeSpan hora_inicio, TimeSpan hora_fin)
        {
            horarioMedico.medico = new Medico();
            horarioMedico.medico.Id_med = id_Medico;
            horarioMedico.Dia_semana_hor = dia_Semana;
            horarioMedico.Hora_inicio_hor = hora_inicio;
            horarioMedico.Hora_fin_hor = hora_fin;
            horarioMedico.Activo_hor = true;

            return dao.AgregarHorarioMedico(horarioMedico);
        }
    }
}

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
            horarioMedico.medico.id_med = id_Medico;
            horarioMedico.dia_semana_hor = dia_Semana;
            horarioMedico.hora_inicio_hor = hora_inicio;
            horarioMedico.hora_fin_hor = hora_fin;
            horarioMedico.activo_hor = true;

            //int resultado = dao.AgregarHorarioMedico(horarioMedico);
            //if(resultado == 1){
            //    return true;
            //}
            //return false;
            return dao.AgregarHorarioMedico(horarioMedico);

        }
    }
}

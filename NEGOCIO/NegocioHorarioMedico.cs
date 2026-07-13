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

        public bool AgregarHorario(int id_Medico, int dia_Semana, TimeSpan hora_inicio)
        {
            horarioMedico.medico = new Medico();

            horarioMedico.Dia_semana_hor = dia_Semana;
            horarioMedico.Hora_inicio_hor = hora_inicio;
            horarioMedico.Activo_hor = true;

            int filasAfectadas = dao.AgregarHorarioMedico(horarioMedico);
            return filasAfectadas == 1;
        }
    }
}
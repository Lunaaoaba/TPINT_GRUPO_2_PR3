using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using ENTIDADES;

namespace DATOS
{
    public class DaoHorarioMedico
    {
        AccesoDatos accesoDatos = new AccesoDatos();

        private void ParametrosAgregarHorarioMedico(ref SqlCommand comando, HorarioMedico horarioMedico)
        {
            SqlParameter parametro = new SqlParameter();
            parametro = comando.Parameters.Add("@id_med", SqlDbType.Int);
            parametro.Value = horarioMedico.medico.Id_med;
            parametro = comando.Parameters.Add("@dia_semana_hor", SqlDbType.Int);
            parametro.Value = horarioMedico.Dia_semana_hor;
            parametro = comando.Parameters.Add("@hora_inicio_hor", SqlDbType.Time);
            parametro.Value = horarioMedico.Hora_inicio_hor;
            parametro = comando.Parameters.Add("@hora_fin_hor", SqlDbType.Time);
            parametro.Value = horarioMedico.hora_fin_hor;
        }
        public int AgregarHorarioMedico(HorarioMedico horarioMedico)
        {
            try
            {
                SqlCommand comando = new SqlCommand();
                ParametrosAgregarHorarioMedico(ref comando, horarioMedico);

                return accesoDatos.EjecutarProcedimientoAlmacenado(comando, "spAgregarHorarioMedico");
            }
            catch (SqlException ex)
            {
                if (ex.Message.Contains("HORARIO_SUPERPUESTO"))
                {
                    return -1;
                }

                if (ex.Message.Contains("HORARIO_DUPLICADO"))
                {
                    return -2;
                }

                throw;
            }
        }
    }
}

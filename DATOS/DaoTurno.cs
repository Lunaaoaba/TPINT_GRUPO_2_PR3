using ENTIDADES;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DATOS
{
    public class DaoTurno
    {
        AccesoDatos accesoDatos = new AccesoDatos();

        public DataTable ObtenerHorariosDisponibles(int idMedico, DateTime fecha)
        {
            int diaSemana = fecha.DayOfWeek == DayOfWeek.Sunday ? 7 : (int)fecha.DayOfWeek;

            string consulta = @"SELECT hora_inicio_hor FROM HORARIO_MEDICO 
                              WHERE id_med = " + idMedico + @" AND dia_semana_hor = " + diaSemana + @" AND activo_hor = 1 AND hora_inicio_hor
                              NOT IN
                              (SELECT hora_tur FROM TURNO WHERE id_med = " + idMedico + @" AND fecha_tur = '" + fecha.ToString("yyyy-MM-dd") + @"' AND activo_tur = 1)";
        }

        public int AgregarTurno(int idMedico, int idPaciente, int idEspecialidad, DateTime fecha, string hora)
        {
            SqlCommand comando = new SqlCommand();

            comando.Parameters.AddWithValue("@id_med", idMedico);
            comando.Parameters.AddWithValue("@id_pac", idPaciente);
            comando.Parameters.AddWithValue("@id_esp", idEspecialidad);
            comando.Parameters.AddWithValue("@fecha_tur", fecha);
            comando.Parameters.AddWithValue("@hora_tur", TimeSpan.Parse(hora));

            return accesoDatos.EjecutarProcedimientoAlmacenado(comando, "spAgregarTurno");
        }
    }
}

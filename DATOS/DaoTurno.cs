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
            return accesoDatos.ObtenerTabla("HorariosDisponibles", consulta);
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

        public DataTable ObtenerTurnosPorMedico(int idMedico)
        {
            string consulta = @"SELECT 
            T.id_tur,
            T.fecha_tur,
            CONVERT(VARCHAR(5), T.hora_tur, 108) AS hora_tur,
            P.id_pac,
            P.dni_pac,
            P.nombre_pac,
            P.apellido_pac,
            T.estado_tur,
            T.observacion_tur
            FROM TURNO T
            INNER JOIN PACIENTE P ON T.id_pac = P.id_pac
            WHERE T.activo_tur = 1 AND T.id_med = " + idMedico +
            " ORDER BY T.fecha_tur, T.hora_tur";

            return accesoDatos.ObtenerTabla("TURNOS_MEDICO", consulta);
        }

        public DataTable FiltrarTurnos(int idMedico, string ingreso, string tipoFiltro, string estado)
        {
            string consulta = @"SELECT 
            T.id_tur,
            T.fecha_tur,
            CONVERT(VARCHAR(5), T.hora_tur, 108) AS hora_tur,
            P.id_pac,
            P.dni_pac,
            P.nombre_pac,
            P.apellido_pac,
            T.estado_tur,
            T.observacion_tur
            FROM TURNO T
            INNER JOIN PACIENTE P ON T.id_pac = P.id_pac
            WHERE T.activo_tur = 1 AND T.id_med = " + idMedico;

            if (!string.IsNullOrWhiteSpace(tipoFiltro) && !string.IsNullOrWhiteSpace(ingreso))
            {
                string like = ingreso.Replace("'", "''");
                if (tipoFiltro == "dni_pac")
                {
                    consulta += " AND P.dni_pac LIKE '%" + like + "%'";
                }
                else if (tipoFiltro == "nombre_pac")
                {
                    consulta += " AND P.nombre_pac LIKE '%" + like + "%'";
                }
                else if (tipoFiltro == "apellido_pac")
                {
                    consulta += " AND P.apellido_pac LIKE '%" + like + "%'";
                }
            }

            if (!string.IsNullOrWhiteSpace(estado) && estado != "Todos")
            {
                consulta += " AND T.estado_tur = '" + estado.Replace("'", "''") + "'";
            }

            consulta += " ORDER BY T.fecha_tur, T.hora_tur";

            return accesoDatos.ObtenerTabla("TURNOS_MEDICO", consulta);
        }

        public int ActualizarTurno(int idTurno, string estado, string observacion)
        {
            SqlCommand comando = new SqlCommand();
            comando.Parameters.Add("@id_tur", SqlDbType.Int).Value = idTurno;
            comando.Parameters.Add("@estado_tur", SqlDbType.VarChar).Value = estado;
            comando.Parameters.Add("@observacion_tur", SqlDbType.VarChar).Value =
                string.IsNullOrWhiteSpace(observacion) ? (object)DBNull.Value : observacion;
            return accesoDatos.EjecutarProcedimientoAlmacenado(comando, "spModificarTurno");
        }

        public int ObtenerMedicoIdPorTurno(int idTurno)
        {
            string consulta = "SELECT id_med FROM TURNO WHERE id_tur = " + idTurno;
            DataTable dt = accesoDatos.ObtenerTabla("TURNO", consulta);
            if (dt != null && dt.Rows.Count > 0)
            {
                try { return Convert.ToInt32(dt.Rows[0]["id_med"]); }
                catch { return -1; }
            }
            return -1;
        }

    }
}

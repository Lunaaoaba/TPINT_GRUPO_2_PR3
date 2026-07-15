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
    public class DaoMedico
    {
        AccesoDatos accesoDatos = new AccesoDatos();

        public Boolean existeMedico(Medico medico)
        {
            String consulta = "SELECT id_med, " +
                "dni_med, " +
                "nombre_med, " +
                "apellido_med, " +
                "sexo_med, " +
                "nacionalidad_med, " +
                "fecha_nacimiento_med, " +
                "direccion_med, " +
                "id_loc, " +
                "email_med, " +
                "telefono_med, " +
                "legajo_med, " +
                "id_esp, " +
                "id_usu, " +
                "activo_med FROM MEDICO";
            return accesoDatos.existe(consulta);
        }
        public DataTable ObtenerTablaMedico()
        {
            DataTable dataTable = accesoDatos.ObtenerTabla(
                "MEDICO",
                @"SELECT
            M.id_med,
            M.legajo_med,
            M.dni_med,
            M.nombre_med,
            M.apellido_med,
            M.sexo_med,
            M.nacionalidad_med,
            M.fecha_nacimiento_med,
            M.direccion_med,
            L.nombre_loc,
            M.email_med,
            M.telefono_med,
            E.nombre_esp,

            STRING_AGG(
                CASE H.dia_semana_hor
                    WHEN 1 THEN 'Lunes'
                    WHEN 2 THEN 'Martes'
                    WHEN 3 THEN 'Miércoles'
                    WHEN 4 THEN 'Jueves'
                    WHEN 5 THEN 'Viernes'
                    WHEN 6 THEN 'Sábado'
                    WHEN 7 THEN 'Domingo'
                END
                + ' '
                + CONVERT(VARCHAR(5), H.hora_inicio_hor, 108)
                + ' - '
                + CONVERT(VARCHAR(5), H.hora_fin_hor, 108),
                ' | '
            ) AS horario_atencion

        FROM MEDICO M
        INNER JOIN LOCALIDAD L
            ON M.id_loc = L.id_loc
        INNER JOIN ESPECIALIDAD E
            ON M.id_esp = E.id_esp
        LEFT JOIN HORARIO_MEDICO H
            ON M.id_med = H.id_med

        WHERE M.activo_med = 1

        GROUP BY
            M.id_med,
            M.legajo_med,
            M.dni_med,
            M.nombre_med,
            M.apellido_med,
            M.sexo_med,
            M.nacionalidad_med,
            M.fecha_nacimiento_med,
            M.direccion_med,
            L.nombre_loc,
            M.email_med,
            M.telefono_med,
            E.nombre_esp");
            return dataTable;
        }
        //        public DataTable ObtenerTablaMedico()
        //        {
        //            DataTable dataTable = accesoDatos.ObtenerTabla(
        //    "MEDICO",
        //    @"SELECT
        //        M.id_med,
        //        M.legajo_med,
        //        M.dni_med,
        //        M.nombre_med,
        //        M.apellido_med,
        //        M.sexo_med,
        //        M.nacionalidad_med,
        //        M.fecha_nacimiento_med,
        //        M.direccion_med,
        //        L.nombre_loc,
        //        M.email_med,
        //        M.telefono_med,
        //        E.nombre_esp,

        //        CASE H.dia_semana_hor
        //    WHEN 1 THEN 'Lunes'
        //    WHEN 2 THEN 'Martes'
        //    WHEN 3 THEN 'Miércoles'
        //    WHEN 4 THEN 'Jueves'
        //    WHEN 5 THEN 'Viernes'
        //    WHEN 6 THEN 'Sábado'
        //    WHEN 7 THEN 'Domingo'
        //END
        //+ ' '
        //+ CONVERT(VARCHAR(5), H.hora_inicio_hor, 108)
        //+ ' - '
        //+ CONVERT(VARCHAR(5), H.hora_fin_hor, 108)
        //AS horario_atencion

        //    FROM MEDICO M
        //    INNER JOIN LOCALIDAD L ON M.id_loc = L.id_loc
        //    INNER JOIN ESPECIALIDAD E ON M.id_esp = E.id_esp
        //    LEFT JOIN HORARIO_MEDICO H ON M.id_med = H.id_med

        //    WHERE M.activo_med = 1");
        //            return dataTable;
        //        }

        public DataTable ObtenerTablaMedicoPorId(Medico medico)
        {
            DataTable dataTable = accesoDatos.ObtenerTabla("MEDICO", 
                "SELECT id_med, " +
                "legajo_med, " +
                "dni_med, nombre_med, " +
                "apellido_med, " +
                "sexo_med, " +
                "nacionalidad_med, " +
                "fecha_nacimiento_med, " +
                "direccion_med," +
                " nombre_loc, " +
                "email_med, " +
                "telefono_med, " +
                "nombre_esp " +
                "FROM MEDICO M INNER JOIN LOCALIDAD L ON M.id_loc = L.id_loc " +
                "INNER JOIN ESPECIALIDAD E ON M.id_esp = E.id_esp WHERE M.id_med = " + medico.id_med );
            return dataTable;
        }

        public DataTable FiltrarMedicos(string ingreso, string tipoFiltro)
        {
            string query = "SELECT id_med, dni_med, nombre_med, apellido_med " + "sexo_med, nacionalidad_med, fecha_nacimiento_med, " + "direccion_med, nombre_loc, " + "email_med, telefono_med, activo_med " + "FROM MEDICO P INNER JOIN LOCALIDAD L ON P.id_loc = L.id_loc " + "WHERE P.activo_med = 1 ";
            if (!string.IsNullOrWhiteSpace(ingreso))
            {
                if (tipoFiltro == "id_med") query += " AND id_med = " + ingreso;
                else if (tipoFiltro == "dni_med") query += " AND dni_med LIKE '%" + ingreso + "%'";
                else if (tipoFiltro == "nombre_med") query += " AND nombre_med LIKE '%" + ingreso + "%'";
                else if (tipoFiltro == "apellido_med") query += " AND apellido_med LIKE '%" + ingreso + "%'";

            }
            return accesoDatos.ObtenerTabla("MEDICO", query);
        }

        public void ParametrosAgregarMedico(ref SqlCommand comando, Medico medico)
        {
            SqlParameter parametro = new SqlParameter();
            parametro = comando.Parameters.Add("@DniMedico", SqlDbType.VarChar);
            parametro.Value = medico.Dni;
            parametro = comando.Parameters.Add("@NombreMedico", SqlDbType.VarChar);
            parametro.Value = medico.Nombre;
            parametro = comando.Parameters.Add("@ApellidoMedico", SqlDbType.VarChar);
            parametro.Value = medico.Apellido;
            parametro = comando.Parameters.Add("@SexoMedico", SqlDbType.VarChar);
            parametro.Value = medico.Sexo;
            parametro = comando.Parameters.Add("@NacionalidadMedico", SqlDbType.VarChar);
            parametro.Value = medico.Nacionalidad;
            parametro = comando.Parameters.Add("@FechaNacimientoMedico", SqlDbType.Date);
            parametro.Value = medico.Fecha_nacimiento;
            parametro = comando.Parameters.Add("@DireccionMedico", SqlDbType.VarChar);
            parametro.Value = medico.Direccion;
            parametro = comando.Parameters.Add("@IdLocalidad", SqlDbType.Int);
            parametro.Value = medico.Id_loc != null ? medico.Id_loc.Id_loc : (object)DBNull.Value;
            parametro = comando.Parameters.Add("@EmailMedico", SqlDbType.VarChar);
            parametro.Value = medico.Email;
            parametro = comando.Parameters.Add("@TelefonoMedico", SqlDbType.VarChar);
            parametro.Value = medico.Telefono;
            parametro = comando.Parameters.Add("@LegajoMedico", SqlDbType.VarChar);
            parametro.Value = medico.Legajo_med;
            parametro = comando.Parameters.Add("@IdEspecialidad", SqlDbType.Int);
            parametro.Value = medico.Id_esp != null ? medico.Id_esp.Id_esp : (object)DBNull.Value;
            parametro = comando.Parameters.Add("@IdUsuario", SqlDbType.Int);
            parametro.Value = medico.Credenciales != null ? medico.Credenciales.Id_usuario : (object)DBNull.Value;
            parametro = comando.Parameters.Add("@ActivoMedico", SqlDbType.Bit);
            parametro.Value = medico.Activo;
        }

        public int AgregarMedico(Medico medico)
        {
            SqlCommand comando = new SqlCommand();
            ParametrosAgregarMedico(ref comando, medico);
            return accesoDatos.EjecutarProcedimientoAlmacenado(comando, "spAgregarMedico");
        }

        private void ParametrosEliminarMedico(ref SqlCommand comando, Medico medico)
        {
            SqlParameter parametro = new SqlParameter();
            parametro = comando.Parameters.Add("@id_med", SqlDbType.Int);
            parametro.Value = medico.Id_med;
        }

        public int EliminarMedico(Medico medico)
        {
            SqlCommand sqlCommand = new SqlCommand();
            ParametrosEliminarMedico(ref sqlCommand, medico);
            return accesoDatos.EjecutarProcedimientoAlmacenado(sqlCommand, "spEliminarMedico");
        }

        // para modificar medico
        private void ParametrosModificarMedico(ref SqlCommand comando, Medico medico)
        {
            comando.Parameters.Add("@id_med", SqlDbType.Int).Value = medico.Id_med;
            comando.Parameters.Add("@dni_med", SqlDbType.VarChar).Value = medico.Dni;
            comando.Parameters.Add("@nombre_med", SqlDbType.VarChar).Value = medico.Nombre;
            comando.Parameters.Add("@apellido_med", SqlDbType.VarChar).Value = medico.Apellido;
            comando.Parameters.Add("@sexo_med", SqlDbType.VarChar).Value = medico.Sexo.ToString();
            comando.Parameters.Add("@nacionalidad_med", SqlDbType.VarChar).Value = medico.Nacionalidad;
            comando.Parameters.Add("@fecha_nacimiento_med", SqlDbType.Date).Value = medico.Fecha_nacimiento;
            comando.Parameters.Add("@direccion_med", SqlDbType.VarChar).Value = medico.Direccion;
            comando.Parameters.Add("@id_loc", SqlDbType.Int).Value = medico.Id_loc.Id_loc;
            comando.Parameters.Add("@email_med", SqlDbType.VarChar).Value = medico.Email;
            comando.Parameters.Add("@telefono_med", SqlDbType.VarChar).Value = medico.Telefono;
            comando.Parameters.Add("@legajo_med", SqlDbType.VarChar).Value = medico.Legajo_med;
            comando.Parameters.Add("@id_esp", SqlDbType.Int).Value = medico.Id_esp.Id_esp;
        }

        public int ModificarMedico(Medico medico)
        {
            SqlCommand comando = new SqlCommand();
            ParametrosModificarMedico(ref comando, medico);
            return accesoDatos.EjecutarProcedimientoAlmacenado(comando, "spModificarMedico");
        }

        public int ActualizarMedico(Medico medico)
        {
            SqlCommand comando = new SqlCommand();
            ParametrosModificarMedico(ref comando, medico);
            return accesoDatos.EjecutarProcedimientoAlmacenado(comando, "spModificarMedico");
        }

        public int RestaurarMedico()
        {
            SqlCommand comando = new SqlCommand();
            return accesoDatos.EjecutarProcedimientoAlmacenado(comando, "spRestaurarMedico");
        }

        public int RestaurarMedicoPorId(Medico medico)
        {
            SqlCommand sqlCommand = new SqlCommand();
            ParametrosEliminarMedico(ref sqlCommand, medico);
            return accesoDatos.EjecutarProcedimientoAlmacenado(sqlCommand, "spRestaurarMedicoPorId");
        }
    }

}
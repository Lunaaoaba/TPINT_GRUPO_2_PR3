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
            String consulta = "SELECT id_med, dni_med, nombre_med, apellido_med, sexo_med, nacionalidad_med, fecha_nacimiento_med, direccion_med, id_loc, email_med, telefono_med, legajo_med, id_esp, id_usu, activo_med FROM MEDICO";
            return accesoDatos.existe(consulta);
        }

        public DataTable ObtenerTablaMedico()
        {
            DataTable dataTable = accesoDatos.ObtenerTabla("MEDICO", "SELECT id_med, dni_med, nombre_med, apellido_med, sexo_med, nacionalidad_med, fecha_nacimiento_med, direccion_med, id_loc, email_med, telefono_med, legajo_med, id_esp, id_usu, activo_med FROM MEDICO");
            return dataTable;
        }

        public DataTable ObtenerTablaMedicoPorId(Medico medico)
        {
            DataTable dataTable = accesoDatos.ObtenerTabla("MEDICO", "SELECT id_med, dni_med, nombre_med, apellido_med, sexo_med, nacionalidad_med, fecha_nacimiento_med, direccion_med, id_loc, email_med, telefono_med, legajo_med, id_esp, id_usu, activo_med FROM MEDICO WHERE id_med = " + medico.id_med);
            return dataTable;
        }

        public void ParametrosAgregarMedico(ref SqlCommand comando, Medico medico)
        {
            SqlParameter parametro = new SqlParameter();
            parametro = comando.Parameters.Add("@DniMedico", SqlDbType.VarChar);
            parametro.Value = medico.dni;
            parametro = comando.Parameters.Add("@NombreMedico", SqlDbType.VarChar);
            parametro.Value = medico.nombre;
            parametro = comando.Parameters.Add("@ApellidoMedico", SqlDbType.VarChar);
            parametro.Value = medico.apellido;
            parametro = comando.Parameters.Add("@SexoMedico", SqlDbType.VarChar);
            parametro.Value = medico.sexo;
            parametro = comando.Parameters.Add("@NacionalidadMedico", SqlDbType.VarChar);
            parametro.Value = medico.nacionalidad;
            parametro = comando.Parameters.Add("@FechaNacimientoMedico", SqlDbType.Date);
            parametro.Value = medico.fecha_nacimiento;
            parametro = comando.Parameters.Add("@DireccionMedico", SqlDbType.VarChar);
            parametro.Value = medico.direccion;
            parametro = comando.Parameters.Add("@IdLocalidad", SqlDbType.Int);
            parametro.Value = medico.id_loc != null ? medico.id_loc.id_loc : (object)DBNull.Value;
            parametro = comando.Parameters.Add("@EmailMedico", SqlDbType.VarChar);
            parametro.Value = medico.email;
            parametro = comando.Parameters.Add("@TelefonoMedico", SqlDbType.VarChar);
            parametro.Value = medico.telefono;
            parametro = comando.Parameters.Add("@LegajoMedico", SqlDbType.VarChar);
            parametro.Value = medico.legajo_med;
            parametro = comando.Parameters.Add("@IdEspecialidad", SqlDbType.Int);
            parametro.Value = medico.id_esp != null ? medico.id_esp.id_esp : (object)DBNull.Value;
            parametro = comando.Parameters.Add("@IdUsuario", SqlDbType.Int);
            parametro.Value = medico.credenciales != null ? medico.credenciales.id_usuario : (object)DBNull.Value;
            parametro = comando.Parameters.Add("@ActivoMedico", SqlDbType.Bit);
            parametro.Value = medico.activo;
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
            parametro.Value = medico.id_med;
        }

        public int EliminarMedico(Medico medico)
        {
            SqlCommand sqlCommand = new SqlCommand();
            ParametrosEliminarMedico(ref sqlCommand, medico);
            return accesoDatos.EjecutarProcedimientoAlmacenado(sqlCommand, "spEliminarMedico");
        }
    }

}
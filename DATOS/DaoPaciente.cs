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
    public class DaoPaciente
    {
        AccesoDatos accesoDatos = new AccesoDatos();

        public Boolean existePaciente(Paciente paciente)
        {
            String consulta = "SELECT id_pac, dni_pac, nombre_pac, apellido_pac, sexo_pac, nacionalidad_pac, fecha_nacimiento_pac, direccion_pac, id_loc, email_pac, telefono_pac, activo_pac FROM PACIENTE";
            return accesoDatos.existe(consulta);
        }

        public DataTable ObtenerTablaPaciente()
        {
            DataTable dataTable = accesoDatos.ObtenerTabla("PACIENTE", "SELECT id_pac, dni_pac, nombre_pac, apellido_pac, sexo_pac, nacionalidad_pac, fecha_nacimiento_pac, direccion_pac, id_loc, email_pac, telefono_pac, activo_pac FROM PACIENTE");
            return dataTable;
        }

        public DataTable ObtenerTablaPacientePorId(Paciente paciente)
        {
            DataTable dataTable = accesoDatos.ObtenerTabla("PACIENTE", "SELECT id_pac, dni_pac, nombre_pac, apellido_pac, sexo_pac, nacionalidad_pac, fecha_nacimiento_pac, direccion_pac, id_loc, email_pac, telefono_pac, activo_pac FROM PACIENTE WHERE id_pac = " + paciente.id_pac);
            return dataTable;
        }

        public void ParametrosAgregarPaciente(ref SqlCommand comando, Paciente paciente)
        {
            SqlParameter parametro = new SqlParameter();
            parametro = comando.Parameters.Add("@DniPaciente", SqlDbType.VarChar);
            parametro.Value = paciente.dni;
            parametro = comando.Parameters.Add("@NombrePaciente", SqlDbType.VarChar);
            parametro.Value = paciente.nombre;
            parametro = comando.Parameters.Add("@ApellidoPaciente", SqlDbType.VarChar);
            parametro.Value = paciente.apellido;
            parametro = comando.Parameters.Add("@SexoPaciente", SqlDbType.VarChar);
            parametro.Value = paciente.sexo;
            parametro = comando.Parameters.Add("@NacionalidadPaciente", SqlDbType.VarChar);
            parametro.Value = paciente.nacionalidad;
            parametro = comando.Parameters.Add("@FechaNacimientoPaciente", SqlDbType.Date);
            parametro.Value = paciente.fecha_nacimiento;
            parametro = comando.Parameters.Add("@DireccionPaciente", SqlDbType.VarChar);
            parametro.Value = paciente.direccion;
            parametro = comando.Parameters.Add("@IdLocalidad", SqlDbType.Int);
            parametro.Value = paciente.id_loc;
            parametro = comando.Parameters.Add("@EmailPaciente", SqlDbType.VarChar);
            parametro.Value = paciente.email;
            parametro = comando.Parameters.Add("@TelefonoPaciente", SqlDbType.VarChar);
            parametro.Value = paciente.telefono;
        }

        public int AgregarPaciente(Paciente paciente)
        {
            SqlCommand comando = new SqlCommand();
            ParametrosAgregarPaciente(ref comando, paciente);
            return accesoDatos.EjecutarProcedimientoAlmacenado(comando, "spAgregarPaciente");
        }
 
        private void ParametrosEliminarPaciente(ref SqlCommand comando, Paciente paciente)
        {
            SqlParameter parametro = new SqlParameter();
            parametro = comando.Parameters.Add("@id_pac", SqlDbType.Int);
            parametro.Value = paciente.id_pac;
        }
 
        public int EliminarPaciente(Paciente paciente)
        {
            SqlCommand sqlCommand = new SqlCommand();
            ParametrosEliminarPaciente(ref sqlCommand, paciente);
            return accesoDatos.EjecutarProcedimientoAlmacenado(sqlCommand, "spEliminarPaciente");
        }
    }
}
        
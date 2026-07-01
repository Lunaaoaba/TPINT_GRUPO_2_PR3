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
            DataTable dataTable = accesoDatos.ObtenerTabla("PACIENTE", "SELECT P.id_pac, P.dni_pac, P.nombre_pac, P.apellido_pac, " + "P.sexo_pac, P.nacionalidad_pac, P.fecha_nacimiento_pac, " + "P.direccion_pac, P.id_loc, L.nombre_loc, " + "P.email_pac, P.telefono_pac, P.activo_pac " + "FROM PACIENTE P " + "INNER JOIN LOCALIDAD L ON P.id_loc = L.id_loc " + "WHERE P.activo_pac = 1");
            return dataTable;
        }

        public DataTable ObtenerTablaPacientePorId(Paciente paciente)
        {
            DataTable dataTable = accesoDatos.ObtenerTabla("PACIENTE", "SELECT id_pac, dni_pac, nombre_pac, apellido_pac, sexo_pac, nacionalidad_pac, fecha_nacimiento_pac, direccion_pac, id_loc, email_pac, telefono_pac, activo_pac FROM PACIENTE WHERE id_pac = " + paciente.id_pac);
            return dataTable;
        }

        public DataTable ObtenerTablaPacientePorNombre(Paciente paciente)
        {
            DataTable dataTable = accesoDatos.ObtenerTabla("PACIENTE", "SELECT id_pac, dni_pac, nombre_pac, apellido_pac, sexo_pac, nacionalidad_pac, fecha_nacimiento_pac, direccion_pac, id_loc, email_pac, telefono_pac, activo_pac FROM PACIENTE WHERE nombre_pac = " + paciente.nombre);
            return dataTable;
        }

        public void ParametrosAgregarPaciente(ref SqlCommand comando, Paciente paciente)
        {
            SqlParameter parametro = new SqlParameter();
            parametro = comando.Parameters.Add("@dni_pac", SqlDbType.VarChar);
            parametro.Value = paciente.dni;
            parametro = comando.Parameters.Add("@nombre_pac", SqlDbType.VarChar);
            parametro.Value = paciente.nombre;
            parametro = comando.Parameters.Add("@apellido_pac", SqlDbType.VarChar);
            parametro.Value = paciente.apellido;
            parametro = comando.Parameters.Add("@sexo_pac", SqlDbType.VarChar);
            parametro.Value = paciente.sexo;
            parametro = comando.Parameters.Add("@nacionalidad_pac", SqlDbType.VarChar);
            parametro.Value = paciente.nacionalidad;
            parametro = comando.Parameters.Add("@fecha_nacimiento_pac", SqlDbType.Date);
            parametro.Value = paciente.fecha_nacimiento;
            parametro = comando.Parameters.Add("@direccion_pac", SqlDbType.VarChar);
            parametro.Value = paciente.direccion;
            parametro = comando.Parameters.Add("@id_loc", SqlDbType.Int);
            parametro.Value = paciente.id_loc != null ? paciente.id_loc.id_loc : (object)DBNull.Value;
            parametro = comando.Parameters.Add("@email_pac", SqlDbType.VarChar);
            parametro.Value = paciente.email;
            parametro = comando.Parameters.Add("@telefono_pac", SqlDbType.VarChar);
            parametro.Value = paciente.telefono;
        }

        public int AgregarPaciente(Paciente paciente)
        {
            SqlCommand comando = new SqlCommand();
            ParametrosAgregarPaciente(ref comando, paciente);
            return accesoDatos.EjecutarProcedimientoAlmacenado(comando, "spAgregarPaciente");
        }
        private void ParametrosEliminarRestaurarPaciente(ref SqlCommand comando, Paciente paciente)
        {
            SqlParameter parametro = new SqlParameter();
            parametro = comando.Parameters.Add("@id_pac", SqlDbType.Int);
            parametro.Value = paciente.id_pac;
        }

        public int EliminarPaciente(Paciente paciente)
        {
            SqlCommand sqlCommand = new SqlCommand();
            ParametrosEliminarRestaurarPaciente(ref sqlCommand, paciente);
            return accesoDatos.EjecutarProcedimientoAlmacenado(sqlCommand, "spEliminarPaciente");
        }

        private void ParametrosModificarPaciente(ref SqlCommand comando, Paciente paciente)
        {
            comando.Parameters.Add("@id_pac", SqlDbType.Int).Value = paciente.id_pac;
            comando.Parameters.Add("@dni_pac", SqlDbType.VarChar).Value = paciente.dni;
            comando.Parameters.Add("@nombre_pac", SqlDbType.VarChar).Value = paciente.nombre;
            comando.Parameters.Add("@apellido_pac", SqlDbType.VarChar).Value = paciente.apellido;
            comando.Parameters.Add("@sexo_pac", SqlDbType.VarChar).Value = paciente.sexo;
            comando.Parameters.Add("@nacionalidad_pac", SqlDbType.VarChar).Value = paciente.nacionalidad;
            comando.Parameters.Add("@fecha_nacimiento_pac", SqlDbType.Date).Value = paciente.fecha_nacimiento;
            comando.Parameters.Add("@direccion_pac", SqlDbType.VarChar).Value = paciente.direccion;
            comando.Parameters.Add("@id_loc", SqlDbType.Int).Value = paciente.id_loc.id_loc;
            comando.Parameters.Add("@email_pac", SqlDbType.VarChar).Value = paciente.email;
            comando.Parameters.Add("@telefono_pac", SqlDbType.VarChar).Value = paciente.telefono;
        }

        public int ModificarPaciente(Paciente paciente)
        {
            SqlCommand comando = new SqlCommand();
            ParametrosModificarPaciente(ref comando, paciente);
            return accesoDatos.EjecutarProcedimientoAlmacenado(comando, "spModificarPaciente");
        }

        public int RestaurarPacientes(Paciente paciente)
        {
            SqlCommand comando = new SqlCommand();
            ParametrosEliminarRestaurarPaciente(ref comando, paciente);
            return accesoDatos.EjecutarProcedimientoAlmacenado(comando, "spRestaurarPacientes");
        }

        public int RestaurarPacientePorId(Paciente paciente)
        {
            SqlCommand sqlCommand = new SqlCommand();
            ParametrosEliminarRestaurarPaciente(ref sqlCommand, paciente);
            return accesoDatos.EjecutarProcedimientoAlmacenado(sqlCommand, "spRestaurarPacientePorId");
        }
    }
}
        
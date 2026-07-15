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

        public bool ExistePacientePorId(int idPaciente)
        {
            string consulta = "SELECT id_pac FROM PACIENTE WHERE id_pac = " + idPaciente + " AND activo_pac = 1";
            return accesoDatos.existe(consulta);
        }

        public DataTable ObtenerTablaPaciente()
        {
            DataTable dataTable = accesoDatos.ObtenerTabla("PACIENTE", "SELECT P.id_pac, P.dni_pac, P.nombre_pac, P.apellido_pac, " + "P.sexo_pac, P.nacionalidad_pac, P.fecha_nacimiento_pac, " + "P.direccion_pac, P.id_loc, L.nombre_loc, " + "P.email_pac, P.telefono_pac, P.activo_pac " + "FROM PACIENTE P " + "INNER JOIN LOCALIDAD L ON P.id_loc = L.id_loc " + "WHERE P.activo_pac = 1");
            return dataTable;
        }

        public DataTable ObtenerTablaPacientePorId(Paciente paciente)
        {
            DataTable dataTable = accesoDatos.ObtenerTabla("PACIENTE", "SELECT id_pac, dni_pac, nombre_pac, apellido_pac, sexo_pac, nacionalidad_pac, fecha_nacimiento_pac, direccion_pac, id_loc, email_pac, telefono_pac, activo_pac FROM PACIENTE WHERE id_pac = " + paciente.Id_pac);
            return dataTable;
        }

        public DataTable ObtenerTablaPacientePorNombre(Paciente paciente)
        {
            DataTable dataTable = accesoDatos.ObtenerTabla("PACIENTE", "SELECT id_pac, dni_pac, nombre_pac, apellido_pac, sexo_pac, nacionalidad_pac, fecha_nacimiento_pac, direccion_pac, id_loc, email_pac, telefono_pac, activo_pac FROM PACIENTE WHERE nombre_pac = " + paciente.Nombre);
            return dataTable;
        }

        public DataTable FiltrarPacientes(string ingreso, string tipoFiltro)
        {
            string query = "SELECT P.id_pac, P.dni_pac, P.nombre_pac, P.apellido_pac, " + "P.sexo_pac, P.nacionalidad_pac, P.fecha_nacimiento_pac, " + "P.direccion_pac, P.id_loc, L.nombre_loc, " + "P.email_pac, P.telefono_pac, P.activo_pac " + "FROM PACIENTE P INNER JOIN LOCALIDAD L ON P.id_loc = L.id_loc " + "WHERE P.activo_pac = 1 ";
            if (!string.IsNullOrWhiteSpace(ingreso))
            {
                if (tipoFiltro == "id_pac") query += " AND P.id_pac = " + ingreso;
                else if (tipoFiltro == "dni_pac") query += " AND P.dni_pac LIKE '%" + ingreso + "%'";
                else if (tipoFiltro == "nombre_pac") query += " AND P.nombre_pac LIKE '%" + ingreso + "%'";
                else if (tipoFiltro == "apellido_pac") query += " AND P.apellido_pac LIKE '%" + ingreso + "%'";

            }
            return accesoDatos.ObtenerTabla("PACIENTE", query);
        }

        public void ParametrosAgregarPaciente(ref SqlCommand comando, Paciente paciente)
        {
            SqlParameter parametro = new SqlParameter();
            parametro = comando.Parameters.Add("@dni_pac", SqlDbType.VarChar);
            parametro.Value = paciente.Dni;
            parametro = comando.Parameters.Add("@nombre_pac", SqlDbType.VarChar);
            parametro.Value = paciente.Nombre;
            parametro = comando.Parameters.Add("@apellido_pac", SqlDbType.VarChar);
            parametro.Value = paciente.Apellido;
            parametro = comando.Parameters.Add("@sexo_pac", SqlDbType.VarChar);
            parametro.Value = paciente.Sexo;
            parametro = comando.Parameters.Add("@nacionalidad_pac", SqlDbType.VarChar);
            parametro.Value = paciente.Nacionalidad;
            parametro = comando.Parameters.Add("@fecha_nacimiento_pac", SqlDbType.Date);
            parametro.Value = paciente.Fecha_nacimiento;
            parametro = comando.Parameters.Add("@direccion_pac", SqlDbType.VarChar);
            parametro.Value = paciente.Direccion;
            parametro = comando.Parameters.Add("@id_loc", SqlDbType.Int);
            parametro.Value = paciente.Id_loc != null ? paciente.Id_loc.Id_loc : (object)DBNull.Value;
            parametro = comando.Parameters.Add("@email_pac", SqlDbType.VarChar);
            parametro.Value = paciente.Email;
            parametro = comando.Parameters.Add("@telefono_pac", SqlDbType.VarChar);
            parametro.Value = paciente.Telefono;
        }

        public int AgregarPaciente(Paciente paciente)
        {
            SqlCommand comando = new SqlCommand();
            ParametrosAgregarPaciente(ref comando, paciente);
            try
            {
                return accesoDatos.EjecutarProcedimientoAlmacenado(comando, "spAgregarPaciente");
            }
            catch (SqlException ex) when (ex.Message.Contains("DNI_DUPLICADO"))
            {
                return -1;
            }
        }

        private void ParametrosEliminarPaciente(ref SqlCommand comando, Paciente paciente)
        {
            SqlParameter parametro = new SqlParameter();
            parametro = comando.Parameters.Add("@id_pac", SqlDbType.Int);
            parametro.Value = paciente.Id_pac;
        }

        public int EliminarPaciente(Paciente paciente)
        {
            SqlCommand sqlCommand = new SqlCommand();
            ParametrosEliminarPaciente(ref sqlCommand, paciente);
            return accesoDatos.EjecutarProcedimientoAlmacenado(sqlCommand, "spEliminarPaciente");
        }

        private void ParametrosModificarPaciente(ref SqlCommand comando, Paciente paciente)
        {
            comando.Parameters.Add("@id_pac", SqlDbType.Int).Value = paciente.Id_pac;
            comando.Parameters.Add("@dni_pac", SqlDbType.VarChar).Value = paciente.Dni;
            comando.Parameters.Add("@nombre_pac", SqlDbType.VarChar).Value = paciente.Nombre;
            comando.Parameters.Add("@apellido_pac", SqlDbType.VarChar).Value = paciente.Apellido;
            comando.Parameters.Add("@sexo_pac", SqlDbType.VarChar).Value = paciente.Sexo;
            comando.Parameters.Add("@nacionalidad_pac", SqlDbType.VarChar).Value = paciente.Nacionalidad;
            comando.Parameters.Add("@fecha_nacimiento_pac", SqlDbType.Date).Value = paciente.Fecha_nacimiento;
            comando.Parameters.Add("@direccion_pac", SqlDbType.VarChar).Value = paciente.Direccion;
            comando.Parameters.Add("@id_loc", SqlDbType.Int).Value = paciente.Id_loc.Id_loc;
            comando.Parameters.Add("@email_pac", SqlDbType.VarChar).Value = paciente.Email;
            comando.Parameters.Add("@telefono_pac", SqlDbType.VarChar).Value = paciente.Telefono;
        }

        public int ModificarPaciente(Paciente paciente)
        {
            SqlCommand comando = new SqlCommand();
            ParametrosModificarPaciente(ref comando, paciente);
            return accesoDatos.EjecutarProcedimientoAlmacenado(comando, "spModificarPaciente");
        }

        public int RestaurarPacientes()
        {
            SqlCommand comando = new SqlCommand();
            return accesoDatos.EjecutarProcedimientoAlmacenado(comando, "spRestaurarPacientes");
        }

        public int RestaurarPacientePorId(Paciente paciente)
        {
            SqlCommand sqlCommand = new SqlCommand();
            ParametrosEliminarPaciente(ref sqlCommand, paciente);
            return accesoDatos.EjecutarProcedimientoAlmacenado(sqlCommand, "spRestaurarPacientePorId");
        }
    }
}
        
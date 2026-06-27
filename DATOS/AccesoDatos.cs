using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DATOS
{
    public class AccesoDatos
    {

        String ruta = @"Data Source=localhost\SQLEXPRESS;Initial Catalog=BDD_TPI_GRUPO_2_PR3;Integrated Security=True;Encrypt=False";
        public AccesoDatos()
        {
            ///CONSTRUCTOR VACIO    
        }

        private SqlConnection ObtenerConexion()
        {
            SqlConnection conexion = new SqlConnection(ruta);
            try
            {
                conexion.Open();
                return conexion;
            }
            catch (Exception) { return null; }
        }

        public SqlDataAdapter ObtenerAdapter(string consulta, SqlConnection conection)
        {
            try
            {
                SqlDataAdapter adapter = new SqlDataAdapter(consulta, conection);
                return adapter;
            }
            catch (Exception) { return null; }
        }

        public int EjecutarProcedimientoAlmacenado(SqlCommand comando, string procedimiento)
        {
            SqlConnection conexion = ObtenerConexion();
            comando.Connection = conexion;
            comando.CommandType = CommandType.StoredProcedure;
            comando.CommandText = procedimiento;
            int filasCambiadas = comando.ExecuteNonQuery();
            conexion.Close();
            return filasCambiadas;
        }

        public int EjecutarProcedimientoEscalar(SqlCommand comando, string procedimiento)
        {
            SqlConnection conexion = ObtenerConexion();

            comando.Connection = conexion;
            comando.CommandType = CommandType.StoredProcedure;
            comando.CommandText = procedimiento;

            int idGenerado = Convert.ToInt32(comando.ExecuteScalar());

            conexion.Close();

            return idGenerado;
        }
        public Boolean existe(string consulta)
        {
            SqlConnection conexion = ObtenerConexion();
            SqlCommand comando = new SqlCommand(consulta, conexion);
            SqlDataReader leer = comando.ExecuteReader();
            if (leer.Read())
            {
                conexion.Close();
                return true;
            }
            else
            {
                conexion.Close();
                return false;
            }
        }

        public DataTable ObtenerTabla(string NombreTabla, string ConsultaSQL)
        {
            DataSet dataset = new DataSet();
            SqlConnection conexion = ObtenerConexion();
            SqlDataAdapter adaptador = ObtenerAdapter(ConsultaSQL, conexion);
            adaptador.Fill(dataset, NombreTabla);
            conexion.Close();
            return dataset.Tables[NombreTabla];
        }

    }
}

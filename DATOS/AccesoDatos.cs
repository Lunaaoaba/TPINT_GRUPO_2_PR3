using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DATOS
{
    internal class AccesoDatos
    {
        private string ruta = @"Data Source=localhost\sqlexpress; Initial Catalog = BDD_TPI_GRUPO_2_PR3; Integrated Security = True; Trust Server Certificate=True";
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

    }
}

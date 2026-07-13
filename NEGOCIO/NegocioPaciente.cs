using DATOS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using ENTIDADES;

namespace NEGOCIO
{
    public class NegocioPaciente
    {
        DaoPaciente dao = new DaoPaciente();
        Paciente paciente = new Paciente();

        public DataTable obtenerTablaPaciente()
        {
            return dao.ObtenerTablaPaciente();
        }
        public DataTable obtenerTablaPacientePorId(Paciente paciente)
        {
            return dao.ObtenerTablaPacientePorId(paciente);
        }
        public DataTable FiltrarPacientes(string idOrNombre, string tipoFiltro)
        {
            return dao.FiltrarPacientes(idOrNombre, tipoFiltro);
        }

        public int AgregarPaciente(string dni, string nombre, string apellido, char sexo, string nacionalidad, DateTime fecha_nacimiento, string direccion, int id_loc, string email, string telefono)
        {
            Localidad localidad = new Localidad { Id_loc = id_loc };

            paciente.Dni = dni;
            paciente.Nombre = nombre;
            paciente.Apellido = apellido;
            paciente.Sexo = sexo;
            paciente.Nacionalidad = nacionalidad;
            paciente.Fecha_nacimiento = fecha_nacimiento;
            paciente.Direccion = direccion;
            paciente.Id_loc = localidad;
            paciente.Email = email;
            paciente.Telefono = telefono;

            return dao.AgregarPaciente(paciente);
        }

        public bool EliminarPaciente(int id)
        {
            paciente.Id_pac = id;
            int filasAfectadas = dao.EliminarPaciente(paciente);
            if (filasAfectadas == 1) return true;
            else return false;
        }

        public bool ModificarPaciente(int id, string dni, string nombre, string apellido, char sexo, string nacionalidad, DateTime fecha_nacimiento, string direccion, int id_loc, string email, string telefono)
        {
            Paciente paciente = new Paciente();
            Localidad localidad = new Localidad();
            localidad.Id_loc = id_loc;

            paciente.Id_pac = id;
            paciente.Dni = dni;
            paciente.Nombre = nombre;
            paciente.Apellido = apellido;
            paciente.Sexo = sexo;
            paciente.Nacionalidad = nacionalidad;
            paciente.Fecha_nacimiento = fecha_nacimiento;
            paciente.Direccion = direccion;
            paciente.Id_loc = localidad;
            paciente.Email = email;
            paciente.Telefono = telefono;

            int filasAfectadas = dao.ModificarPaciente(paciente);
            if (filasAfectadas == 1) return true;
            else return false;
        }

        public bool RestaurarPacientePorId(int id)
        {
            paciente.Id_pac = id;
            int filasAfectadas = dao.RestaurarPacientePorId(paciente);
            if (filasAfectadas == 1) return true;
            else return false;
        }

        public bool RestaurarPacientes()
        {
            int filasAfectadas = dao.RestaurarPacientes();
            return filasAfectadas >= 0;
        }
    }
}   
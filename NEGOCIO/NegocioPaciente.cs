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

        public int AgregarPaciente(string dni, string nombre, string apellido, char sexo, string nacionalidad, DateTime fecha_nacimiento, string direccion, int id_loc, string email, string telefono)
        {
            Localidad localidad = new Localidad { id_loc = id_loc };

            paciente.dni = dni;
            paciente.nombre = nombre;
            paciente.apellido = apellido;
            paciente.sexo = sexo;
            paciente.nacionalidad = nacionalidad;
            paciente.fecha_nacimiento = fecha_nacimiento;
            paciente.direccion = direccion;
            paciente.id_loc = localidad;
            paciente.email = email;
            paciente.telefono = telefono;

            return dao.AgregarPaciente(paciente); // -1 = DNI duplicado, 1 = OK, 0 = error
        }

        public bool EliminarPaciente(int id)
        {
            paciente.id_pac = id;
            int filasAfectadas = dao.EliminarPaciente(paciente);
            if (filasAfectadas == 1) return true;
            else return false;
        }

        public bool ModificarPaciente(int id, string dni, string nombre, string apellido, char sexo, string nacionalidad, DateTime fecha_nacimiento, string direccion, int id_loc, string email, string telefono)
        {
            Paciente paciente = new Paciente();
            Localidad localidad = new Localidad();
            localidad.id_loc = id_loc;

            paciente.id_pac = id;
            paciente.dni = dni;
            paciente.nombre = nombre;
            paciente.apellido = apellido;
            paciente.sexo = sexo;
            paciente.nacionalidad = nacionalidad;
            paciente.fecha_nacimiento = fecha_nacimiento;
            paciente.direccion = direccion;
            paciente.id_loc = localidad;
            paciente.email = email;
            paciente.telefono = telefono;

            int filasAfectadas = dao.ModificarPaciente(paciente);
            if (filasAfectadas == 1) return true;
            else return false;
        }

        public bool RestaurarPacientePorId(int id)
        {
            paciente.id_pac = id;
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
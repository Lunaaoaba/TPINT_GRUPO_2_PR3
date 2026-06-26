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

        public bool AgregarPaciente(string dni, string nombre, string apellido, char sexo, string nacionalidad, DateTime fecha_nacimiento, string direccion, int id_loc, string email, string telefono, out string mensaje)
        {
            if (dao.ExistePacientePorDni(dni, 0))
            {
                mensaje = "Ya existe un paciente con ese DNI.";
                return false;
            }

            Localidad localidad = new Localidad();
            localidad.id_loc = id_loc;

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

            int filasAfectadas = dao.AgregarPaciente(paciente);
            if (filasAfectadas == 1)
            { 
                mensaje = "Paciente agregado correctamente.";
                return true;
            }
            mensaje = "No se pudo agregar el paciente.";
            return false;
        }

        public bool EliminarPaciente(int id)
        {
            paciente.id_pac = id;
            int filasAfectadas = dao.EliminarPaciente(paciente);
            if (filasAfectadas == 1) return true;
            else return false;
        }

        public bool ModificarPaciente(int id, string dni, string nombre, string apellido, char sexo, string nacionalidad, DateTime fecha_nacimiento, string direccion, int id_loc, string email, string telefono, out string mensaje)
        {
            if (dao.ExistePacientePorDni(dni, id))
            {
                mensaje = "Ya existe otro paciente con ese DNI.";
                return false;
            }

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
            if (filasAfectadas == 1)
            {
                mensaje = "Paciente modificado correctamente.";
                return true;
            }
            mensaje = "No se pudo modificar el paciente.";
            return false;
        }
    }
}   
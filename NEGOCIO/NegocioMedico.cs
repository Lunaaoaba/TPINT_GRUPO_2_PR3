using DATOS;
using ENTIDADES;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NEGOCIO
{
    public class NegocioMedico
    {
        DaoMedico dao = new DaoMedico();
        Medico medico = new Medico();

        public DataTable obtenerTablaMedico()
        {
            return dao.ObtenerTablaMedico();
        }

        public DataTable obtenerTablaMedicoPorId(Medico medico)
        {
            return dao.ObtenerTablaMedicoPorId(medico);
        }

        public bool AgregarMedico(string dni, string nombre, string apellido, char sexo, string nacionalidad, DateTime fecha_nacimiento, string direccion, int id_loc, string email, string telefono, string legajo, int id_esp, int id_usuario, bool activo)
        {
            Localidad localidad = new Localidad();
            Especialidad especialidad = new Especialidad();
            Usuario usuario = new Usuario();

            medico.dni = dni;
            medico.nombre = nombre;
            medico.apellido = apellido;
            medico.sexo = sexo;
            medico.nacionalidad = nacionalidad;
            medico.fecha_nacimiento = fecha_nacimiento;
            medico.direccion = direccion;
            localidad.id_loc = id_loc;
            medico.id_loc = localidad;
            medico.email = email;
            medico.telefono = telefono;
            medico.legajo_med = legajo;

            especialidad.id_esp = id_esp;
            medico.id_esp = especialidad;

            usuario.id_usuario = id_usuario;
            medico.credenciales = usuario;

            medico.activo = activo;

            int filasAfectadas = dao.AgregarMedico(medico);
            return filasAfectadas == 1;
        }

        public bool EliminarMedico(int id)
        {
            medico.id_med = id;
            int filasAfectadas = dao.EliminarMedico(medico);
            return filasAfectadas == 1;
        }
    }
}

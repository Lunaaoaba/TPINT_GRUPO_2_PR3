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

        public DataTable FiltrarMedicos(string idOrNombre, string tipoFiltro)
        {
            return dao.FiltrarMedicos(idOrNombre, tipoFiltro);
        }

        public bool AgregarMedico(
            string dni,
            string nombre,
            string apellido,
            char sexo,
            string nacionalidad,
            DateTime fecha_nacimiento,
            string direccion,
            int id_loc,
            string email,
            string telefono,
            string legajo,
            int id_esp,
            int id_usuario,
            bool activo)
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
            return filasAfectadas > 0;
        }

        public bool ActualizarMedico(Medico medico)
        {
            DaoMedico dao = new DaoMedico();
            int filasAfectadas = dao.ActualizarMedico(medico);
            return filasAfectadas > 0;
        }

        public bool ModificarMedico(int id, string dni, string nombre, string apellido, char sexo, string nacionalidad, DateTime fecha_nacimiento, string direccion, int id_loc, string email,string id_esp, string telefono)
        {
            Medico medico = new Medico();
            Localidad localidad = new Localidad();
            localidad.id_loc = id_loc;

            medico.id_med = id;
            medico.dni = dni;
            medico.nombre = nombre;
            medico.apellido = apellido;
            medico.sexo = sexo;
            medico.nacionalidad = nacionalidad;
            medico.fecha_nacimiento = fecha_nacimiento;
            medico.direccion = direccion;
            medico.id_loc = localidad;
            medico.email = email;
            medico.email = email;
            medico.telefono = telefono;

            int filasAfectadas = dao.ModificarMedico(medico);
            if (filasAfectadas == 1) return true;
            else return false;
        }

        public bool RestaurarMedicoPorId(int id)
        {
            medico.id_med = id;
            int filasAfectadas = dao.RestaurarMedicoPorId(medico);
            if (filasAfectadas == 1) return true;
            else return false;
        }

        public bool RestaurarMedico()
        {
            int filasAfectadas = dao.RestaurarMedico();
            return filasAfectadas >= 0;
        }
    }

}
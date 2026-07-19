using DATOS;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NEGOCIO
{
    public class NegocioTurno
    {
        DaoTurno dao = new DaoTurno();

        public DataTable ObtenerTurnosPorMedico(int idMedico)
        {
            return dao.ObtenerTurnosPorMedico(idMedico);
        }

        public DataTable ObtenerTurnosPorMedico(int idMedico, string pacienteLike, string estado)
        {
            return dao.FiltrarTurnos(idMedico, pacienteLike, null, estado);
        }

        public DataTable FiltrarTurnos(int idMedico, string ingreso, string tipoFiltro, string estado)
        {
            return dao.FiltrarTurnos(idMedico, ingreso, tipoFiltro, estado);
        }

        public int ActualizarTurno(int idTurno, string estado, string observacion)
        {
            return dao.ActualizarTurno(idTurno, estado, observacion);
        }

        public bool ModificarTurno(int idTurno, string estado, string observacion)
        {
            int filas = dao.ActualizarTurno(idTurno, estado, observacion);
            return filas > 0;
        }

        public int ObtenerMedicoIdPorTurno(int idTurno)
        {
            return dao.ObtenerMedicoIdPorTurno(idTurno);
        }

        public bool PerteneceTurnoAMedico(int idTurno, int idMedico)
        {
            int propietario = dao.ObtenerMedicoIdPorTurno(idTurno);
            return propietario == idMedico;
        }
    }
}

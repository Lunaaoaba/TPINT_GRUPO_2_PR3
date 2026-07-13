using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    public class Turno
    {
        private int id_tur;
        private Medico id_med;
        private int id_pac;
        private Especialidad id_esp;
        private string fecha_tur;
        private HorarioMedico hora_tur;
        private string estado_tur;
        private string observacion_tur;
        private bool activo_tur;

        public int Id_tur
        {
            get { return id_tur; }
            set { id_tur = value; }
        } 
        public Medico Id_med
        {
            get { return id_med; }
            set { id_med = value; }
        }
        public int Id_pac
        {
            get { return id_pac; }
            set {id_pac  = value; }
        }
        public Especialidad Id_esp
        {
            get { return id_esp; }
            set { id_esp = value; }
        }
        public string Fecha_tur
        {
            get { return fecha_tur; }
            set { fecha_tur = value; }
        }
        public HorarioMedico Hora_tur
        {
            get { return hora_tur; }
            set { hora_tur = value; }
        }
        public string Estado_tur
        {
            get { return estado_tur; }
            set { estado_tur = value; }
        }
        public string Observacion_tur
        {
            get { return observacion_tur; }
            set { observacion_tur = value; }
        }
        public bool Activo_tur
        {
            get { return activo_tur; }
            set { activo_tur = value; }
        }

    }
}

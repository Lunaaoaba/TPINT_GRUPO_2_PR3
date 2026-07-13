using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    public class Localidad
    {
        private int id_loc;
        private string nombre_loc;
        private Provincia id_pro;

        public int Id_loc
        {
            get { return id_loc; }
            set { id_loc = value; }
        }
        public string Nombre_loc
        {
            get { return nombre_loc; }
            set { nombre_loc = value; }
        }
        public Provincia Id_pro
        {
            get { return id_pro; }
            set { id_pro = value; }
        }
    }
}

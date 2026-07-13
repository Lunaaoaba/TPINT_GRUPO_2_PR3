using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    public class Provincia
    {
        private int id_pro;
        private string nombre_pro;

        public int Id_pro
        {
            get { return id_pro; }
            set { id_pro = value; }
        }
        public string Nombre_pro
        {
            get { return nombre_pro; }
            set { nombre_pro = value; }
        }
    }
}
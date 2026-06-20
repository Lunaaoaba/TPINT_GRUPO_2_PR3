using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    public class Localidad
    {
        public int id_localidad { get; set; }
        public string nombre_loc { get; set; }
        public Provincia id_pro { get; set; }
    }
}

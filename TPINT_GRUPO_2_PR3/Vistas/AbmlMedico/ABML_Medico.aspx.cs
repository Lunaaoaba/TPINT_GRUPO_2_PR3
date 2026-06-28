using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPINT_GRUPO_2_PR3.Vistas
{
    public partial class ABML_Medico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AgregarMedico_Click(object sender, EventArgs e)
        {
            Response.Redirect("AgregarMedico.aspx");
        }

        protected void ListarMedicos_Click(object sender, EventArgs e)
        {
            Response.Redirect("MostrarMedico.aspx");
        }

        protected void ReportesMedicos_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModificarMedico.aspx");
        }
    }
}
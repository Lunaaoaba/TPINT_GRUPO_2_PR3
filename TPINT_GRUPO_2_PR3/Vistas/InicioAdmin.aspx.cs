using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPINT_GRUPO_2_PR3.Vistas
{
    public partial class InicioAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblNombreUsuario.Text = Session["usuario"].ToString();

        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("LoginMedicos.aspx");
        }

        protected void btnMedicos_Click(object sender, EventArgs e)
        {
            Response.Redirect("ABML_Medico.aspx");
        }

        protected void btnPacientes_Click(object sender, EventArgs e)
        {
            Response.Redirect("ABML_Pacientes.aspx");
        }

        protected void btnTurnos_Click(object sender, EventArgs e)
        {
            Response.Redirect("ABML_Turnos.aspx");
        }
    }
}
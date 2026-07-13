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
            if (!IsPostBack)
            {
                //if (Convert.ToString(Session["TipoUsuario"]) == "Admin")
                //{
                //    lblNombreUsuario.Text = Convert.ToString(Session["Usuario"]);
                //}
                //else
                //{
                //    Response.Redirect("Login.aspx");
                //}
            }
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        protected void btnMedicos_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Vistas/Admin/AbmlMedico/MostrarMedico.aspx");
        }

        protected void btnPacientes_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Vistas/Admin/AbmlPaciente/ListarModificar_Pacientes.aspx");
        }

        protected void btnTurnos_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Vistas/Admin/AbmlTurno/ABML_Turnos.aspx");
        }

        protected void btnReportes_Click(object sender, EventArgs e)
        {

        }
    }
}
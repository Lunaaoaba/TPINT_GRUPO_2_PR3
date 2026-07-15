using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPINT_GRUPO_2_PR3.Vistas
{
    public partial class InicioMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Convert.ToString(Session["TipoUsuario"]) == "Medico")
                {
                    lblNombreUsuario.Text = Convert.ToString(Session["Usuario"]);
                    lblBienvenido.Text = "Dr./Dra. " + Convert.ToString(Session["Usuario"]);
                }
                else
                {
                    Response.Redirect("~/Vistas/Login.aspx");
                }
            }
        }
        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Vistas/Login.aspx");
        }

    }
}
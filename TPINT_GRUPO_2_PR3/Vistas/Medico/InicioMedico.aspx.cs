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

            }
        }
        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Vistas/Login.aspx");
        }

        protected void ListarTurnos_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Vistas/Medico/ListarTurnos.aspx");
        }

        protected void Opcion1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Vistas/Medico/Menu_Listados.aspx");
        }
    }
}
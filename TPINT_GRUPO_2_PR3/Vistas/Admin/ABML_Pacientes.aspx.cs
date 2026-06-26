using NEGOCIO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPINT_GRUPO_2_PR3.Vistas
{
    public partial class ABML_Pacientes : System.Web.UI.Page
    {
        NegocioPaciente negocioPaciente = new NegocioPaciente();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) CargarGridView();
        }

        private void CargarGridView()
        {
            gvPaciente.DataSource = negocioPaciente.obtenerTablaPaciente();
            gvPaciente.DataBind(); //error no se encontró ningun campo o propiedad 'NombreLocalidad' en el origen de datos
        }

        protected void gvPaciente_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvPaciente.PageIndex = e.NewPageIndex;
            CargarGridView();
        }

        protected void btnEliminar_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName != "Eliminar") return;
            int idPac = Convert.ToInt32(e.CommandArgument);
            bool ok = negocioPaciente.EliminarPaciente(idPac);

            lblMensaje.Visible = true;
            lblMensaje.Text = ok ? "Paciente eliminado correctamente." : "No se pudo eliminar el paciente.";
            lblMensaje.ForeColor = ok ? System.Drawing.Color.Green : System.Drawing.Color.Red;
            CargarGridView();
        }

        protected void btnAgregarPaciente_Click(object sender, EventArgs e)
        {
            Response.Redirect("AltaModificarPaciente.aspx");
        }
    }
}
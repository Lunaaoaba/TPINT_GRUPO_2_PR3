using NEGOCIO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPINT_GRUPO_2_PR3.Vistas
{
    public partial class MostrarMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarGridview();
            }
        }
        private void CargarGridview()
        {
            NegocioMedico negocio = new NegocioMedico();
            gvMedicos.DataSource = negocio.obtenerTablaMedico();
            gvMedicos.DataBind();
        }

        protected void gvMedicos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Response.Write("RowIndex = " + e.RowIndex);
            int id = Convert.ToInt32(gvMedicos.DataKeys[e.RowIndex].Value);

            NegocioMedico negocio = new NegocioMedico();

            if (negocio.EliminarMedico(id))
            {
                CargarGridview();
                lblMensaje.Text = "Mecido dado de baja correctamente";
            }
            else
            {
                lblMensaje.Text = "No se pudo dar de baja el medico...";
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Vistas/Admin/AbmlMedico/ABML_Medico.aspx");
        }

        protected void gvMedicos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMedicos.PageIndex = e.NewPageIndex;
            CargarGridview();
        }
    }
}
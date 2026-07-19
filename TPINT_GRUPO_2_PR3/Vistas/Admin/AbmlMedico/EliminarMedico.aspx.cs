using ENTIDADES;
using NEGOCIO;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPINT_GRUPO_2_PR3.Vistas.AbmlMedico
{
    public partial class ModificarMedico : System.Web.UI.Page
    {
        NegocioMedico negocioMedico = new NegocioMedico();
        NegocioLocalidades NegocioLocalidades = new NegocioLocalidades();
        ENTIDADES.Medico medico = new ENTIDADES.Medico();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMensaje.Visible = false;
            }
        }

        private void mensaje(string mensaje)
        {
            lblMensaje.Visible = true;
            lblMensaje.Text = mensaje;
        }

        private void CargarGridview()
        {
            if (int.TryParse(txtID.Text, out int id_med))
            {
                medico.Id_med = id_med;
                gvEliminarMedico.DataSource = negocioMedico.obtenerTablaMedicoPorId(medico);
                gvEliminarMedico.DataBind();
            }
            else
            {
                gvEliminarMedico.DataSource = null;
                gvEliminarMedico.DataBind();
                mensaje("No se pudo cargar el médico");
            }

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            if(int.TryParse(txtID.Text, out int id_med))
            {
                if (negocioMedico.EliminarMedico(id_med)) mensaje("Médico eliminado con éxito");
                else mensaje("No se pudo eliminar el médico");
            }
            else mensaje("ID inválido");
        }

        protected void bt_restaurar_Click(object sender, EventArgs e)
        {
            if (txtID.Text != "")
            {
                if (int.TryParse(txtID.Text, out int id_med))
                {
                    if (negocioMedico.RestaurarMedicoPorId(id_med)) mensaje("Médico restaurado con éxito");
                    else mensaje("No se pudo restaurar el médico");
                }
                else mensaje("ID inválido");
            }
            else
            {
                if (negocioMedico.RestaurarMedico()) mensaje("Todos los médicos restaurados con éxito");
                else mensaje("No se pudieron restaurar los médicos");
            }
        }

            protected void LbtnPrevisualizarEliminar_Click(object sender, EventArgs e)
            {
                CargarGridview();
            }
        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Vistas/Admin/AbmlMedico/MostrarMedico.aspx");
        }
    }
}
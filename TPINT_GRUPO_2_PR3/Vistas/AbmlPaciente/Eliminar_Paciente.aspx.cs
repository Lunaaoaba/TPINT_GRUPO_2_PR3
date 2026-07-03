using ENTIDADES;
using NEGOCIO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPINT_GRUPO_2_PR3.Vistas.AbmlPaciente
{
    public partial class EliminarPaciente : System.Web.UI.Page
    {
        NegocioPaciente negocioPaciente = new NegocioPaciente();
        NegocioLocalidades negocioLocalidad = new NegocioLocalidades();
        Paciente paciente = new Paciente();
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

        private void CargarGridView()
        {
            if (int.TryParse(txtID.Text, out int id_pac))
            {
                paciente.id_pac = id_pac;
                gvEliminarPaciente.DataSource = negocioPaciente.obtenerTablaPacientePorId(paciente);
                gvEliminarPaciente.DataBind();
            }
            else
            {
                gvEliminarPaciente.DataSource = null;
                gvEliminarPaciente.DataBind();
                mensaje("No se pudo cargar el paciente");
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            if (int.TryParse(txtID.Text, out int id_pac))
            {
                if (negocioPaciente.EliminarPaciente(id_pac)) mensaje("Paciente eliminado con éxito");
                else mensaje("No se pudo eliminar el paciente");
            }
            else mensaje("ID inválido");
        }



        // para restaurar el paciente eliminado por id(si hay algo en el textbox) o general (si está vacío)
        protected void bt_restaurar_Click(object sender, EventArgs e)
        {
            if (txtID.Text != "")
            {
                if (int.TryParse(txtID.Text, out int id))
                {
                    if (negocioPaciente.RestaurarPacientePorId(id)) mensaje("Paciente restaurado");
                    else mensaje("No se pudo restaurar");
                }
                else mensaje("ID inválido");
            }
            else
            {
                if (negocioPaciente.RestaurarPacientes()) mensaje("Pacientes restaurados");
                else mensaje("No se pudo restaurar");
            }

        }

        protected void gv_vistaPrevia_Click(object sender, EventArgs e)
        {
            CargarGridView();
        }
    }
}
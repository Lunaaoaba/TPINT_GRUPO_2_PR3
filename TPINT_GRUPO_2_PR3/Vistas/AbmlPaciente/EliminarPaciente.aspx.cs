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
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            if (int.TryParse(txtID.Text, out int id_pac))
            {
                negocioPaciente.EliminarPaciente(id_pac);
                CargarGridView();
            }
            else 
            {
                //algo
            }
        }



        // para restaurar el paciente eliminado por id(si hay algo en el textbox) o general (si está vacío)
        protected void bt_restaurar_Click(object sender, EventArgs e)
        {
            if (!(txtID.Text == ""))
            {
                // restaura por id pe
            }
            // restaura todo pe

        }
    }
}
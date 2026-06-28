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
        NegocioLectura negocioLectura = new NegocioLectura();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack) CargarGridView();
        }
        private void CargarGridView()
        {
            gvPaciente.DataSource = negocioPaciente.obtenerTablaPaciente();
            gvPaciente.DataBind();
        }
        protected void gvPaciente_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvPaciente.PageIndex = e.NewPageIndex;
            CargarGridView();
        }

        protected void AgregarPaciente_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(tbBusqueda.Text))
            {
                if(ddlTipo.SelectedValue = "id_pac")
            }
        }
    }
}
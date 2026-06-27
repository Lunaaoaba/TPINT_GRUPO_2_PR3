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
                CargargarGridview();
            }
        }
        private void CargargarGridview()
        {
            NegocioMedico negocio = new NegocioMedico();
            gvMedicos.DataSource = negocio.obtenerTablaMedico();
            gvMedicos.DataBind();
        }
    }
}
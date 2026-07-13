using ENTIDADES;
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
        NegocioEspecialidad especialidad = new NegocioEspecialidad();
        NegocioLocalidades localidades = new NegocioLocalidades();
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
            Response.Redirect("~/Vistas/Admin/InicioAdmin.aspx");
        }

        protected void gvMedicos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMedicos.PageIndex = e.NewPageIndex;
            CargarGridview();
        }

        protected void btBuscar_Click(object sender, EventArgs e)
        {
            NegocioMedico negocio = new NegocioMedico();
            lblErrorBusqueda.Visible = false;
            lblErrorBusqueda.Text = "";
            string filtro = ddlTipo.SelectedValue;
            string ingreso = tbBusqueda.Text.Trim();
            if (string.IsNullOrWhiteSpace(ingreso))
            {
                ViewState["FiltroBusqueda"] = null;
                ViewState["TipoFiltro"] = null;
                CargarGridview();
                return;
            }
            if ((filtro == "id_med" || filtro == "dni_med") && !ingreso.All(char.IsDigit))
            {
                if (!ingreso.All(char.IsDigit))
                {
                    lblErrorBusqueda.Text = "Para buscar por ID o DNI debe ingresar únicamente números.";
                    lblErrorBusqueda.Visible = true;
                    return;
                }
            }
            ViewState["FiltroBusqueda"] = ingreso;
            ViewState["TipoFiltro"] = filtro;
            
            gvMedicos.DataSource = negocio.FiltrarMedicos(ingreso, filtro);
            gvMedicos.DataBind();
            tbBusqueda.Text = "";
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {


        }

        

        protected void EliminarMedico_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Vistas/Admin/AbmlMedico/EliminarMedico.aspx");
        }

        protected void AgregarMedico_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Vistas/Admin/AbmlMedico/AgregarMedico.aspx");
        }

        protected void gvMedicos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvMedicos.EditIndex = e.NewEditIndex;
            CargarGridview();
        }
    }
}
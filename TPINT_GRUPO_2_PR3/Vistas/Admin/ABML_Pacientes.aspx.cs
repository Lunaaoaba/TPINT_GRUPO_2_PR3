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
            lblMensaje.Visible = false;
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
        protected void gvPaciente_RowEditing(object sender, GridViewEditEventArgs e)
        {
            // revisar tmb por lo mencionado en el comentario de RowUpdating
            //gvPaciente.EditIndex = e.NewEditIndex;
            //CargarGridView();
        }

        protected void gvPaciente_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            // TARDA UNA BANDA ESTO NOSE PORQ, NO SE EJECUTA MAS LOCO 
            gvPaciente.EditIndex = -1;
            CargarGridView();
        }

        protected void gvPaciente_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow || (e.Row.RowState & DataControlRowState.Edit) == 0) return;

            DataRowView fila = (DataRowView)e.Row.DataItem;
            DropDownList ddlLoc = (DropDownList)e.Row.FindControl("ddl_eit_localidad");
            ddlLoc.DataSource = negocioLectura.obtenerLocalidades();
            ddlLoc.DataTextField = "nombre_loc";
            ddlLoc.DataValueField = "id_loc";
            ddlLoc.DataBind();
            ddlLoc.SelectedValue = fila["id_loc"].ToString();

            DropDownList ddlSexo = (DropDownList)e.Row.FindControl("ddl_eit_sexo");
            ddlSexo.SelectedValue = fila["sexo_pac"].ToString();
        }

        protected void gvPaciente_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow fila = gvPaciente.Rows[e.RowIndex];
            int idPac = Convert.ToInt32(gvPaciente.DataKeys[e.RowIndex].Value);
            // agregar una redireccion a otro webform para facilidad de edicion
            // ya que no se puede editar el gridview por la cantidad de campos que tiene el paciente
            // muy util para replicar con medico y etc
        }

        // no anda, no sirve, rehacer esto
        protected void gvPaciente_RowCommand(object sender, GridViewCommandEventArgs e)
        {
                //agregar esto donde vaya -> OnClientClick = "return confirm('¿Eliminar paciente?');"
        }

        protected void AgregarPaciente_Click(object sender, EventArgs e)
        {

        }
    }
}
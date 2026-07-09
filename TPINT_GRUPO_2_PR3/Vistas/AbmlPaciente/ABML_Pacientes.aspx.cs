using NEGOCIO;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPINT_GRUPO_2_PR3.Vistas
{
    public partial class ABML_Pacientes : System.Web.UI.Page
    {
        NegocioPaciente negocioPaciente = new NegocioPaciente();
        NegocioLocalidades negocioLocalidad = new NegocioLocalidades();

        protected void Page_Load(object sender, EventArgs e)
        {
            CargarGridView();
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
            gvPaciente.EditIndex = e.NewEditIndex;
            CargarGridView();
        }

        protected void gvPaciente_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvPaciente.EditIndex = -1;
            CargarGridView();
        }

        protected void gvPaciente_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow || (e.Row.RowState & DataControlRowState.Edit) == 0) return;

            DataRowView fila = (DataRowView)e.Row.DataItem;

            DropDownList ddlLoc = (DropDownList)e.Row.FindControl("ddl_localidad");
            ddlLoc.DataSource = negocioLocalidad.obtenerLocalidades();
            ddlLoc.DataTextField = "nombre_loc";
            ddlLoc.DataValueField = "id_loc";
            ddlLoc.DataBind();
            ddlLoc.SelectedValue = fila["id_loc"].ToString();

            DropDownList ddlSexo = (DropDownList)e.Row.FindControl("ddl_sexo");
            ddlSexo.SelectedValue = fila["sexo_pac"].ToString();
        }

        protected void gvPaciente_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow fila = gvPaciente.Rows[e.RowIndex];
            int idPac = Convert.ToInt32(gvPaciente.DataKeys[e.RowIndex].Value);

            string dni = ((Label)fila.FindControl("lbl_dni")).Text;
            string nombre = ((TextBox)fila.FindControl("txt_nombre")).Text;
            string apellido = ((TextBox)fila.FindControl("txt_apellido")).Text;
            char sexo = Convert.ToChar(((DropDownList)fila.FindControl("ddl_sexo")).SelectedValue);
            string nacionalidad = ((TextBox)fila.FindControl("txt_nacionalidad")).Text;
            DateTime fechaNac = Convert.ToDateTime(((TextBox)fila.FindControl("txt_fechaNac")).Text);
            string direccion = ((TextBox)fila.FindControl("txt_direccion")).Text;
            int idLoc = Convert.ToInt32(((DropDownList)fila.FindControl("ddl_localidad")).SelectedValue);
            string email = ((TextBox)fila.FindControl("txt_email")).Text;
            string telefono = ((TextBox)fila.FindControl("txt_telefono")).Text;

            negocioPaciente.ModificarPaciente(idPac, dni, nombre, apellido, sexo, nacionalidad, fechaNac, direccion, idLoc, email, telefono);

            gvPaciente.EditIndex = -1;
            CargarGridView();
        }

        protected void AgregarPaciente_Click(object sender, EventArgs e)
        {
            Response.Redirect("Agregar_Paciente.aspx");
        }

        protected void EliminarPaciente_Click(object sender, EventArgs e)
        {
            Response.Redirect("Eliminar_Paciente.aspx");
        }

        protected void btBuscar_Click(object sender, EventArgs e)
        {
            string filtro = ddlTipo.SelectedValue;
            cvBusquedaID.Enabled = (filtro == "id_pac");
            cvBusquedaDNI.Enabled = (filtro == "dni_pac");
            Page.Validate("grupoBuscar");
            if (!Page.IsValid) return;

            if (string.IsNullOrWhiteSpace(tbBusqueda.Text)) CargarGridView();
            else
            {
                gvPaciente.DataSource = negocioPaciente.FiltrarPacientes(tbBusqueda.Text.Trim(), ddlTipo.SelectedValue);
                gvPaciente.DataBind();
            }
            tbBusqueda.Text = "";
        }
    }
}
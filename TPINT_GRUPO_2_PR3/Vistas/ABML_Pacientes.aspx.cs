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
            gvPaciente.EditIndex = e.NewEditIndex;
            CargarGridView();
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

            string dni = ((TextBox)fila.FindControl("txt_eit_dni")).Text;
            string nombre = ((TextBox)fila.FindControl("txt_eit_nombre")).Text;
            string apellido = ((TextBox)fila.FindControl("txt_eit_apellido")).Text;
            char sexo = Convert.ToChar(((DropDownList)fila.FindControl("ddl_eit_sexo")).SelectedValue);
            string nacionalidad = ((TextBox)fila.FindControl("txt_eit_nacionalidad")).Text;
            // DATETIME NECESITA ALGUN TIPO DE VALIDACION
            DateTime fechaNac = Convert.ToDateTime(((TextBox)fila.FindControl("txt_eit_fechaNac")).Text);
            string direccion = ((TextBox)fila.FindControl("txt_eit_direccion")).Text;
            int idLoc = Convert.ToInt32(((DropDownList)fila.FindControl("ddl_eit_localidad")).SelectedValue);
            string email = ((TextBox)fila.FindControl("txt_eit_email")).Text;
            string telefono = ((TextBox)fila.FindControl("txt_eit_telefono")).Text;

            if (!negocioPaciente.ModificarPaciente(idPac, dni, nombre, apellido, sexo, nacionalidad, fechaNac, direccion, idLoc, email, telefono))
            {
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                lblMensaje.Visible = true;
                lblMensaje.Text = "Error al actualizar el paciente.";
            }
            else
            {
                lblMensaje.ForeColor = System.Drawing.Color.Green;
                lblMensaje.Visible = true;
                lblMensaje.Text = "Paciente actualizado correctamente.";
                gvPaciente.EditIndex = -1;
                CargarGridView();

            }
        }

        // no anda, no sirve, rehacer esto
        protected void gvPaciente_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EliminarCustom")
            {
                int idPac = Convert.ToInt32(e.CommandArgument);

                if (Session["ConfirmandoBorrado"] != null && (int)Session["ConfirmandoBorrado"] != idPac) Session["ConfirmandoBorrado"] = null;
                if (Session["ConfirmandoBorrado"] == null)
                {
                    Session["ConfirmandoBorrado"] = idPac;
                    lblMensaje.Text = "¿Estás seguro? Presiona Eliminar nuevamente para confirmar.";
                    lblMensaje.ForeColor = System.Drawing.Color.Orange;
                    lblMensaje.Visible = true;
                }
                else
                {
                    negocioPaciente.EliminarPaciente((int)Session["ConfirmandoBorrado"]);
                    Session["ConfirmandoBorrado"] = null;
                    lblMensaje.Text = "Paciente eliminado correctamente.";
                    lblMensaje.ForeColor = System.Drawing.Color.Green;
                    lblMensaje.Visible = true;
                    CargarGridView();
                }
            }
            else return;
        }

        protected void AgregarPaciente_Click(object sender, EventArgs e)
        {

        }
    }
}
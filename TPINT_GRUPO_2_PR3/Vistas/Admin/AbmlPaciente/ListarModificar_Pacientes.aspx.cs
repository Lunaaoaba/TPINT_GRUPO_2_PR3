using NEGOCIO;
using System;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPINT_GRUPO_2_PR3.Vistas
{
    public partial class ListarModificar_Pacientes : System.Web.UI.Page
    {
        NegocioPaciente negocioPaciente = new NegocioPaciente();
        NegocioLocalidades negocioLocalidad = new NegocioLocalidades();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarGridView();
            }
        }

        private void CargarGridView()
        {
            gvPaciente.DataSource = negocioPaciente.obtenerTablaPaciente();
            gvPaciente.DataBind();
        }

        protected void gvPaciente_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvPaciente.PageIndex = e.NewPageIndex;
            if (ViewState["FiltroBusqueda"] != null && ViewState["TipoFiltro"] != null)
            {
                string ingreso = ViewState["FiltroBusqueda"].ToString();
                string filtro = ViewState["TipoFiltro"].ToString();

                gvPaciente.DataSource = negocioPaciente.FiltrarPacientes(ingreso, filtro);
                gvPaciente.DataBind();
            }
            else CargarGridView();
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

            DropDownList ddlSexo = (DropDownList)e.Row.FindControl("ddl_sexo");
            ddlSexo.SelectedValue = fila["sexo_pac"].ToString();

            DropDownList ddlNac = (DropDownList)e.Row.FindControl("ddl_nacionalidad");
            ddlSexo.SelectedValue = fila["nacionalidad_pac"].ToString();

            // agregar nacionalidad tipo datetime

            DropDownList ddlLoc = (DropDownList)e.Row.FindControl("ddl_localidad");
            ddlLoc.DataSource = negocioLocalidad.obtenerLocalidades();
            ddlLoc.DataTextField = "nombre_loc";
            ddlLoc.DataValueField = "id_loc";
            ddlLoc.DataBind();
            ddlLoc.SelectedValue = fila["id_loc"].ToString();


        }

        protected void gvPaciente_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow fila = gvPaciente.Rows[e.RowIndex];
            int idPac = Convert.ToInt32(gvPaciente.DataKeys[e.RowIndex].Value);

            string dni = ((Label)fila.FindControl("lbl_dni")).Text.Trim();
            string nombre = ((TextBox)fila.FindControl("txt_nombre")).Text.Trim();
            string apellido = ((TextBox)fila.FindControl("txt_apellido")).Text.Trim();
            char sexo = Convert.ToChar(((DropDownList)fila.FindControl("ddl_sexo")).SelectedValue);
            string nacionalidad = Convert.ToString(((DropDownList)fila.FindControl("ddl_nacionalidad")).SelectedValue);
            DateTime fechaNac = Convert.ToDateTime(((TextBox)fila.FindControl("txt_fechaNac")).Text.Trim());
            string direccion = ((TextBox)fila.FindControl("txt_direccion")).Text.Trim();
            int idLoc = Convert.ToInt32(((DropDownList)fila.FindControl("ddl_localidad")).SelectedValue);
            string email = ((TextBox)fila.FindControl("txt_email")).Text.Trim();
            string telefono = ((TextBox)fila.FindControl("txt_telefono")).Text.Trim();

            negocioPaciente.ModificarPaciente(idPac, dni, nombre, apellido, sexo, nacionalidad, fechaNac, direccion, idLoc, email, telefono);

            gvPaciente.EditIndex = -1;
            CargarGridView();
        }

        protected void AgregarPaciente_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Vistas/Admin/AbmlPaciente/Agregar_Paciente.aspx");
        }

        protected void EliminarPaciente_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Vistas/Admin/AbmlPaciente/Eliminar_Paciente.aspx");
        }

        protected void btBuscar_Click(object sender, EventArgs e)
        {
            // actualmente: ID-DNI-NOMBRE-APELLIDO
            // me faltaria agregar SEXO-NACIONALIDAD-F.NACIMIENTO-DIRECCION-LOCALIDAD
            // basicamente todo menos email y telefono ya q no lo veo necesario
            lblErrorBusqueda.Visible = false;
            lblErrorBusqueda.Text = "";
            string filtro = ddlTipo.SelectedValue;
            string ingreso = tbBusqueda.Text.Trim();
            if (string.IsNullOrWhiteSpace(ingreso))
            {
                ViewState["FiltroBusqueda"] = null;
                ViewState["TipoFiltro"] = null;
                CargarGridView();
                return;
            }
            if ((filtro == "id_pac" || filtro == "dni_pac") && !ingreso.All(char.IsDigit))
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

            gvPaciente.DataSource = negocioPaciente.FiltrarPacientes(ingreso, filtro);
            gvPaciente.DataBind();
            tbBusqueda.Text = "";
        }
    }
}
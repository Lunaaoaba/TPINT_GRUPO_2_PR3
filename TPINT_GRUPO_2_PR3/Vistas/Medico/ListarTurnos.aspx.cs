using NEGOCIO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPINT_GRUPO_2_PR3.Vistas.Medico
{
    public partial class ListarTurnos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMensaje.Visible = false;
                CargarGridview();
            }
        }

        private void CargarGridview()
        {
            if (Session["Usuario"] == null)
            {
                Response.Redirect("~/Vistas/Login.aspx");
                return;
            }

            string username = Session["Usuario"].ToString();
            NegocioMedico negocioMed = new NegocioMedico();
            int idMed = negocioMed.ObtenerMedicoIdPorUsername(username);
            if (idMed <= 0)
            {
                lblMensaje.Text = "No se encontró el médico asociado al usuario.";
                lblMensaje.Visible = true;
                gvTurnos.DataSource = null;
                gvTurnos.DataBind();
                return;
            }

            NegocioTurno negocioTurno = new NegocioTurno();

            if (ViewState["FiltroBusqueda"] != null && ViewState["TipoFiltro"] != null)
            {
                string ingreso = ViewState["FiltroBusqueda"].ToString();
                string filtro = ViewState["TipoFiltro"].ToString();
                string estado = ViewState["FiltroEstado"] != null ? ViewState["FiltroEstado"].ToString() : "Todos";

                gvTurnos.DataSource = negocioTurno.FiltrarTurnos(idMed, ingreso, filtro, estado);
                gvTurnos.DataBind();
                return;
            }

            string estadoSel = ddlEstado.SelectedValue;
            if (!string.IsNullOrWhiteSpace(estadoSel) && estadoSel != "Todos")
            {
                gvTurnos.DataSource = negocioTurno.FiltrarTurnos(idMed, null, null, estadoSel);
            }
            else
            {
                gvTurnos.DataSource = negocioTurno.ObtenerTurnosPorMedico(idMed);
            }
            gvTurnos.DataBind();
        }

        protected void gvTurnos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvTurnos.EditIndex = e.NewEditIndex;
            CargarGridview();
        }

        protected void gvTurnos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvTurnos.EditIndex = -1;
            CargarGridview();
        }

        protected void gvTurnos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvTurnos.DataKeys[e.RowIndex].Value);
            GridViewRow fila = gvTurnos.Rows[e.RowIndex];

            DropDownList ddlEstado = (DropDownList)fila.FindControl("ddlEstadoEdit");
            TextBox txtObs = (TextBox)fila.FindControl("txtObservacionEdit");

            string estado = ddlEstado?.SelectedValue ?? "PENDIENTE";
            string obs = txtObs?.Text.Trim() ?? string.Empty;

            if (Session["Usuario"] == null)
            {
                Response.Redirect("~/Vistas/Login.aspx");
                return;
            }

            string username = Session["Usuario"].ToString();
            NegocioMedico negocioMed = new NegocioMedico();
            int idMed = negocioMed.ObtenerMedicoIdPorUsername(username);

            NegocioTurno negocioTurno = new NegocioTurno();
            if (!negocioTurno.PerteneceTurnoAMedico(id, idMed))
            {
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                lblMensaje.Text = "No tiene permisos para modificar este turno.";
                gvTurnos.EditIndex = -1;
                CargarGridview();
                return;
            }

            bool exito = negocioTurno.ModificarTurno(id, estado, obs);

            lblMensaje.ForeColor = exito ? System.Drawing.Color.Green : System.Drawing.Color.Red;
            lblMensaje.Text = exito ? "Turno actualizado correctamente." : "No se pudo actualizar el turno.";

            gvTurnos.EditIndex = -1;
            CargarGridview();
        }

        protected void gvTurnos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow) return;

            if ((e.Row.RowState & DataControlRowState.Edit) != 0)
            {
                var dataItem = e.Row.DataItem as DataRowView;
                string estado = "PENDIENTE";
                string observacion = string.Empty;

                if (dataItem != null)
                {
                    if (dataItem.Row.Table.Columns.Contains("estado_tur"))
                        estado = dataItem["estado_tur"]?.ToString() ?? "PENDIENTE";
                    if (dataItem.Row.Table.Columns.Contains("observacion_tur"))
                        observacion = dataItem["observacion_tur"]?.ToString() ?? string.Empty;
                }

                DropDownList ddl = (DropDownList)e.Row.FindControl("ddlEstadoEdit");
                if (ddl != null)
                {
                    var item = ddl.Items.FindByValue(estado);
                    if (item != null) ddl.SelectedValue = estado;
                    else ddl.SelectedIndex = 0;
                }

                TextBox txt = (TextBox)e.Row.FindControl("txtObservacionEdit");
                if (txt != null)
                {
                    txt.Text = observacion;
                    if (txt.MaxLength == 0) txt.MaxLength = 500;
                }
            }
        }

        protected void btBuscar_Click(object sender, EventArgs e)
        {
            lblErrorBusqueda.Visible = false;
            lblErrorBusqueda.Text = "";

            string filtro = ddlTipo.SelectedValue;
            string ingreso = tbBusqueda.Text.Trim();
            string estado = ddlEstado.SelectedValue;

            if (string.IsNullOrWhiteSpace(ingreso))
            {
                ViewState["FiltroBusqueda"] = null;
                ViewState["TipoFiltro"] = null;
                ViewState["FiltroEstado"] = null;
                CargarGridview();
                return;
            }

            if ((filtro == "dni_pac") && !ingreso.All(char.IsDigit))
            {
                lblErrorBusqueda.Text = "Para buscar por DNI debe ingresar únicamente números.";
                lblErrorBusqueda.Visible = true;
                return;
            }

            ViewState["FiltroBusqueda"] = ingreso;
            ViewState["TipoFiltro"] = filtro;
            ViewState["FiltroEstado"] = estado;

            string username = Session["Usuario"]?.ToString();
            if (username == null)
            {
                Response.Redirect("~/Vistas/Login.aspx");
                return;
            }

            NegocioMedico negocioMed = new NegocioMedico();
            int idMed = negocioMed.ObtenerMedicoIdPorUsername(username);
            NegocioTurno negocioTurno = new NegocioTurno();

            gvTurnos.DataSource = negocioTurno.FiltrarTurnos(idMed, ingreso, filtro, estado);
            gvTurnos.DataBind();

            tbBusqueda.Text = "";
        }

        protected void btLimpiar_Click(object sender, EventArgs e)
        {
            ddlEstado.SelectedValue = "Todos";
            tbBusqueda.Text = string.Empty;
            ViewState["FiltroBusqueda"] = null;
            ViewState["TipoFiltro"] = null;
            ViewState["FiltroEstado"] = null;
            CargarGridview();
        }

        protected void gvTurnos_PageIndexChanging(object sender, System.Web.UI.WebControls.GridViewPageEventArgs e)
        {
            gvTurnos.PageIndex = e.NewPageIndex;
            CargarGridview();
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Vistas/Medico/InicioMedico.aspx");
        }
    }
}
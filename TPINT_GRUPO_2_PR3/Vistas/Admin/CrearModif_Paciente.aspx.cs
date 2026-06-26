using ENTIDADES;
using NEGOCIO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPINT_GRUPO_2_PR3.Vistas.Admin
{
    public partial class CrearModif_Paciente : System.Web.UI.Page
    {
        NegocioPaciente negocioPaciente = new NegocioPaciente();
        NegocioLectura negocioLectura = new NegocioLectura();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarProvincias();

                string idQuery = Request.QueryString["id_pac"];
                if (!string.IsNullOrEmpty(idQuery))
                {
                    int idPac = Convert.ToInt32(idQuery);
                    ViewState["id_pac"] = idPac;
                    lblTitulo.Text = "Modificar Paciente";
                    CargarDatosPaciente(idPac);
                }
                else
                {
                    ViewState["id_pac"] = null;
                    lblTitulo.Text = "Alta de Paciente";
                    CargarLocalidadesPorProvincia(Convert.ToInt32(ddlProvincia.SelectedValue));
                }
            }
        }

        private void CargarProvincias()
        {
            ddlProvincia.DataSource = negocioLectura.obtenerProvincias();
            ddlProvincia.DataTextField = "nombre_pro";
            ddlProvincia.DataValueField = "id_pro";
            ddlProvincia.DataBind();
        }

        private void CargarLocalidadesPorProvincia(int idProvincia)
        {
            ddlLocalidad.DataSource = negocioLectura.obtenerLocalidadesPorProvincia(idProvincia);
            ddlLocalidad.DataTextField = "nombre_loc";
            ddlLocalidad.DataValueField = "id_loc";
            ddlLocalidad.DataBind();
        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarLocalidadesPorProvincia(Convert.ToInt32(ddlProvincia.SelectedValue));
        }

        private void CargarDatosPaciente(int idPac)
        {
            Paciente p = new Paciente(idPac);
            DataTable dt = negocioPaciente.obtenerTablaPacientePorId(p);
            if (dt.Rows.Count == 0) return;
            DataRow fila = dt.Rows[0];

            txtDni.Text = fila["dni_pac"].ToString();
            txtNombre.Text = fila["nombre_pac"].ToString();
            txtApellido.Text = fila["apellido_pac"].ToString();
            ddlSexo.SelectedValue = fila["sexo_pac"].ToString();
            txtNacionalidad.Text = fila["nacionalidad_pac"].ToString();
            txtFechaNac.Text = Convert.ToDateTime(fila["fecha_nacimiento_pac"]).ToString("yyyy-MM-dd");
            txtDireccion.Text = fila["direccion_pac"].ToString();
            txtEmail.Text = fila["email_pac"].ToString();
            txtTelefono.Text = fila["telefono_pac"].ToString();

            int idLoc = Convert.ToInt32(fila["id_loc"]);

            // buscar provincia de esa localidad para preseleccionar el combo en cascada
            DataTable localidades = negocioLectura.obtenerLocalidades();
            DataRow[] filaLoc = localidades.Select("id_loc = " + idLoc);
            if (filaLoc.Length > 0)
            {
                int idPro = Convert.ToInt32(filaLoc[0]["id_pro"]);
                ddlProvincia.SelectedValue = idPro.ToString();
                CargarLocalidadesPorProvincia(idPro);
                ddlLocalidad.SelectedValue = idLoc.ToString();
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            string mensaje;
            bool ok;
            char sexo = Convert.ToChar(ddlSexo.SelectedValue);
            DateTime fechaNac = Convert.ToDateTime(txtFechaNac.Text);
            int idLoc = Convert.ToInt32(ddlLocalidad.SelectedValue);

            if (ViewState["id_pac"] != null)
            {
                int idPac = (int)ViewState["id_pac"];
                ok = negocioPaciente.ModificarPaciente(idPac, txtDni.Text, txtNombre.Text, txtApellido.Text, sexo, txtNacionalidad.Text, fechaNac, txtDireccion.Text, idLoc, txtEmail.Text, txtTelefono.Text, out mensaje);
            }
            else
            {
                ok = negocioPaciente.AgregarPaciente(txtDni.Text, txtNombre.Text, txtApellido.Text, sexo, txtNacionalidad.Text, fechaNac, txtDireccion.Text, idLoc, txtEmail.Text, txtTelefono.Text, out mensaje);
            }

            lblMensaje.Visible = true;
            lblMensaje.Text = mensaje;
            lblMensaje.ForeColor = ok ? System.Drawing.Color.Green : System.Drawing.Color.Red;

            if (ok && ViewState["id_pac"] == null)
                LimpiarCampos();
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            LimpiarCampos();
        }

        private void LimpiarCampos()
        {
            txtDni.Text = "";
            txtNombre.Text = "";
            txtApellido.Text = "";
            ddlSexo.SelectedIndex = 0;
            txtNacionalidad.Text = "";
            txtFechaNac.Text = "";
            txtDireccion.Text = "";
            txtEmail.Text = "";
            txtTelefono.Text = "";
            ddlProvincia.SelectedIndex = 0;
            CargarLocalidadesPorProvincia(Convert.ToInt32(ddlProvincia.SelectedValue));
        }
    }
}
using NEGOCIO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPINT_GRUPO_2_PR3.Vistas.AbmlPaciente
{
    public partial class AgrMod_Paciente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarSexo();
                CargarNacionallidad();
                CargarLocalidades();
            }
        }

        private void CargarSexo()
        {
            ddlSexo.Items.Clear();
            ddlSexo.Items.Add(new ListItem("Masculino", "M"));
            ddlSexo.Items.Add(new ListItem("Femenino", "F"));
            ddlSexo.Items.Insert(0, new ListItem("-- Seleccione un sexo --", "0"));

        }
        private void CargarNacionallidad()
        {
            ddlNacionalidad.Items.Clear();
            ddlNacionalidad.Items.Add(new ListItem("Argentina", "Argentina"));
            ddlNacionalidad.Items.Add(new ListItem("Brasil", "Brasil"));
            ddlNacionalidad.Items.Add(new ListItem("Chile", "Chile"));
            ddlNacionalidad.Items.Add(new ListItem("Uruguay", "Uruguay"));
            ddlNacionalidad.Items.Add(new ListItem("Paraguay", "Paraguay"));
            ddlNacionalidad.Items.Add(new ListItem("Bolivia", "Bolivia"));
            ddlNacionalidad.Items.Insert(0, new ListItem("-- Seleccione una nacionalidad --", "0"));

        }
        private void CargarLocalidades()
        {
            NegocioLocalidades negocio = new NegocioLocalidades();
            ddlLocalidad.DataSource = negocio.obtenerLocalidades();
            ddlLocalidad.DataTextField = "nombre_loc";
            ddlLocalidad.DataValueField = "id_loc";
            ddlLocalidad.DataBind();
            ddlLocalidad.Items.Insert(0, new ListItem("-- Seleccione una localidad --", "0"));
        }

        private void LimpiarCampos()
        { 
            txtDNI.Text = string.Empty;
            txtNombrePaciente.Text = string.Empty;
            txtApellidoPaciente.Text = string.Empty;
            ddlSexo.SelectedIndex = 0;
            ddlNacionalidad.SelectedIndex = 0;
            txtFechaNacimiento.Text = string.Empty;
            txtDireccion.Text = string.Empty;
            ddlLocalidad.SelectedIndex = 0;
            txtEmail.Text = string.Empty;
            txtTelefono.Text = string.Empty;    
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            NegocioPaciente negocio = new NegocioPaciente();

            string dni = txtDNI.Text;
            string nombre = txtNombrePaciente.Text;
            string apellido = txtApellidoPaciente.Text;
            char sexo = Convert.ToChar(ddlSexo.SelectedValue);
            string nacionalidad = ddlNacionalidad.SelectedValue;
            DateTime fechaNacimiento = Convert.ToDateTime(txtFechaNacimiento.Text);
            string direccion = txtDireccion.Text;
            int idLocalidad = Convert.ToInt32(ddlLocalidad.SelectedValue);
            string email = txtEmail.Text;
            string telefono = txtTelefono.Text;

            bool exito = negocio.AgregarPaciente(dni, nombre, apellido, sexo, nacionalidad, fechaNacimiento, direccion, idLocalidad, email, telefono);
            if (exito)
            {
                lblExito.Text = "Paciente agregado correctamente.";
                lblExito.Visible = true;
                LimpiarCampos();
            }
            else
            {
                lblExito.Text = "Error al agregar el médico.";
                lblExito.Visible = true;
            }
        }
    }
}
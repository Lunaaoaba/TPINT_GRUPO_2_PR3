using ENTIDADES; 
using NEGOCIO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPINT_GRUPO_2_PR3.Vistas
{
    public partial class AgregarMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Cargar los datos iniciales 
                CargarEspecialidades();
                CargarLocalidades();
                CargarSexo();
                CargarNacionallidad();

            }
        }
        private void CargarEspecialidades()
        {
            NegocioEspecialidad negocio = new NegocioEspecialidad();
            ddlEspecialidad.DataSource = negocio.ObtenerEspecialidades();
            ddlEspecialidad.DataTextField = "nombre_esp";
            ddlEspecialidad.DataValueField = "Id_esp";
            ddlEspecialidad.DataBind();

            ddlEspecialidad.Items.Insert(0, new ListItem("-- Seleccione una especialidad --", "0")); 
        }
        private void CargarLocalidades()
        {
            NegocioLocalidades negocio = new NegocioLocalidades();
            ddlLocalidad.DataSource = negocio.ObtenerLocalidades();
            ddlLocalidad.DataTextField = "nombre_loc";
            ddlLocalidad.DataValueField = "id_loc";
            ddlLocalidad.DataBind();
            ddlLocalidad.Items.Insert(0, new ListItem("-- Seleccione una localidad --", "0")); 
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

        private void LimpiarCampos()
        {
            txtNombreMedico.Text = "";
            txtApellidoMedico.Text = "";
            txtDNI.Text = "";
            txtFechaNacimiento.Text = "";
            ddlLocalidad.SelectedIndex = 0;
            ddlEspecialidad.SelectedIndex = 0;
            ddlNacionalidad.SelectedIndex = 0;
            ddlSexo.SelectedIndex = 0;
            txtDireccion.Text = "";
            txtEmail.Text = "";
            txtTelefono.Text = "";
            txtNombreUsuarioMed.Text = "";
            txtContraseñaMed.Text = "";
            txtRepetirContraseñaMed.Text = "";
        }

      

        protected void btnAceptar_Click1(object sender, EventArgs e)
        {

            string nombre = txtNombreMedico.Text;
            string apellido = txtApellidoMedico.Text;
            string dni = txtDNI.Text;
            string legajo = txtLegajo.Text;
            DateTime fechaNacimiento = Convert.ToDateTime(txtFechaNacimiento.Text);
            int idLocalidad = Convert.ToInt32(ddlLocalidad.SelectedValue);
            int especialidad = Convert.ToInt32(ddlEspecialidad.SelectedValue);
            string nacionalidad = ddlNacionalidad.SelectedValue;
            char sexo = Convert.ToChar(ddlSexo.SelectedValue);
            string direccion = txtDireccion.Text;
            string email = txtEmail.Text;
            string telefono = txtTelefono.Text;

            if (txtContraseñaMed.Text != txtRepetirContraseñaMed.Text)
            {
                mensajeContraseñas.Text = "Las contraseñas no coinciden.";
                mensajeContraseñas.Visible = true;
                return;
            }
            NegocioMedico negocio = new NegocioMedico();
            NegocioUsuario negocioUsuario = new NegocioUsuario();
            int idUsuario = negocioUsuario.AgregarUsuario(txtNombreUsuarioMed.Text, txtContraseñaMed.Text);


            bool exito = negocio.AgregarMedico(dni, nombre, apellido, sexo, nacionalidad, fechaNacimiento, direccion, idLocalidad, email, telefono, legajo, especialidad, idUsuario, true);
            if (exito)
            {
                lblExito.Text = "Médico agregado correctamente.";
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

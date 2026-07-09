using ENTIDADES;
using NEGOCIO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPINT_GRUPO_2_PR3.Vistas.AbmlMedico
{
    public partial class ModificarMedico : System.Web.UI.Page
    {
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
            gvMedicosModificar.DataSource = negocio.obtenerTablaMedico();
            gvMedicosModificar.DataBind();
        }

        protected void btnVolverModificar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Vistas/Admin/AbmlMedico/ABML_Medico.aspx");
        }

        protected void gvMedicosModificar_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMedicosModificar.PageIndex = e.NewPageIndex;
            CargarGridview();
        }

        protected void gvMedicosModificar_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvMedicosModificar.EditIndex = e.NewEditIndex;
            CargarGridview();
        }

        protected void gvMedicosModificar_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvMedicosModificar.EditIndex = -1;
            CargarGridview();
        }

        protected void gvMedicosModificar_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string idMedico = ((Label)gvMedicosModificar.Rows[e.RowIndex].FindControl("lbl_Edit_IDMedico")).Text;
            string dni = ((Label)gvMedicosModificar.Rows[e.RowIndex].FindControl("lbl_Edit_DNI")).Text;
            string nombre = ((TextBox)gvMedicosModificar.Rows[e.RowIndex].FindControl("txt_Edit_Nombre")).Text;
            string apellido = ((TextBox)gvMedicosModificar.Rows[e.RowIndex].FindControl("txt_Edit_Apellido")).Text;
            string legajo = ((TextBox)gvMedicosModificar.Rows[e.RowIndex].FindControl("txt_Edit_Legajo")).Text;
            string sexo = ((TextBox)gvMedicosModificar.Rows[e.RowIndex].FindControl("txt_Edit_Sexo")).Text;
            string nacionalidad = ((TextBox)gvMedicosModificar.Rows[e.RowIndex].FindControl("txt_Edit_Nacionalidad")).Text;
            string fechaNac = ((TextBox)gvMedicosModificar.Rows[e.RowIndex].FindControl("txt_Edit_FNacimiento")).Text;
            string direccion = ((TextBox)gvMedicosModificar.Rows[e.RowIndex].FindControl("txt_Edit_Direccion")).Text;
            string email = ((TextBox)gvMedicosModificar.Rows[e.RowIndex].FindControl("txt_Edit_Email")).Text;
            string telefono = ((TextBox)gvMedicosModificar.Rows[e.RowIndex].FindControl("txt_Edit_Telefono")).Text;
            string idLocalidad = ((TextBox)gvMedicosModificar.Rows[e.RowIndex].FindControl("txt_Edit_Localidad")).Text;
            string idEspecialidad = ((TextBox)gvMedicosModificar.Rows[e.RowIndex].FindControl("txt_Edit_Especialidad")).Text;

            Medico medicoModificado = new Medico(Convert.ToInt32(idMedico), dni, nombre, apellido, sexo.ToCharArray()[0], nacionalidad, Convert.ToDateTime(fechaNac), direccion, new Localidad { id_loc = Convert.ToInt32(idLocalidad) }, email, telefono, legajo, new Especialidad { id_esp = Convert.ToInt32(idEspecialidad) }, new Usuario(), true);
            NegocioMedico negocio = new NegocioMedico();
            negocio.ActualizarMedico(medicoModificado);

            gvMedicosModificar.EditIndex = -1;
            CargarGridview();
        }
    }
}
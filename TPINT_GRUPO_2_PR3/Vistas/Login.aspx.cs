using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NEGOCIO;

namespace TPINT_GRUPO_2_PR3.Vistas
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblErrorEstaMal.Visible = false;
            }
        }

        protected void BtnSession_Click(object sender, EventArgs e)
        {
            NegocioUsuario negocio = new NegocioUsuario();
            DataTable dt = negocio.Login(txtUsuario.Text, txtContraseña.Text);

            if (dt.Rows.Count > 0)
            {
                Session["Usuario"] = dt.Rows[0]["username_usu"].ToString();
                Session["TipoUsuario"] = dt.Rows[0]["tipo_usu"].ToString();

                if (dt.Rows[0]["tipo_usu"].ToString() == "Admin")
                {
                    Response.Redirect("~/Vistas/Admin/InicioAdmin.aspx");
                }
                else
                {
                    Response.Redirect("~/Vistas/Medico/InicioMedico.aspx");
                }
            }
            else
            {
                lblErrorEstaMal.Visible = true;
            }

        }
    }
}
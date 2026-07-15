using ENTIDADES;
using NEGOCIO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPINT_GRUPO_2_PR3.Vistas.Admin.AbmlMedico
{
    public partial class AgregarHorariosMedicos : System.Web.UI.Page
    {

        NegocioMedico negocioMedico = new NegocioMedico();
        NegocioLocalidades NegocioLocalidades = new NegocioLocalidades();
        Medico medico = new Medico();
        NegocioHorarioMedico negociohorario = new NegocioHorarioMedico();
        HorarioMedico horario = new HorarioMedico();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMensaje.Visible = false;
                lbldia.Visible = false;
                lblInicioHora.Visible = false;

                ddlHoraConsulta.Visible = false;
                
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Vistas/Admin/AbmlMedico/MostrarMedico.aspx");
        }

        protected void btnAceptar_Click1(object sender, EventArgs e)
        {
            int idMedico = Convert.ToInt32(txtID.Text);
            TimeSpan horaInicio = TimeSpan.Parse(ddlHoraConsulta.SelectedValue);
            TimeSpan horaFin = TimeSpan.Parse(ddlFinHorario.SelectedValue);

            if (horaFin <= horaInicio)
            {
                lblExito.Text = "La hora de fin debe ser mayor que la hora de inicio.";
                lblExito.Visible = true;
                return;
            }

            int cantidad = 0;

            foreach (ListItem item in cxbDiasConsulta.Items)
            {
                if (item.Selected)
                {
                    int diaSeleccionado = Convert.ToInt32(item.Value);

                    int resultado = negociohorario.AgregarHorario(idMedico, diaSeleccionado, horaInicio, horaFin);

                    switch (resultado)
                    {
                        case 1:
                            cantidad++;
                            break;

                        case -1:
                            lblExito.Text = "El horario se superpone con otro horario existente.";
                            lblExito.Visible = true;
                            break;

                        case -2:
                            lblExito.Text = "Ese horario ya fue asignado al médico.";
                            lblExito.Visible = true;
                            break;
                    }
                }
            }

            if (cantidad > 0)
            {
                lblExito.Text = $"Se agregaron {cantidad} horario(s) correctamente.";
                lblExito.Visible = true;
                LimpiarCampos();
            }
        }
        private void LimpiarCampos()
        {
            txtID.Text = string.Empty;
            ddlHoraConsulta.SelectedIndex = 0;
            ddlFinHorario.SelectedIndex = 0;
            foreach(ListItem item in cxbDiasConsulta.Items)
            {
                item.Selected = false;
            }

            
            lblMensaje.Visible = false;
            lbldia.Visible = false;
            lblInicioHora.Visible = false;
            lblFinHora.Visible = false;
            ddlFinHorario.Visible = false;
            ddlHoraConsulta.Visible = false;
            gvMedicoSeleccionado.Visible = false;   
            cxbDiasConsulta.Visible = false;
        }

        

        private void CargarHoraConsulta()
        {
            ddlHoraConsulta.Items.Clear();
            for (int hora = 7; hora < 20; hora++)
            {
                    string horaFormateada = $"{hora:D2}:00";
                    ddlHoraConsulta.Items.Add(new ListItem(horaFormateada, horaFormateada));
                
            }
            ddlHoraConsulta.Items.Insert(0, new ListItem("-- Seleccione una hora --", "0"));
        } 
        private void CargarFinHorario()
        {
            ddlFinHorario.Items.Clear();
            for (int hora = 8; hora < 21; hora++)
            {
           
                    string horaFormateada = $"{hora:D2}:00";
                    ddlFinHorario.Items.Add(new ListItem(horaFormateada, horaFormateada));
                
            }
            ddlFinHorario.Items.Insert(0, new ListItem("-- Seleccione una hora --", "0"));
        }
        private void CargarGridview()
        {
            if (int.TryParse(txtID.Text, out int id_med))
            {
                medico.id_med = id_med;
                gvMedicoSeleccionado.DataSource = negocioMedico.obtenerTablaMedicoPorId(medico);
                gvMedicoSeleccionado.DataBind();

               
                CargarHoraConsulta();
                CargarFinHorario();


            }
            else
            {
                gvMedicoSeleccionado.DataSource = null;
                gvMedicoSeleccionado.DataBind();
                mensaje("No se pudo encontrar el médico");
            }

        }

        protected void btn_Buscar_Medico_Click(object sender, EventArgs e)
        {
            CargarGridview();
            lbldia.Visible = true;
            lblInicioHora.Visible = true;
            lblFinHora.Visible = true;
            cxbDiasConsulta.Visible = true;
            ddlHoraConsulta.Visible = true;
            ddlFinHorario.Visible = true;
            gvMedicoSeleccionado.Visible = true;
        }

        private void mensaje(string mensaje)
        {
            lblMensaje.Visible = true;
            lblMensaje.Text = mensaje;
        }
    }
}


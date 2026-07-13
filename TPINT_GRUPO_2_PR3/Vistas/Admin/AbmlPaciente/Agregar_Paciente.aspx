<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Agregar_Paciente.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.Vistas.AbmlPaciente.Agregar_Paciente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title></title>

<style>
    body {
        background-color: #277343;
        justify-content: center;
        align-items: center;
        display: flex;
    }

    .tamanioBoton {
        width: 200px;
        height: 25px;
    }

    #contenedor {
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: white !important;
        width: max-content;
        padding: 20px 30px;
        border-radius: 8px;
        box-sizing: border-box;
        margin: 0 auto;
    }

    .auto-style1 {
        height: 29px;
    }
    .auto-style2 {
        width: 4px;
    }
    .auto-style3 {
        height: 29px;
        width: 4px;
    }
    .auto-style4 {
        height: 23px;
    }
    .auto-style5 {
        width: 4px;
        height: 23px;
    }
    .auto-style6 {
    }
    .auto-style7 {
        width: 4px;
        height: 26px;
    }
    .auto-style8 {
        height: 30px;
    }
    .auto-style9 {
        width: 4px;
        height: 30px;
    }
</style>
</head>
<body>
<form id="form1" runat="server">
    <div id="contenedor">
        <div>
            <table class="tablaHL">
                <tr>
                    <td class="tdHL">
                        <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label>
                    </td>
                    <td class="tdHL">
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <br />
        <div>
            <table>
                <tr>
                    <td colspan="3">
                        <h1 align="center">Agregar Paciente</h1>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblDNI" runat="server" Text="DNI :"></asp:Label></td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:TextBox ID="txtDNI" runat="server" ValidationGroup="grupo1" Width="95px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDNI" runat="server" ControlToValidate="txtDNI"
                            ErrorMessage="Ingrese DNI" Text="*" ForeColor="Red" Display="Dynamic" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revDNI" runat="server" ControlToValidate="txtDNI" ErrorMessage="DNI inválido (7-8 dígitos)" Text="*" ForeColor="Red" Display="Dynamic" ValidationExpression="^\d{7,8}$" ValidationGroup="grupo1"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblNombrePaciente" runat="server" Text="Nombre:"></asp:Label></td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:TextBox ID="txtNombrePaciente" runat="server" ValidationGroup="grupo1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombrePaciente" ErrorMessage="Ingrese nombre" Text="*" ForeColor="Red" Display="Dynamic" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblApellidoPaciente" runat="server" Text="Apellido :"></asp:Label></td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:TextBox ID="txtApellidoPaciente" runat="server" ValidationGroup="grupo1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellidoPaciente" ErrorMessage="Ingrese apellido" Text="*" ForeColor="Red" Display="Dynamic" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4"><asp:Label ID="Sexo" runat="server" Text="Sexo :"></asp:Label></td>
                    <td class="auto-style5"></td>
                    <td class="auto-style4">
                        <asp:DropDownList ID="ddlSexo" runat="server" ValidationGroup="grupo1"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvSexo" runat="server" ControlToValidate="ddlSexo" ErrorMessage="Seleccione sexo" Text="*" ForeColor="Red" InitialValue="0" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="Nacionalidad" runat="server" Text="Nacionalidad :"></asp:Label></td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:DropDownList ID="ddlNacionalidad" runat="server" ValidationGroup="grupo1"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server" ControlToValidate="ddlNacionalidad" ErrorMessage="Seleccione nacionalidad" Text="*" ForeColor="Red" InitialValue="0" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblFechaNacimiento" runat="server" Text="Fecha de Nacimiento :"></asp:Label></td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:TextBox ID="txtFechaNacimiento" runat="server" TextMode="Date" ValidationGroup="grupo1" Width="100px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFechaNacimiento" runat="server" ControlToValidate="txtFechaNacimiento" ErrorMessage="Ingrese fecha" Text="*" ForeColor="Red" Display="Dynamic" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblDireccion" runat="server" Text="Direccion :"></asp:Label></td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:TextBox ID="txtDireccion" runat="server" ValidationGroup="grupo1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="Ingrese dirección" Text="*" ForeColor="Red" Display="Dynamic" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1"><asp:Label ID="lblLocalidad" runat="server" Text="Localidad :"></asp:Label></td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="ddlLocalidad" runat="server" ValidationGroup="grupo1"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvLocalidad" runat="server" ControlToValidate="ddlLocalidad" ErrorMessage="Seleccione localidad" Text="*" ForeColor="Red" InitialValue="0" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblEmail" runat="server" Text="Email :"></asp:Label></td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" ValidationGroup="grupo1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Ingrese email" Text="*" ForeColor="Red" Display="Dynamic" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email inválido" Text="*" ForeColor="Red" Display="Dynamic" ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" ValidationGroup="grupo1"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblTelefono" runat="server" Text="Telefono :"></asp:Label></td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:TextBox ID="txtTelefono" runat="server" ValidationGroup="grupo1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono" ErrorMessage="Ingrese teléfono" Text="*" ForeColor="Red" Display="Dynamic" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revTelefono" runat="server" ControlToValidate="txtTelefono" ErrorMessage="Solo números" Text="*" ForeColor="Red" Display="Dynamic" ValidationExpression="^\d{8,15}$" ValidationGroup="grupo1"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8">
                        <asp:Label ID="lblExito" runat="server" Visible="False"></asp:Label>
                    </td>
                    <td class="auto-style9"></td>

                    <td class="auto-style8">
                        <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" Width="78px" OnClick="btnAceptar_Click" ValidationGroup="grupo1" />
                        <asp:ValidationSummary ID="vsErrores" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="grupo1" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6" colspan="3">
                        <asp:Button ID="btnVolver" runat="server" OnClick="btnVolver_Click" Text="Volver" />
                    </td>
                </tr>
                </table>
        </div>
    </div>
</form>

</body>
</html>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarMedico.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.Vistas.AgregarMedico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Agregar Médico</title>
    <style>

body {
background-color: #277343;
font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
display: flex;
justify-content: center;
align-items: center;
min-height: 100vh;
margin: 0;
padding: 20px 0;
box-sizing: border-box;
}

#contenedor {
background-color: white !important;
width: max-content;
padding: 30px;
border-radius: 8px;
box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.15);
margin: 0 auto;
}

/*el h2 hace label barrita inferior que vemos en pantalla*/ 
h2 {
color: #277343;
text-align: center;
margin-top: 0;
margin-bottom: 25px;
font-size: 24px;
border-bottom: 2px solid #277343;
padding-bottom: 10px;
}

.tablaFormulario {
width: 100%;
border-collapse: collapse;
}

.tablaFormulario td {
padding: 8px 5px;
vertical-align: middle;
}

.col-label {
width: 30%;
text-align: right;
font-weight: 600;
color: #333;
padding-right: 15px !important;
}

.col-control {
width: 40%;
}

.col-validador {
width: 30%;
font-size: 12px;
color: #cc0000;
padding-left: 10px !important;
}

.tablaFormulario asp\:TextBox, 
.tablaFormulario asp\:DropDownList,
.tablaFormulario input[type="text"], 
.tablaFormulario input[type="password"], 
.tablaFormulario input[type="date"], 
.tablaFormulario select {
width: 100%;
padding: 6px;
border: 1px solid #ccc;
border-radius: 4px;
box-sizing: border-box;
}

.tablaFormulario select {
height: 31px;
}

.seccion-titulo {
text-align: center;
font-weight: bold;
color: #277343;
padding-top: 20px !important;
padding-bottom: 10px !important;
font-size: 16px;
text-transform: uppercase;
letter-spacing: 1px;
}

.fila-botones {
text-align: center;
padding-top: 20px !important;
}

.btn-aceptar {
background-color: #277343;
color: white;
border: none;
padding: 8px 25px;
font-size: 14px;
font-weight: bold;
border-radius: 4px;
cursor: pointer;
transition: background-color 0.2s;
}
.btn-aceptar:hover {
background-color: #1e5732;
}

.btn-volver {
    background-color: #f4f4f4;
    color: #555555;
    border: 1px solid #cccccc;
    padding: 8px 20px;
    font-size: 14px;
    font-weight: 500;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.2s;
    text-decoration: none;
    display: inline-block;
}

.btn-volver:hover {
    background-color: #e2e2e2;
    color: #333333;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="contenedor">
            <div style="text-align: center; margin-bottom: 15px;">
                <asp:Label ID="lblNombreUsuario" runat="server" Font-Italic="True" ForeColor="#555555"></asp:Label>
            </div>

            <h2>Agregar Médico</h2>
            
            <table class="tablaFormulario">
                <tr>
                    <td class="col-label">
                        <asp:Label ID="lblNombreMedico" runat="server" Text="Nombre:"></asp:Label>
                    </td>
                    <td class="col-control">
                        <asp:TextBox ID="txtNombreMedico" runat="server" ValidationGroup="grupo1"></asp:TextBox>
                    </td>
                    <td class="col-validador">
                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombreMedico" ErrorMessage="* Completar campo" Display="Dynamic" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="col-label">
                        <asp:Label ID="lblApellidoMedico" runat="server" Text="Apellido:"></asp:Label>
                    </td>
                    <td class="col-control">
                        <asp:TextBox ID="txtApellidoMedico" runat="server" ValidationGroup="grupo1"></asp:TextBox>
                    </td>
                    <td class="col-validador">
                        <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellidoMedico" ErrorMessage="* Completar campo" Display="Dynamic" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="col-label">
                        <asp:Label ID="lblDNI" runat="server" Text="DNI:"></asp:Label>
                    </td>
                    <td class="col-control">
                        <asp:TextBox ID="txtDNI" runat="server" ValidationGroup="grupo1"></asp:TextBox>
                    </td>
                    <td class="col-validador">
                        <asp:RequiredFieldValidator ID="rfvDNI" runat="server" ControlToValidate="txtDNI" ErrorMessage="* Completar campo" Display="Dynamic" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="revDNI" runat="server" ControlToValidate="txtDNI" ErrorMessage="* Solo numeros" ValidationExpression="^\d{8,9}$" Display="Dynamic" ValidationGroup="grupo1"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="col-label">
                        <asp:Label ID="lblFNacimiento" runat="server" Text="F. Nacimiento:"></asp:Label>
                    </td>
                    <td class="col-control">
                        <asp:TextBox ID="txtFechaNacimiento" runat="server" TextMode="Date" ValidationGroup="grupo1"></asp:TextBox>
                    </td>
                    <td class="col-validador">
                        <asp:RequiredFieldValidator ID="rfvF_Nacimiento" runat="server" ControlToValidate="txtFechaNacimiento" ErrorMessage="* Completar campo" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblError" runat="server" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="col-label">
                        <asp:Label ID="lblLegajo" runat="server" Text="Legajo:"></asp:Label>
                    </td>
                    <td class="col-control">
                        <asp:TextBox ID="txtLegajo" runat="server" ValidationGroup="grupo1"></asp:TextBox>
                    </td>
                    <td class="col-validador">
                        <asp:RequiredFieldValidator ID="rfvLegajo" runat="server" ControlToValidate="txtLegajo" ErrorMessage="* Completar campo" Display="Dynamic" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="col-label">
                        <asp:Label ID="lblEspecialidad" runat="server" Text="Especialidad:"></asp:Label>
                    </td>
                    <td class="col-control">
                        <asp:DropDownList ID="ddlEspecialidad" runat="server" ValidationGroup="grupo1"></asp:DropDownList>
                    </td>
                    <td class="col-validador">
                        <asp:RequiredFieldValidator ID="frvEspecialidad" runat="server" ControlToValidate="ddlEspecialidad" ErrorMessage="* Seleccione una especialidad" InitialValue="0" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="col-label">
                        <asp:Label ID="lblLocalidad" runat="server" Text="Localidad:"></asp:Label>
                    </td>
                    <td class="col-control">
                        <asp:DropDownList ID="ddlLocalidad" runat="server" ValidationGroup="grupo1"></asp:DropDownList>
                    </td>
                    <td class="col-validador">
                        <asp:RequiredFieldValidator ID="frvLocalidad" runat="server" ControlToValidate="ddlLocalidad" ErrorMessage="* Seleccione una localidad" InitialValue="0" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="col-label">
                        <asp:Label ID="lblNacionalidad" runat="server" Text="Nacionalidad:"></asp:Label>
                    </td>
                    <td class="col-control">
                        <asp:DropDownList ID="ddlNacionalidad" runat="server" ValidationGroup="grupo1"></asp:DropDownList>
                    </td>
                    <td class="col-validador">
                        <asp:RequiredFieldValidator ID="frvNacionalidad" runat="server" ControlToValidate="ddlNacionalidad" ErrorMessage="* Seleccione una nacionalidad" InitialValue="0" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="col-label">
                        <asp:Label ID="lblSexo" runat="server" Text="Sexo:"></asp:Label>
                    </td>
                    <td class="col-control">
                        <asp:DropDownList ID="ddlSexo" runat="server" ValidationGroup="grupo1"></asp:DropDownList>
                    </td>
                    <td class="col-validador">
                        <asp:RequiredFieldValidator ID="frvSexo" runat="server" ControlToValidate="ddlSexo" ErrorMessage="* Seleccione un sexo" InitialValue="0" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="col-label">
                        <asp:Label ID="lblDireccion" runat="server" Text="Dirección:"></asp:Label>
                    </td>
                    <td class="col-control">
                        <asp:TextBox ID="txtDireccion" runat="server" ValidationGroup="grupo1"></asp:TextBox>
                    </td>
                    <td class="col-validador">
                        <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="* Completar campo" Display="Dynamic" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="col-label">
                        <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
                    </td>
                    <td class="col-control">
                        <asp:TextBox ID="txtEmail" runat="server" ValidationGroup="grupo1"></asp:TextBox>
                    </td>
                    <td class="col-validador">
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="* Completar campo" Display="Dynamic" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="col-label">
                        <asp:Label ID="lblTelefono" runat="server" Text="Teléfono:"></asp:Label>
                    </td>
                    <td class="col-control">
                        <asp:TextBox ID="txtTelefono" runat="server" ValidationGroup="grupo1"></asp:TextBox>
                    </td>
                    <td class="col-validador">
                        <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono" ErrorMessage="* Completar campo" Display="Dynamic" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="revTelefono" runat="server" ControlToValidate="txtTelefono" ErrorMessage="* Solo numeros" ValidationExpression="^\d{8,15}$" Display="Dynamic" ValidationGroup="grupo1"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="seccion-titulo">
                        <asp:Label ID="Label2" runat="server" Text="Generar Usuario de Sistema"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="col-label">
                        <asp:Label ID="lblUsuarioMed" runat="server" Text="Usuario:"></asp:Label>
                    </td>
                    <td class="col-control">
                        <asp:TextBox ID="txtNombreUsuarioMed" runat="server" ValidationGroup="grupo1"></asp:TextBox>
                    </td>
                    <td class="col-validador">
                        <asp:RequiredFieldValidator ID="rfvUsuarioMedico" runat="server" ControlToValidate="txtNombreUsuarioMed" ErrorMessage="* Completar campo" Display="Dynamic" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="col-label">
                        <asp:Label ID="lblContraseñaMed" runat="server" Text="Contraseña:"></asp:Label>
                    </td>
                    <td class="col-control">
                        <asp:TextBox ID="txtContraseñaMed" runat="server" TextMode="Password" ValidationGroup="grupo1"></asp:TextBox>
                    </td>
                    <td class="col-validador">
                    </td>
                </tr>
                <tr>
                    <td class="col-label">
                        <asp:Label ID="lblRepetirContraseñaMed" runat="server" Text="Repetir Clave:"></asp:Label>
                    </td>
                    <td class="col-control">
                        <asp:TextBox ID="txtRepetirContraseñaMed" runat="server" TextMode="Password" ValidationGroup="grupo1"></asp:TextBox>
                    </td>
                    <td class="col-validador">
                        <asp:Label ID="mensajeContraseñas" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="col-label">
                        <asp:Label ID="lblExito" runat="server" Visible="False" ForeColor="Green" Font-Bold="True"></asp:Label>
                    </td>
                    <td class="fila-botones">
                        <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn-aceptar" OnClick="btnAceptar_Click1" ValidationGroup="grupo1" />
                    </td>
                    <td class="col-validador"></td>
                </tr>
            </table>
        </div>
        <div style="text-align: center; margin-top: 15px;">
            <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="btn-volver" OnClick="btnVolver_Click" ValidationGroup="grupo2" />
       </div>
    </form>
</body>
</html>
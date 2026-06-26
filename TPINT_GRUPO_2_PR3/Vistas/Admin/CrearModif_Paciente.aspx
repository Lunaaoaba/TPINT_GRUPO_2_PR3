<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CrearModif_Paciente.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.Vistas.Admin.CrearModif_Paciente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        body {
            background-color:#277343;
            font-family:Arial, sans-serif;
        }
        #contenedor {
            background-color:white;
            width:600px;
            margin:30px auto;
            padding:20px 30px;
            border-radius:8px;
        }
        .Error {
            color:#a94442;
            font-size:12px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="contenedor">
        <h2><asp:Label ID="lblTitulo" runat="server" Text="Alta de Paciente"></asp:Label></h2>
        <table>
            <tr>
                <td>DNI:</td>
                <td>
                    <asp:TextBox ID="txtDni" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDni" runat="server" ControlToValidate="txtDni" ErrorMessage="Requerido" CssClass="Error" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revDni" runat="server" ControlToValidate="txtDni" ErrorMessage="Solo números (7-10 dígitos)" ValidationExpression="^\d{7,10}$" CssClass="Error" Display="Dynamic"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Nombre:</td>
                <td>
                    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="Requerido" CssClass="Error" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Apellido:</td>
                <td>
                    <asp:TextBox ID="txtApellido" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido" ErrorMessage="Requerido" CssClass="Error" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Sexo:</td>
                <td>
                    <asp:DropDownList ID="ddlSexo" runat="server">
                        <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                        <asp:ListItem Value="M">M</asp:ListItem>
                        <asp:ListItem Value="F">F</asp:ListItem>
                        <asp:ListItem Value="X">X</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvSexo" runat="server" ControlToValidate="ddlSexo" ErrorMessage="Requerido" CssClass="Error" Display="Dynamic" InitialValue=""></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Nacionalidad:</td>
                <td>
                    <asp:TextBox ID="txtNacionalidad" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server" ControlToValidate="txtNacionalidad" ErrorMessage="Requerido" CssClass="Error" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Fecha Nac.:</td>
                <td>
                    <asp:TextBox ID="txtFechaNac" runat="server" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFechaNac" runat="server" ControlToValidate="txtFechaNac" ErrorMessage="Requerido" CssClass="Error" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Dirección:</td>
                <td>
                    <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="Requerido" CssClass="Error" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Provincia:</td>
                <td>
                    <asp:DropDownList ID="ddlProvincia" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Localidad:</td>
                <td>
                    <asp:DropDownList ID="ddlLocalidad" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvLocalidad" runat="server" ControlToValidate="ddlLocalidad" ErrorMessage="Seleccione una localidad" CssClass="Error" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Email:</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Requerido" CssClass="Error" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email inválido" ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" CssClass="Error" Display="Dynamic"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Teléfono:</td>
                <td>
                    <asp:TextBox ID="txtTelefono" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono" ErrorMessage="Requerido" CssClass="Error" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revTelefono" runat="server" ControlToValidate="txtTelefono" ErrorMessage="Solo números" ValidationExpression="^\d{8,15}$" CssClass="Error" Display="Dynamic"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="btnAceptar" runat="server" Text="Guardar" OnClick="btnAceptar_Click" />
        <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" OnClick="btnLimpiar_Click" CausesValidation="False" />
        <asp:HyperLink ID="hlVolver" runat="server" NavigateUrl="~/Vistas/ABML_Pacientes.aspx">Volver al listado</asp:HyperLink>
        <br /><br />
        <asp:Label ID="lblMensaje" runat="server" Visible="False"></asp:Label>
    </div>
    </form>
</body>
</html>
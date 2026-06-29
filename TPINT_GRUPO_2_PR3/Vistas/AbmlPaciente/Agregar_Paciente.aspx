<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Agregar_Paciente.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.Vistas.AbmlPaciente.AgrMod_Paciente" %>

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
        width: 560px;
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
                    <%--jaja ola k asia--%>
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
                    <td></td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <h2>Agregar Paciente</h2>
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
                    <td class="auto-style6">
                        <asp:Label ID="lblDNI" runat="server" Text="DNI :"></asp:Label>
                    </td>

                    <td class="auto-style7"></td>

                    <td class="auto-style6">
                        <asp:TextBox ID="txtDNI" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="lblNombrePaciente" runat="server" Text="Nombre:"></asp:Label>
                    </td>

                    <td class="auto-style2">&nbsp;</td>

                    <td>
                        <asp:TextBox ID="txtNombrePaciente" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="lblApellidoPaciente" runat="server" Text="Apellido :"></asp:Label>
                    </td>

                    <td class="auto-style2">&nbsp;</td>

                    <td>
                        <asp:TextBox ID="txtApellidoPaciente" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="Sexo" runat="server" Text="Sexo :"></asp:Label>
                    </td>

                    <td class="auto-style5"></td>

                    <td class="auto-style4">
                        <asp:DropDownList ID="ddlSexo" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="Nacionalidad" runat="server" Text="Nacionalidad :"></asp:Label>
                    </td>

                    <td class="auto-style2">&nbsp;</td>

                    <td>
                        <asp:DropDownList ID="ddlNacionalidad" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="lblFechaNacimiento" runat="server" Text="Fecha de Nacimiento :"></asp:Label>
                    </td>

                    <td class="auto-style2">&nbsp;</td>

                    <td>
                        <asp:TextBox ID="txtFechaNacimiento" runat="server" TextMode="Date"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="lblDireccion" runat="server" Text="Direccion :"></asp:Label>
                    </td>

                    <td class="auto-style2">&nbsp;</td>

                    <td>
                        <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="lblLocalidad" runat="server" Text="Localidad :"></asp:Label>
                    </td>

                    <td class="auto-style3">&nbsp;</td>

                    <td class="auto-style1">
                        <asp:DropDownList ID="ddlLocalidad" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="lblEmail" runat="server" Text="Email :"></asp:Label>
                    </td>

                    <td class="auto-style2">&nbsp;</td>

                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="lblTelefono" runat="server" Text="Telefono :"></asp:Label>
                    </td>

                    <td class="auto-style2">&nbsp;</td>

                    <td>
                        <asp:TextBox ID="txtTelefono" runat="server"></asp:TextBox>
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
                        <asp:Button
                            ID="btnAceptar"
                            runat="server"
                            Text="Aceptar"
                            Width="78px"
                            OnClick="btnAceptar_Click" />
                    </td>
                </tr>

                <tr>
                    <td class="auto-style6" colspan="3">
                        &nbsp;</td>

                </tr>

                </table>

        </div>

    </div>

    <asp:Label ID="lblMensaje" runat="server"></asp:Label>

</form>

</body>
</html>
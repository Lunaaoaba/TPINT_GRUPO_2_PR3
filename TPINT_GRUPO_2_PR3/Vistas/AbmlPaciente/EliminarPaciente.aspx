<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EliminarPaciente.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.Vistas.AbmlPaciente.EliminarPaciente" %>

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
                    <td colspan="3">
                        <h1 align="center">Eliminar Paciente</h1>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="lbl_ID" runat="server" Text="ID :"></asp:Label>
                    </td>

                    <td>
                        <asp:TextBox ID="txtID" runat="server" align="center" Width="78px" ToolTip="Ingrese el ID que desea eliminar (puede buscarlo en el listado general)"></asp:TextBox>
                    </td>

                    <td>
                        <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" Width="78px" OnClick="btnAceptar_Click" Height="23px" />
                    </td>
                </tr>

                <tr>
                    <td colspan="3">
                        <asp:Label ID="lblExito" runat="server" Visible="False"></asp:Label>
                    </td>

                </tr>

                <tr>
                    <td>
                        &nbsp;</td>

                    <td class="auto-style2">
                        <asp:GridView ID="gvEliminarPaciente" runat="server">
                        </asp:GridView>
                    </td>

                    <td>
                        &nbsp;</td>
                </tr>

                <tr>
                    <td class="auto-style4" colspan="3">
                        &nbsp;</td>

                </tr>

                </table>

        </div>

    </div>

    <asp:Label ID="lblMensaje" runat="server"></asp:Label>

    <p>
        &nbsp;</p>
    <p>
        <%-- Buscar una forma de que la posición del boton sea fijo en el borde inferior derecho sin importar el tamaño de la ventana --%>
        <asp:Button ID="bt_restaurar" runat="server" align="right" Text="Restaurar pacientes" ToolTip="Esto restaura los pacientes elminados (todos o por ID)" Width="134px" Height="24px" style="margin-left: 10px" BackColor="#256C3F" BorderColor="#1A4D2D" EnableTheming="True" OnClick="bt_restaurar_Click" />
    </p>

</form>

</body>
</html>
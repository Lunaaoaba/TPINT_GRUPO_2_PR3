<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Eliminar_Paciente.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.Vistas.AbmlPaciente.EliminarPaciente" %>

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

    .auto-style {
        width: 4px;
    }

    #bt_restaurar {
        position: fixed;
        bottom: 20px;
        right: 20px;
        margin-left: 0 !important;
    }

    #contenedor {
        width: 560px;
        max-width: 90vw;
        overflow-x: auto;
    }

    #gvEliminarPaciente {
        max-width: 100%;
        table-layout: auto;
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
                    </tr>margin-left
                    <tr><td>
                        <asp:LinkButton ID="gv_vistaPrevia" runat="server" OnClick="gv_vistaPrevia_Click">Previsualizar</asp:LinkButton>
                        </td></tr>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style">
                            <asp:GridView ID="gvEliminarPaciente" runat="server"></asp:GridView>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
        </div>
        <p>&nbsp;</p>
        <p>
            <asp:Button ID="bt_restaurar" runat="server" Text="Restaurar pacientes" ToolTip="Esto restaura los pacientes elminados (todos o por ID)" Width="134px" Height="24px" BackColor="#256C3F" BorderColor="#1A4D2D" EnableTheming="True" OnClick="bt_restaurar_Click" />
        </p>
    </form>
</body>
</html>
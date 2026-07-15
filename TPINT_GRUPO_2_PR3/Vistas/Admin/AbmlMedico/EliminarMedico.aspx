<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EliminarMedico.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.Vistas.AbmlMedico.ModificarMedico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Modificar Médico</title>
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
        flex-direction: column;
        justify-content: center;
        align-items: center;
        background-color: white !important;
        width: max-content;
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
        width: max-content;
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
                <table>
                    <tr>
                        <td colspan="3">
                            <h1 align="center">Eliminar Medico</h1>
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
                            <asp:Button ID="btn_aceptar" runat="server" Text="Aceptar" OnClick="btnAceptar_Click" />
                        </td>
                    </tr>
                    <tr><td>
                        <asp:LinkButton ID="LbtnPrevisualizarEliminar" runat="server" OnClick="LbtnPrevisualizarEliminar_Click">Previsualizar</asp:LinkButton>
                        </td></tr>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div>
            <table>
                <tr>
                    <td>
                        <asp:GridView ID="gvEliminarMedico" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CellPadding="5" >
                            <HeaderStyle BackColor="#277343" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="White" ForeColor="#333333" />
                            <AlternatingRowStyle BackColor="#E8F5E9" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
        <p>&nbsp;</p>
        <p>
            <asp:Button ID="bt_restaurar" runat="server" Text="Restaurar Medicos" ToolTip="Esto restaura los pacientes elminados (todos o por ID)" Width="134px" Height="24px" BackColor="#256C3F" BorderColor="#1A4D2D" EnableTheming="True" OnClick="bt_restaurar_Click"  />
            <asp:Button ID="btnVolver" runat="server" OnClick="btnVolver_Click" Text="Volver" />
        </p>
    </form>
</body>
</html>
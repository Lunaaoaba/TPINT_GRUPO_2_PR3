<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ABML_Turnos.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.Vistas.ABML_Turnos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: auto;
            height: auto;
        }
        body {
        background-color:#277343;
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
            width: 300px;
            padding: 20px 30px;
            border-radius: 8px;
            box-sizing: border-box;
            margin: 0 auto;
        }
    </style>
</head>
<body >
    <form id="form1" runat="server">
    <div id="contenedor">
        <table class="auto-style1">
            <tr>
                <td>&nbsp;</td>
                <td align="center">
                    <asp:Image ID="ICON_medico" ImageUrl="~/Imagenes/ICON_Turnos.png" runat="server" Height="50px" Width="51px" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td align="center">Seleccione una Acción:</td>
                <td>&nbsp;</td>
            </tr>
            <tr style="height:1px;">
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>

            <tr>
                <td>&nbsp;</td>
                <td align="center">
                    <asp:Button ID="AgregarModificarTurno" runat="server" Text="Agregar/Modificar Turno" CssClass="tamanioBoton" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td align="center">
                    <asp:Button ID="ListarEliminarTurno" runat="server" Text="Listar/Eliminar Turno" CssClass="tamanioBoton" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
    </form>
    </body>
</html>

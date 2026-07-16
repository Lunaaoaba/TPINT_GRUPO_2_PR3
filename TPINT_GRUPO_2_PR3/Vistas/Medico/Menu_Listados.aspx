<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu_Listados.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.Vistas.Menu_Listados" %>
<%@ Register TagPrefix="uc" TagName="BarraSuperior" Src="~/Vistas/BarraSuperior.ascx" %>
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
            width: max-content;
            padding: 20px 30px;
            border-radius: 8px;
            box-sizing: border-box;
            margin: 0 auto;
        }
        .auto-style2 {
            height: 23px;
        }
    </style>
</head>
<body >
    <form id="form1" runat="server">
    <uc:BarraSuperior ID="BarraSuperior1" runat="server" />
    <div id="contenedor">
        <table class="auto-style1">

            <tr>
                <td class="auto-style2"></td>
                <td align="center" class="auto-style2">
                    <asp:Image ID="Image1" runat="server" Height="43px" ImageUrl="~/Imagenes/ICONO_LISTADO.png" Width="39px" />
                </td>
                <td class="auto-style2"></td>
            </tr>
            <tr style="height:1px;">
                <td>&nbsp;</td>
                <td class="auto-style2">Seleccione una Acción:</td>
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
                    <asp:Button ID="TurnosEspecialidad" runat="server" Text="Turnos por especialidad" CssClass="tamanioBoton" />
                </td>
                <td>&nbsp;</td>
            </tr>

            <tr>
                <td>&nbsp;</td>
                <td align="center">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="RankingMedicos" runat="server" Text="Ranking de medicos por atencion" CssClass="tamanioBoton" />
                </td>
                <td>&nbsp;</td>
            </tr>

            <tr >
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td align="center">
                    <asp:Button ID="OcupacionPorSemana" runat="server" Text="Ocupacion por dia de semana" CssClass="tamanioBoton" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
    </form>
    <p>
        &nbsp;</p>
    </body>
</html>

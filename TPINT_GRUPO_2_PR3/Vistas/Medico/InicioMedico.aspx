<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InicioMedico.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.Vistas.InicioMedico" %>
<%@ Register TagPrefix="uc" TagName="BarraSuperior" Src="~/Vistas/BarraSuperior.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
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
        #contenedor2 {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: white !important;
            width: max-content;
            padding: 20px 30px;
            border-radius: 8px;
            box-sizing: border-box;
            margin: 15px auto;
        }
        .auto-style1 {
            width: 100%;
        }
        body {
            background-color:#277343;
           }
        .auto-style2 {
            width: 130px;
        }
        .auto-style4 {
            width: 456px;
        }
        .auto-style5 {
            width: 85px;
        }
        .auto-style6 {
            width: 140px;
        }
        .tamanioBoton {
            width: 137px;
            height: 25px;
        }
        .auto-style7 {
            width: 189px;
        }
        .auto-style8 {
            width: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc:BarraSuperior ID="BarraSuperior1" runat="server" />
     
        <div id="contenedor2">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td align="center" class="auto-style7">Bienvenido/a:</td>
                    <td class="auto-style8">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td align="center" class="auto-style7"><asp:Label ID="lblBienvenido" runat="server">Dr./Dra.</asp:Label></td>
                    <td class="auto-style8">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td align="center" class="auto-style7"><h3>¿Qué desea hacer?</h3></td>
                    <td class="auto-style8">&nbsp;</td>
                </tr>

                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td align="center" class="auto-style7">
                        <asp:Button ID="ListarTurnos" runat="server" Text="Listas Mis Turnos" CssClass="tamanioBoton" />
                    </td>
                    <td class="auto-style8">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td align="center" class="auto-style7">
                        <asp:Button ID="Opcion1" runat="server" Text="Otra opción" CssClass="tamanioBoton" />
                    </td>
                    <td class="auto-style8">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td align="center" class="auto-style7">
                        <asp:Button ID="Opcion2" runat="server" Text="Opción extra" CssClass="tamanioBoton" />
                    </td>
                    <td class="auto-style8">&nbsp;</td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>

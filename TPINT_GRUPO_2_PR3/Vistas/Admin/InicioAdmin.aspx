<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InicioAdmin.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.Vistas.InicioAdmin" %>

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
<div id="contenedor">
    <table align="center" class="auto-style1">
        <tr>
            <td class="auto-style2">| Icono Clínica |</td>
            <td class="auto-style5">| Inicio |</td>
            <td class="auto-style4">| Nombre de Clínica |</td>
            <td class="auto-style6"> <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label> </td>
            <td><asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar Sesión" CssClass="tamanioBoton"  BorderColor="White" OnClick="btnCerrarSesion_Click" /> </td>
        </tr>
    </table>
</div>
<div id="contenedor2">
    <table class="auto-style1">
        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td align="center" class="auto-style7">Bienvenido/a:</td>
            <td class="auto-style8">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td align="center" class="auto-style7">Administrador/a. Fulano</td>
            <td class="auto-style8">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td align="center" class="auto-style7"><h3>¿Qué desea administrar?</h3></td>
            <td class="auto-style8">&nbsp;</td>
        </tr>

        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td align="center" class="auto-style7">
                <asp:Button ID="btnMedicos" runat="server" Text="Medicos" CssClass="tamanioBoton" OnClick="btnMedicos_Click" />
            </td>
            <td class="auto-style8">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td align="center" class="auto-style7">
                <asp:Button ID="btnPacientes" runat="server" Text="Pacientes" CssClass="tamanioBoton" OnClick="btnPacientes_Click" />
            </td>
            <td class="auto-style8">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td align="center" class="auto-style7">
                <asp:Button ID="btnTurnos" runat="server" Text="Turnos" CssClass="tamanioBoton" OnClick="btnTurnos_Click"/>
            </td>
            <td class="auto-style8">&nbsp;</td>
        </tr>
    </table>

</div>
    </form>
</body>
</html>

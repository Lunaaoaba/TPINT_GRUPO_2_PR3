<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginMedicos.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.Vistas.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        body {
        font-family: Arial, sans-serif;
        background-color:#277343;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        margin: 0;
        }
        #contenedor {
        background-color: white;
        width: 100%;
        max-width: 800px;
        padding: 20px 30px;
        border-radius: 8px;
        box-sizing: border-box;
        display: flex;
        justify-content: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="contenedor">
            <table class="auto-style1">
                <tr>
                    <td colspan="3" style="text-align:center;">&nbsp;<asp:Image ID="Image1" runat="server" ImageUrl="~/Imagenes/IconoClinica.png" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3"style="text-align:center;"><h1>Sistema Medico</h1></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Label ID="lblErrorEstaMal" runat="server" ForeColor="Red" Text="Esta Mal En Algo..." Visible="False"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td><h2>Usuario: </h2></td>
                    <td>
                        <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ControlToValidate="txtUsuario" Visible="False"></asp:CompareValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtUsuario" Visible="False"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><h2>Contraseña: </h2></td>
                    <td>
                        <asp:TextBox ID="txtContraseña" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="CompareValidator" ControlToValidate="txtContraseña" Visible="False"></asp:CompareValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtContraseña" Visible="False"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="BtnSession" runat="server" Text="Iniciar Sesión" OnClick="BtnSession_Click" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
             </div>
        </div>
    </form>
</body>
</html>

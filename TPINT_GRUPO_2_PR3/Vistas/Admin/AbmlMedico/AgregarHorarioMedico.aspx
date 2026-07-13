<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarHorarioMedico.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.Vistas.Admin.AbmlMedico.AgregarHorarioMedico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Agregar Médico</title>
    <style>

body {
background-color: #277343;
font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
display: flex;
justify-content: center;
align-items: center;
min-height: 100vh;
margin: 0;
padding: 20px 0;
box-sizing: border-box;
}

#contenedor {
background-color: white !important;
width: max-content;
padding: 30px;
border-radius: 8px;
box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.15);
margin: 0 auto;
}

/el h2 hace label barrita inferior que vemos en pantalla/ 
h2 {
color: #277343;
text-align: center;
margin-top: 0;
margin-bottom: 25px;
font-size: 24px;
border-bottom: 2px solid #277343;
padding-bottom: 10px;
}

.tablaFormulario {
width: 100%;
border-collapse: collapse;
}

.tablaFormulario td {
padding: 8px 5px;
vertical-align: middle;
}

.col-label {
text-align: right;
font-weight: 600;
color: #333;
padding-right: 15px !important;
}

.col-control {
width: 40%;
}

.col-validador {
width: 30%;
font-size: 12px;
color: #cc0000;
padding-left: 10px !important;
}

.tablaFormulario asp\:TextBox, 
.tablaFormulario asp\:DropDownList,
.tablaFormulario input[type="text"], 
.tablaFormulario input[type="password"], 
.tablaFormulario input[type="date"], 
.tablaFormulario select {
width: 100%;
padding: 6px;
border: 1px solid #ccc;
border-radius: 4px;
box-sizing: border-box;
}

.tablaFormulario select {
height: 31px;
}

.seccion-titulo {
text-align: center;
font-weight: bold;
color: #277343;
padding-top: 20px !important;
padding-bottom: 10px !important;
font-size: 16px;
text-transform: uppercase;
letter-spacing: 1px;
}

.fila-botones {
text-align: center;
padding-top: 20px !important;
}

.btn-aceptar {
background-color: #277343;
color: white;
border: none;
padding: 8px 25px;
font-size: 14px;
font-weight: bold;
border-radius: 4px;
cursor: pointer;
transition: background-color 0.2s;
}
.btn-aceptar:hover {
background-color: #1e5732;
}

.btn-volver {
    background-color: #f4f4f4;
    color: #555555;
    border: 1px solid #cccccc;
    padding: 8px 20px;
    font-size: 14px;
    font-weight: 500;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.2s;
    text-decoration: none;
    display: inline-block;
}

.btn-volver:hover {
    background-color: #e2e2e2;
    color: #333333;
}

        .auto-style1 {
            text-align: right;
            font-weight: 600;
            color: #333;
            padding-right: 15px;
            height: 48px;
        }
        .auto-style2 {
            width: 40%;
            height: 48px;
        }
        .auto-style3 {
            width: 30%;
            font-size: 12px;
            color: #cc0000;
            padding-left: 10px;
            height: 48px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="contenedor">
            <div style="text-align: center; margin-bottom: 15px;">
                <asp:Label ID="lblNombreUsuario" runat="server" Font-Italic="True" ForeColor="#555555"></asp:Label>
            </div>

            <h2>Agregar Horario de Atención</h2>
            
            <table class="tablaFormulario">
                <tr>
                    <td class="col-label">
                        Buscar Medico</td>
                    <td class="col-control">
                        <asp:TextBox ID="txtNombreMedico" runat="server" ValidationGroup="grupo1"></asp:TextBox>
                    </td>
                    <td class="col-validador">
                        <asp:Button ID="btn_Buscar_Medico" runat="server" Text="Buscar" />
                    </td>
                </tr>
                <tr>
                    <td class="col-label" colspan="3">
                        <asp:GridView ID="GridView1" runat="server">
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td class="col-label">
                        &nbsp;</td>
                    <td class="col-control">
                        <h4>Agregar Hora y Día </h4></td>
                    <td class="col-validador">
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="lblDireccion" runat="server" Text="Día:"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="DropDownList1" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style3">
                        </td>
                </tr>
                <tr>
                    <td class="col-label">
                        <asp:Label ID="lblEmail" runat="server" Text="Hora de Inicio de la consulta:"></asp:Label>
                    </td>
                    <td class="col-control">
                        <asp:DropDownList ID="DropDownList2" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td class="col-validador">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="col-label">
                        &nbsp;</td>
                    <td class="col-control">
                        &nbsp;</td>
                    <td class="col-validador">
                        <br />
                    </td>
                </tr>
                    
                <tr>
                    <td class="col-label">
                        <asp:Label ID="lblExito" runat="server" Visible="False" ForeColor="Green" Font-Bold="True"></asp:Label>
                    </td>
                    <td class="fila-botones">
                        <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn-aceptar" OnClick="btnAceptar_Click1" />
                    </td>
                    <td class="col-validador"></td>
                </tr>
            </table>
        </div>
        <div style="text-align: center; margin-top: 15px;">
            <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="btn-volver" OnClick="btnVolver_Click" ValidationGroup="grupo2" />
       </div>
    </form>
</body>
</html>
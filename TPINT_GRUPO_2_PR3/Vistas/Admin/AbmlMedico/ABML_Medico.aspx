<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ABML_Medico.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.Vistas.ABML_Medico" %>

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
            width: max-content;
            padding: 20px 30px;
            border-radius: 8px;
            box-sizing: border-box;
            margin: 0 auto;
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
    </style>
</head>
<body >
    <form id="form1" runat="server">
    <div id="contenedor">
        <table class="auto-style1">
            <tr>
                <td>&nbsp;</td>
                <td align="center">
                    <asp:Image ID="ICON_medico" ImageUrl="~/Imagenes/ICON_medico.png" runat="server" />
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
                    <asp:Button ID="AgregarMedico" runat="server" Text="Agregar Medico" CssClass="tamanioBoton" OnClick="AgregarMedico_Click" />
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
                    <asp:Button ID="ListarMedicos" runat="server" Text="Listar y Eliminar" CssClass="tamanioBoton" OnClick="ListarMedicos_Click" />
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
                    <asp:Button ID="ReportesMedicos" runat="server" Text="Modificar Médicos" CssClass="tamanioBoton" OnClick="ReportesMedicos_Click" />
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
                <td>
                    <%-- <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="btn-volver" OnClick="btnVolver_Click"  /> --%>
                    <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="btn-volver" OnClick="btnVolver_Click" />
                <td>&nbsp;</td>
                
          </tr>
           
        </table>
    </div>
    </form>
    </body>
</html>

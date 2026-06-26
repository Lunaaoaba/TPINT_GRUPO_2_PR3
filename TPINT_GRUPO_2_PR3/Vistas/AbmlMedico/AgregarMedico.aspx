<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarMedico.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.Vistas.AgregarMedico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
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
    width: 560px;
    padding: 20px 30px;
    border-radius: 8px;
    box-sizing: border-box;
    margin: 0 auto;
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
                           <td class="auto-style6"> <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label> </td>
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
                        <td></td>
                        <td> <h2>Agregar Medico</h2></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblNombreMedico" runat="server" Text="Nombre Medico :"></asp:Label>  
                        </td>
                        <td>

                            <asp:TextBox ID="txtNombreMedico" runat="server" ></asp:TextBox>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblDesc" runat="server" Text="Descripcion :"></asp:Label>
                        </td>
                        <td>

                            <asp:TextBox ID="txtDescripcion" runat="server"></asp:TextBox>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblProvincia" runat="server" Text="Provincia :"></asp:Label>
                        </td>
                        <td>

                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lblDireccion" runat="server" Text="Direccion :"></asp:Label>
                        </td>
                        <td class="auto-style2">

                            <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            
                        </td>
                        <td>
                            
                            <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" Width="78px"  />
                            
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <asp:Label ID="lblMensaje" runat="server"></asp:Label>
    </form>
</body>


</html>

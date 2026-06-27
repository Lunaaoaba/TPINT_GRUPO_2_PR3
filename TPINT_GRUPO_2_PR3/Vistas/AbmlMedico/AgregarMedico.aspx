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
        .auto-style1 {
            height: 29px;
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
               
                <table style="width: 482px">
                    <tr>
                        <td></td>
                        <td>&nbsp;</td>
                        <td> <h2>Agregar Medico</h2></td>
                        <td> &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblNombreMedico" runat="server" Text="Nombre Medico :"></asp:Label>  
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>

                            <asp:TextBox ID="txtNombreMedico" runat="server" ></asp:TextBox>

                        </td>
                        <td>

                            &nbsp;</td>
                    </tr>
                     <tr>
                <td>
                            <asp:Label ID="Label1" runat="server" Text="Apellido Medico :"></asp:Label>  
                    </td>
                <td>
                            &nbsp;</td>
                    <td>

                     <asp:TextBox ID="txtApellidoMedico" runat="server" ></asp:TextBox>

              </td>

                    <td>

                        &nbsp;</td>

            </tr>
                     <tr>
                <td>
                            <asp:Label ID="lblDNI" runat="server" Text="DNI :"></asp:Label>
                    </td>
                <td>
                            &nbsp;</td>
                    <td>

                        <asp:TextBox ID="txtDNI" runat="server"></asp:TextBox>
                         </td>

                    <td>

                        &nbsp;</td>

            </tr>
                     <tr>
                <td>
                            <asp:Label ID="lblFechaNacimiento" runat="server" Text="Fecha de Nacimiento :"></asp:Label>
                    </td>
                <td>
                            &nbsp;</td>
                    <td>

                        <asp:TextBox ID="txtFechaNacimiento" runat="server" TextMode="Date"></asp:TextBox>
                         </td>

                    <td>

                        &nbsp;</td>

            </tr>
                     <tr>
                <td>
                            <asp:Label ID="lblLegajo" runat="server" Text="Legajo :"></asp:Label>
                    </td>
                <td>
                            &nbsp;</td>
                    <td>

                        <asp:TextBox ID="txtLegajo" runat="server"></asp:TextBox>
                         </td>

                    <td>

                        &nbsp;</td>

            </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="lblDesc" runat="server" Text="Especialidad :"></asp:Label>
                        </td>
                        <td class="auto-style1">
                            </td>
                        <td class="auto-style1">

                            <asp:DropDownList ID="ddlEspecialidad" runat="server" >
                            </asp:DropDownList>

                        </td>
                        <td class="auto-style1">

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblLocalidad" runat="server" Text="Localidad :"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>

                            <asp:DropDownList ID="ddlLocalidad" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td>

                            &nbsp;</td>
                        <tr>
    <td>
        <asp:Label ID="Nacionalidad" runat="server" Text="Nacionalidad :"></asp:Label>
    </td>
    <td>
        &nbsp;</td>
    <td>

        <asp:DropDownList ID="ddlNacionalidad" runat="server">
        </asp:DropDownList>
                            </td>
    <td>

        &nbsp;</td>
                            <tr>
    <td class="auto-style1">
        <asp:Label ID="Sexo" runat="server" Text="Sexo :"></asp:Label>
    </td>
    <td class="auto-style1">
        &nbsp;</td>
    <td class="auto-style1">

        <asp:DropDownList ID="ddlSexo" runat="server">
        </asp:DropDownList>
                                </td>
    <td class="auto-style1">

        &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lblDireccion" runat="server" Text="Direccion :"></asp:Label>
                        </td>
                        <td class="auto-style2">
                            &nbsp;</td>
                        <td class="auto-style2"> 
                            <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
                            </td>

                        <td class="auto-style2"> 
                            &nbsp;</td>

                        <tr>
    <td class="auto-style2">
        <asp:Label ID="lblEmail" runat="server" Text="Email :"></asp:Label>
    </td>
    <td class="auto-style2">
        &nbsp;</td>
                            <td>
                                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                            <tr>
    <td class="auto-style2">
        <asp:Label ID="lblTelefono" runat="server" Text="Telefono :"></asp:Label>
    </td>
    <td class="auto-style2">
        &nbsp;</td>
                        <td class="auto-style2">

                            <asp:TextBox ID="txtTelefono" runat="server"></asp:TextBox>
                        </td>
                        <td class="auto-style2">

                            &nbsp;</td>
                    </tr>
                            <tr>
    <td class="auto-style2">
        &nbsp;</td>
    <td class="auto-style2">
        &nbsp;</td>
                        <td class="auto-style2">

                            <asp:Label ID="LabelTitulo" runat="server" Text="Generar Usuario"></asp:Label>
                        </td>
                        <td class="auto-style2">

                            &nbsp;</td>
                    </tr>
                            <tr>
    <td class="auto-style2">
        <asp:Label ID="lblNombreUsuarioMed" runat="server" Text="Nombre de Usuario :"></asp:Label>
    </td>
    <td class="auto-style2">
        &nbsp;</td>
                        <td class="auto-style2">

                            <asp:TextBox ID="txtNombreUsuarioMed" runat="server"></asp:TextBox>
                        </td>
                        <td class="auto-style2">

                            &nbsp;</td>
                    </tr>
                            <tr>
    <td class="auto-style2">
        <asp:Label ID="lblContraseñaMed" runat="server" Text="Contraseña :"></asp:Label>
    </td>
    <td class="auto-style2">
        &nbsp;</td>
                        <td class="auto-style2">

                            <asp:TextBox ID="txtContraseñaMed" runat="server"></asp:TextBox>
                        </td>
                        <td class="auto-style2">

                            &nbsp;</td>
                    </tr>
                            <tr>
    <td class="auto-style2">
        <asp:Label ID="lblRepetirContraseñaMed" runat="server" Text="Repetir Contraseña :"></asp:Label>
    </td>
    <td class="auto-style2">
        &nbsp;</td>
                        <td class="auto-style2">

                            <asp:TextBox ID="txtRepetirContraseñaMed" runat="server"></asp:TextBox>
                        </td>
                        <td class="auto-style2">

                            <asp:Label ID="mensajeContraseñas" runat="server" Text="Label" Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            
                        </td>
                        <td>
                            
                            &nbsp;</td>
                        <td>
                            
                            <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" Width="78px" OnClick="btnAceptar_Click"  />
                            
                        </td>
                        <td>
                            
                            <asp:Label ID="lblExito" runat="server" Visible="False"></asp:Label>
                            
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <asp:Label ID="lblMensaje" runat="server"></asp:Label>
    </form>
</body>


</html>

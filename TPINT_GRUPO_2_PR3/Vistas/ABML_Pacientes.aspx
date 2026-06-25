<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ABML_Pacientes.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.Vistas.ABML_Pacientes" %>

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
            width: 1000px;
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
                    <asp:Image ID="ICON_Paciente" ImageUrl="~/Imagenes/ICON_paciente.png" runat="server" Height="54px" Width="54px" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td align="center">seleccione una Acción:</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td align="center">
                    <asp:Button ID="AgregarPaciente" runat="server" Text="Agregar un nuevo paciente" OnClick="AgregarPaciente_Click" CssClass="tamanioBoton" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Label ID="lblMensaje" runat="server" Text="" Visible="False" align="center"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td align="center">
                    
                        <asp:Label ID="lblTitulo" runat="server" Text="Listado de Pacientes" Font-Bold="True" Font-Size="Large"></asp:Label>
                    <div style="overflow-x: auto; width: 100%; align-items: center; align-content: center;"> 
                    <asp:GridView ID="gvPaciente" runat="server" Width="95%" HorizontalAlign="Center" AllowPaging="True" AutoGenerateColumns="False" 
                        DataKeyNames="id_pac" PageSize="10" 
                        OnRowCommand="gvPaciente_RowCommand"
                        OnRowEditing="gvPaciente_RowEditing"
                        OnRowCancelingEdit="gvPaciente_RowCancelingEdit"
                        OnRowUpdating="gvPaciente_RowUpdating"
                        OnRowDataBound="gvPaciente_RowDataBound"
                        CellPadding="4" ForeColor="#333333" GridLines="Horizontal">
    
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate><asp:Label runat="server" Text='<%# Eval("id_pac") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DNI">
                                <ItemTemplate><asp:Label runat="server" Text='<%# Eval("dni_pac") %>'></asp:Label></ItemTemplate>
                                <EditItemTemplate><asp:TextBox ID="txt_dni" runat="server" Text='<%# Bind("dni_pac") %>'></asp:TextBox></EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nombre">
                                <ItemTemplate><asp:Label runat="server" Text='<%# Eval("nombre_pac") %>'></asp:Label></ItemTemplate>
                                <EditItemTemplate><asp:TextBox ID="txt_nombre" runat="server" Text='<%# Bind("nombre_pac") %>'></asp:TextBox></EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Apellido">
                                <ItemTemplate><asp:Label runat="server" Text='<%# Eval("apellido_pac") %>'></asp:Label></ItemTemplate>
                                <EditItemTemplate><asp:TextBox ID="txt_apellido" runat="server" Text='<%# Bind("apellido_pac") %>'></asp:TextBox></EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sexo">
                                <ItemTemplate><asp:Label runat="server" Text='<%# Eval("sexo_pac") %>'></asp:Label></ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddl_sexo" runat="server">
                                        <asp:ListItem Value="M">M</asp:ListItem>
                                        <asp:ListItem Value="F">F</asp:ListItem>
                                        <asp:ListItem Value="X">X</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nacionalidad">
                                <ItemTemplate><asp:Label runat="server" Text='<%# Eval("nacionalidad_pac") %>'></asp:Label></ItemTemplate>
                                <EditItemTemplate><asp:TextBox ID="txt_nacionalidad" runat="server" Text='<%# Bind("nacionalidad_pac") %>'></asp:TextBox></EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Fecha Nacimiento">
                                <ItemTemplate><asp:Label runat="server" Text='<%# Eval("fecha_nacimiento_pac", "{0:dd/MM/yyyy}") %>'></asp:Label></ItemTemplate>
                                <EditItemTemplate><asp:TextBox ID="txt_fechaNac" runat="server" Text='<%# Bind("fecha_nacimiento_pac", "{0:yyyy-MM-dd}") %>'></asp:TextBox></EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Dirección">
                                <ItemTemplate><asp:Label runat="server" Text='<%# Eval("direccion_pac") %>'></asp:Label></ItemTemplate>
                                <EditItemTemplate><asp:TextBox ID="txt_direccion" runat="server" Text='<%# Bind("direccion_pac") %>'></asp:TextBox></EditItemTemplate>
                            </asp:TemplateField>


                            <%--REVISAR PQ DA ERROR--%>

                            <asp:TemplateField HeaderText="Localidad">
                                 <ItemTemplate><asp:Label runat="server" Text='<%# Eval("nombre_loc") %>'></asp:Label></ItemTemplate>
                                <EditItemTemplate><asp:DropDownList ID="ddl_localidad" runat="server"></asp:DropDownList></EditItemTemplate>
                            </asp:TemplateField>

                            <%--REVISAR PQ DA ERROR--%>

                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate><asp:Label runat="server" Text='<%# Eval("email_pac") %>'></asp:Label></ItemTemplate>
                                <EditItemTemplate><asp:TextBox ID="txt_email" runat="server" Text='<%# Bind("email_pac") %>'></asp:TextBox></EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Teléfono">
                                <ItemTemplate><asp:Label runat="server" Text='<%# Eval("telefono_pac") %>'></asp:Label></ItemTemplate>
                                <EditItemTemplate><asp:TextBox ID="txt_telefono" runat="server" Text='<%# Bind("telefono_pac") %>'></asp:TextBox></EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Acciones">
                                <ItemTemplate>
                                    <asp:Button ID="btnEditar" runat="server" Text="Editar" CommandName="Edit" />
                                    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CommandName="EliminarCustom" CommandArgument='<%# Eval("id_pac") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" CommandName="Update" />
                                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CommandName="Cancel" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                    </asp:GridView>
                        </div>

                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td></td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
    </form>
    </body>
</html>


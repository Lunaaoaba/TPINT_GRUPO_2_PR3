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
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td align="center">
                    <asp:Label ID="lblTitulo" runat="server" Text="Listado de Pacientes" Font-Bold="True" Font-Size="Large"></asp:Label>
                    <div style="overflow-x: auto; width: 100%; align-items: center; align-content: center;"> 
                        <asp:Button ID="btnAgregarPaciente" runat="server" Text="Agregar Paciente" OnClick="btnAgregarPaciente_Click" />
                        <br/><br />
                                <asp:Label ID="lblMensaje" runat="server" Visible="False"></asp:Label>
                    <br />
                    <asp:GridView ID="gvPaciente" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        DataKeyNames="id_pac" PageSize="10"
                        OnPageIndexChanging="gvPaciente_PageIndexChanging"
                        CellPadding="4" ForeColor="#333333" GridLines="Horizontal">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="id_pac" HeaderText="ID" />
                            <asp:BoundField DataField="dni_pac" HeaderText="DNI" />
                            <asp:BoundField DataField="nombre_pac" HeaderText="Nombre" />
                            <asp:BoundField DataField="apellido_pac" HeaderText="Apellido" />
                            <asp:BoundField DataField="nombre_loc" HeaderText="Localidad" />
                            <asp:BoundField DataField="email_pac" HeaderText="Email" />
                            <asp:BoundField DataField="telefono_pac" HeaderText="Teléfono" />
                            <asp:TemplateField HeaderText="Acciones">
                                <ItemTemplate>
                                    <asp:HyperLink runat="server" Text="Editar" NavigateUrl='<%# "CrearModif_Paciente.aspx?id_pac=" + Eval("id_pac") %>'></asp:HyperLink>
                                    &nbsp;
                                    <asp:Button runat="server" Text="Eliminar" CommandName="Eliminar" CommandArgument='<%# Eval("id_pac") %>' OnCommand="btnEliminar_Command" OnClientClick="return confirm('¿Eliminar paciente?');" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
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


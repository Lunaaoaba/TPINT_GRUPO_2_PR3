<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListarModificar_Pacientes.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.Vistas.ListarModificar_Pacientes" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>ABML Pacientes</title>
    <style>
body{
    background:#277343;
    font-family:Arial, Helvetica, sans-serif;
    margin:0;
    padding:30px;
}
#contenedor{
    width: max-content;
    margin:40px auto;
    background:white;
    padding:25px;
    border-radius:10px;
    box-shadow:0 0 15px rgba(0,0,0,.25);
}
.grid{
    width:100%;
    border-collapse:collapse;
    background:white;
}
.grid th{
    background:#277343;
    color:white;
    padding:10px;
    text-align:center;
}
.grid td{
    padding:8px;
    border:1px solid #d9d9d9;
    text-align:center;
}
.grid tr:nth-child(even){
    background:#f4f4f4;
}
.grid tr:hover{
    background:#dff0e2;
}
.titulo{
    text-align:center;
    color:#277343;
    display:block;
    font-size:22px;
    font-weight:bold;
    margin-bottom:10px;
}
.tamanioBoton{
    width:200px;
    height:25px;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="contenedor">
            <div style="text-align:center;">
                <asp:Image ID="ICON_Paciente" ImageUrl="~/Imagenes/ICON_paciente.png" runat="server" Height="54px" Width="54px" />
            </div>
            <asp:Label ID="lblTitulo" runat="server" Text="Listado de Pacientes" CssClass="titulo"></asp:Label>
            <div style="text-align:center; margin-bottom:15px;">
                <asp:Button ID="AgregarPaciente" runat="server" Text="Agregar un nuevo paciente" OnClick="AgregarPaciente_Click" CssClass="tamanioBoton" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="EliminarPaciente" runat="server" Text="Eliminar un paciente" OnClick="EliminarPaciente_Click" CssClass="tamanioBoton" />
            </div>
            <div style="text-align:center; margin-bottom:15px;">
                <asp:Label ID="lblBuscar" runat="server" Text="Buscar por:"></asp:Label>
                    <asp:DropDownList ID="ddlTipo" runat="server">
                        <asp:ListItem Selected="True" Value="id_pac">ID</asp:ListItem>
                        <asp:ListItem Value="dni_pac">DNI</asp:ListItem>
                        <asp:ListItem Value="nombre_pac">Nombre</asp:ListItem>
                        <asp:ListItem Value="apellido_pac">Apellido</asp:ListItem>
                    </asp:DropDownList>
                <asp:TextBox ID="tbBusqueda" runat="server" ValidationGroup="grupoBuscar"></asp:TextBox>
                <asp:Button ID="btBuscar" runat="server" Text="Buscar" OnClick="btBuscar_Click"/>
                <br />
                <asp:Label ID="lblErrorBusqueda" runat="server" ForeColor="Red" Visible="false"></asp:Label>
                <asp:CompareValidator ID="cvBusquedaID" runat="server" ControlToValidate="tbBusqueda" Operator="DataTypeCheck" Type="Integer" ErrorMessage="El ID de paciente debe ser un número entero válido." Text="*" ForeColor="Red" Display="Dynamic" ValidationGroup="grupoBuscar" Visible="False" />
                <asp:CompareValidator ID="cvBusquedaDNI" runat="server" ControlToValidate="tbBusqueda" Operator="DataTypeCheck" Type="Integer" ErrorMessage="El DNI debe contener solo números sin puntos ni espacios." Text="*" ForeColor="Red" Display="Dynamic" ValidationGroup="grupoBuscar" Visible="False" />
                <asp:ValidationSummary ID="vsErroresBuscar" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="grupoBuscar" />
            </div>
            <div style="overflow-x:auto;">
                <asp:GridView ID="gvPaciente" runat="server" CssClass="grid" AutoGenerateColumns="False" DataKeyNames="id_pac" AllowPaging="True" AutoGenerateEditButton="True"
                    OnPageIndexChanging="gvPaciente_PageIndexChanging"
                    OnRowEditing="gvPaciente_RowEditing"
                    OnRowCancelingEdit="gvPaciente_RowCancelingEdit"
                    OnRowUpdating="gvPaciente_RowUpdating"
                    OnRowDataBound="gvPaciente_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate><asp:Label runat="server" Text='<%# Eval("id_pac") %>'></asp:Label></ItemTemplate>
                            <EditItemTemplate><asp:Label runat="server" Text='<%# Eval("id_pac") %>'></asp:Label></EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="DNI">
                            <ItemTemplate><asp:Label runat="server" Text='<%# Eval("dni_pac") %>'></asp:Label></ItemTemplate>
                            <EditItemTemplate><asp:Label ID="lbl_dni" runat="server" Text='<%# Eval("dni_pac") %>'></asp:Label></EditItemTemplate>
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
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddl_nacionalidad" runat="server">
                                    <asp:ListItem Value="Argentina">Argentina</asp:ListItem>
                                    <asp:ListItem Value="Brasil">Brasil</asp:ListItem>
                                    <asp:ListItem Value="Chile">Chile</asp:ListItem>
                                    <asp:ListItem Value="Uruguay">Uruguay</asp:ListItem>
                                    <asp:ListItem Value="Paraguay">Paraguay</asp:ListItem>
                                    <asp:ListItem Value="Bolivia">Bolivia</asp:ListItem>
                                    <asp:ListItem Value="Otro">Otro</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="F. Nacimiento">
                            <ItemTemplate><asp:Label runat="server" Text='<%# Eval("fecha_nacimiento_pac", "{0:dd/MM/yyyy}") %>' TextMode="Date"></asp:Label></ItemTemplate>
                            <EditItemTemplate><asp:TextBox ID="txt_fechaNac" runat="server" Text='<%# Bind("fecha_nacimiento_pac", "{0:yyyy-MM-dd}") %>'></asp:TextBox></EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Direccion">
                            <ItemTemplate><asp:Label runat="server" Text='<%# Eval("direccion_pac") %>'></asp:Label></ItemTemplate>
                            <EditItemTemplate><asp:TextBox ID="txt_direccion" runat="server" Text='<%# Bind("direccion_pac") %>'></asp:TextBox></EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Localidad">
                            <ItemTemplate><asp:Label runat="server" Text='<%# Eval("nombre_loc") %>'></asp:Label></ItemTemplate>
                            <EditItemTemplate><asp:DropDownList ID="ddl_localidad" runat="server"></asp:DropDownList></EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate><asp:Label runat="server" Text='<%# Eval("email_pac") %>'></asp:Label></ItemTemplate>
                            <EditItemTemplate><asp:TextBox ID="txt_email" runat="server" Text='<%# Bind("email_pac") %>'></asp:TextBox></EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Telefono">
                            <ItemTemplate><asp:Label runat="server" Text='<%# Eval("telefono_pac") %>'></asp:Label></ItemTemplate>
                            <EditItemTemplate><asp:TextBox ID="txt_telefono" runat="server" Text='<%# Bind("telefono_pac") %>'></asp:TextBox></EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
          <tr>   
       <td>&nbsp;</td>
      <td>
          <%-- <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="btn-volver" OnClick="btnVolver_Click"  /> --%>
          <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="btn-volver" OnClick="btnVolver_Click" />
      <td>&nbsp;</td>
      
</tr>
    </form>
</body>
</html>
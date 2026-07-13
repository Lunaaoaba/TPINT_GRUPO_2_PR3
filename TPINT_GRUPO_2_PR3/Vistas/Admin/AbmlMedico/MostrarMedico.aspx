<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MostrarMedico.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.Vistas.MostrarMedico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Listado de Médicos</title>
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
                <asp:Image ID="ICON_Paciente" ImageUrl="~/Imagenes/ICON_medico.png" runat="server" Height="54px" Width="54px" />
            </div>
            <asp:Label ID="lblTitulo" runat="server" Text="Listado de Medicos" CssClass="titulo"></asp:Label>
            <div style="text-align:center; margin-bottom:15px;">
                <asp:Button ID="AgregarMedico" runat="server" Text="Agregar un nuevo medico" OnClick="AgregarMedico_Click" CssClass="tamanioBoton" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="EliminarMedico" runat="server" Text="Eliminar un Medico" OnClick="EliminarMedico_Click" CssClass="tamanioBoton" />
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
        <h2 class="titulo">
            Médicos Registrados
        </h2>
        <div class="mensaje">
            <asp:Label ID="lblMensaje" runat="server" ForeColor="Red"> </asp:Label>
        </div>
        <div style="overflow-x:auto;">
            <asp:GridView ID="gvMedicos" runat="server" CssClass="grid" AutoGenerateColumns="False" DataKeyNames="id_med" OnRowDeleting="gvMedicos_RowDeleting" AllowPaging="True" OnPageIndexChanging="gvMedicos_PageIndexChanging" AutoGenerateEditButton="True" OnRowEditing="gvMedicos_RowEditing">
                <Columns>
                    <asp:TemplateField HeaderText="ID Medico">
                        <EditItemTemplate>
                            <asp:Label ID="Edit_ID_Medico" runat="server" Text='<%# Bind("id_med") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_ID_Medico" runat="server" Text='<%# Bind("id_med") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Legajo">
                        <EditItemTemplate>
                            <asp:Label ID="Edit_Legajo_Med" runat="server" Text='<%# Bind("legajo_med") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Lbl_Legajo" runat="server" Text='<%# Bind("legajo_med") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DNI">
                        <EditItemTemplate>
                            <asp:Label ID="Edit_DNI_Med" runat="server" Text='<%# Bind("dni_med") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Lbl_DNI_Medico" runat="server" Text='<%# Bind("dni_med") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_Nombre_Y_Apellido" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Lbl_Nombre_Medico" runat="server" Text='<%# Bind("nombre_med") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Apellido">
                        <EditItemTemplate>
                            <asp:TextBox ID="Txt_Apellido_Medico" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Lbl_Apellido_Medico" runat="server" Text='<%# Bind("apellido_med") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sexo">
                        <EditItemTemplate>
                            <asp:DropDownList ID="Ddl_Sexo_Medico" runat="server">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Lbl_Sexo" runat="server" Text='<%# Bind("sexo_med") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nacionalidad">
                        <EditItemTemplate>
                            <asp:TextBox ID="Txt_Nacionalidad_Medico" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Lbl_Nacionalidad_Medico" runat="server" Text='<%# Bind("nacionalidad_med") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fecha de Nacimiento">
                        <ItemTemplate>
                            <asp:Label ID="Lbl_Fecha_Nacimiento_Medico" runat="server" Text='<%# Bind("fecha_nacimiento_med") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Direccion">
                        <EditItemTemplate>
                            <asp:TextBox ID="Txt_Direccion_Medico" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Lbl_Direccion_Medico" runat="server" Text='<%# Bind("direccion_med") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Localidad">
                        <EditItemTemplate>
                            <asp:DropDownList ID="Ddl_Localidad_Medico" runat="server">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Lbl_Localidad_Medico" runat="server" Text='<%# Bind("nombre_loc") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <EditItemTemplate>
                            <asp:TextBox ID="Txt_Email_Medicos" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Lbl_Email_Medico" runat="server" Text='<%# Bind("email_med") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Telefono">
                        <EditItemTemplate>
                            <asp:TextBox ID="Txt_Telefono_Medico" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Lbl_Telefono_Medico" runat="server" Text='<%# Bind("telefono_med") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Especialidad">
                        <EditItemTemplate>
                            <asp:DropDownList ID="Ddl_Especialidad_Medico" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Lbl_Especialidad_Medico" runat="server" Text='<%# Bind("nombre_esp") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Horaio de Atención">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_Horario_Med" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <br />
        <div style="text-align:center;">
            <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="btn-volver" OnClick="btnVolver_Click" />
        </div>
    </div>
</form>
</body>
</html>
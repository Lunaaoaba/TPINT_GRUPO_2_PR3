<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificarMedico.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.Vistas.AbmlMedico.ModificarMedico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Modificar Médico</title>
    <style>

body{
background:#277343;
font-family:Arial, Helvetica, sans-serif;
margin:0;
padding:30px;
}

#contenedor{
width:95%;
max-width:1200px;
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
}

.mensaje{
text-align:center;
margin-bottom:15px;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="contenedor">
            <div style="text-align:center;">
                <asp:Label ID="lblNombreUsuarioModificar" runat="server">| Nombre Usuario |</asp:Label>
            </div>
            <h2 class="titulo">
                Modificar Datos de Médicos
            </h2>
            <div class="mensaje">
                <asp:Label ID="lblMensajeModificar" runat="server" ForeColor="Red"> </asp:Label>
            </div>
            <div style="overflow-x:auto;">
    <asp:GridView ID="gvMedicosModificar" runat="server" CssClass="grid" AutoGenerateColumns="False" DataKeyNames="id_med" AllowPaging="True" OnPageIndexChanging="gvMedicosModificar_PageIndexChanging" AutoGenerateEditButton="True" OnRowCancelingEdit="gvMedicosModificar_RowCancelingEdit" OnRowEditing="gvMedicosModificar_RowEditing" OnRowUpdating="gvMedicosModificar_RowUpdating">
        <Columns>
            <asp:TemplateField HeaderText="ID Medico">
                <ItemTemplate>
                    <asp:Label ID="lbl_Item_IDMedico" runat="server" Text='<%# Eval("id_med") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="lbl_Edit_IDMedico" runat="server" Text='<%# Bind("id_med") %>'></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DNI">
                <ItemTemplate>
                    <asp:Label ID="lbl_Item_DNI" runat="server" Text='<%# Eval("dni_med") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="lbl_Edit_DNI" runat="server" Text='<%# Bind("dni_med") %>'></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nombre">
                <ItemTemplate>
                    <asp:Label ID="lbl_Item_Nombre" runat="server" Text='<%# Eval("nombre_med") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_Edit_Nombre" runat="server" Text='<%# Bind("nombre_med") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Apellido">
                <ItemTemplate>
                    <asp:Label ID="lbl_Item_Apellido" runat="server" Text='<%# Eval("apellido_med") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_Edit_Apellido" runat="server" Text='<%# Bind("apellido_med") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Legajo">
                <ItemTemplate>
                    <asp:Label ID="lbl_Item_Legajo" runat="server" Text='<%# Eval("legajo_med") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_Edit_Legajo" runat="server" Text='<%# Bind("legajo_med") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sexo">
                <ItemTemplate>
                    <asp:Label ID="lbl_Item_Sexo" runat="server" Text='<%# Eval("sexo_med") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_Edit_Sexo" runat="server" Text='<%# Bind("sexo_med") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nacionalidad">
                <ItemTemplate>
                    <asp:Label ID="lbl_Item_Nacionalidad" runat="server" Text='<%# Eval("nacionalidad_med") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_Edit_Nacionalidad" runat="server" Text='<%# Bind("nacionalidad_med") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="F Nacimiento">
                <ItemTemplate>
                    <asp:Label ID="lbl_Item_FNacimiento" runat="server" Text='<%# Eval("fecha_nacimiento_med", "{0:dd/MM/yyyy}") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_Edit_FNacimiento" runat="server" Text='<%# Bind("fecha_nacimiento_med") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Direccion">
                <ItemTemplate>
                    <asp:Label ID="lbl_Item_Direccion" runat="server" Text='<%# Eval("direccion_med") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_Edit_Direccion" runat="server" Text='<%# Bind("direccion_med") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <asp:Label ID="lbl_Item_Email" runat="server" Text='<%# Eval("email_med") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_Edit_Email" runat="server" Text='<%# Bind("email_med") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Telefono">
                <ItemTemplate>
                    <asp:Label ID="lbl_Item_Telefono" runat="server" Text='<%# Eval("telefono_med") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_Edit_Telefono" runat="server" Text='<%# Bind("telefono_med") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ID Localidad">
                <ItemTemplate>
                    <asp:Label ID="lbl_Item_Localidad" runat="server" Text='<%# Eval("id_loc") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_Edit_Localidad" runat="server" Text='<%# Bind("id_loc") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ID Especialidad">
                <ItemTemplate>
                    <asp:Label ID="lbl_Item_Especialidad" runat="server" Text='<%# Eval("id_esp") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_Edit_Especialidad" runat="server" Text='<%# Bind("id_esp") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            </Columns>
                </asp:GridView>
            </div>
            </div>
            <br />
            <div style="text-align:center;">
                <asp:Button ID="btnVolverModificar" runat="server" Text="Volver" OnClick="btnVolverModificar_Click" />
            </div>
        </div>
    </form>
</body>
</html>
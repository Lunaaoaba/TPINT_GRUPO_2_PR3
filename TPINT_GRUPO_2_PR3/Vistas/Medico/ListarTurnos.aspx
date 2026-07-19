<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListarTurnos.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.Vistas.Medico.ListarTurnos" %>
<%@ Register TagPrefix="uc" TagName="BarraSuperior" Src="~/Vistas/BarraSuperior.ascx" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Mis Turnos</title>
    <style>
        body { background-color:#277343; font-family:Arial, sans-serif; }
        #contenedor { width: max-content; margin: 30px auto; background:white; padding:20px; border-radius:8px; }
        .grid { width:100%; border-collapse:collapse; }
        .grid th { background:#277343; color:white; padding:8px; text-align:center; }
        .grid td { padding:6px; border:1px solid #ddd; text-align:center; }
        .filtro { margin-bottom:12px; }
        .btn { padding:6px 12px; background:#277343; color:white; border:none; border-radius:4px; cursor:pointer; }
        .btn-secondary { background:#777; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc:BarraSuperior ID="BarraSuperior1" runat="server" />
        <div id="contenedor">
            <h2 style="color:#277343; text-align:center;">Mis Turnos</h2>

            <div class="filtro" style="text-align:center; margin-bottom:15px;">
                <asp:Label ID="lblBuscar" runat="server" Text="Buscar por:"></asp:Label>
                <asp:DropDownList ID="ddlTipo" runat="server">
                    <asp:ListItem Selected="True" Value="dni_pac">DNI</asp:ListItem>
                    <asp:ListItem Value="nombre_pac">Nombre</asp:ListItem>
                    <asp:ListItem Value="apellido_pac">Apellido</asp:ListItem>
                </asp:DropDownList>

                <asp:TextBox ID="tbBusqueda" runat="server" ValidationGroup="grupoBuscar"></asp:TextBox>
                <asp:Button ID="btBuscar" runat="server" Text="Buscar" OnClick="btBuscar_Click" CssClass="btn" ValidationGroup="grupoBuscar" />
                &nbsp;&nbsp;
                <asp:Label ID="lblErrorBusqueda" runat="server" ForeColor="Red" Visible="false"></asp:Label>
                <asp:CompareValidator ID="cvBusquedaID" runat="server" ControlToValidate="tbBusqueda" Operator="DataTypeCheck" Type="Integer" ErrorMessage="El ID debe ser un número entero válido." Text="*" ForeColor="Red" Display="Dynamic" ValidationGroup="grupoBuscar" Visible="False" />
                <asp:CompareValidator ID="cvBusquedaDNI" runat="server" ControlToValidate="tbBusqueda" Operator="DataTypeCheck" Type="Integer" ErrorMessage="El DNI debe contener solo números sin puntos ni espacios." Text="*" ForeColor="Red" Display="Dynamic" ValidationGroup="grupoBuscar" Visible="False" />

                &nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Label ID="Label3" runat="server" Text="Estado: "></asp:Label>
                <asp:DropDownList ID="ddlEstado" runat="server">
                    <asp:ListItem Value="Todos" Selected="True">Todos</asp:ListItem>
                    <asp:ListItem Value="PENDIENTE">PENDIENTE</asp:ListItem>
                    <asp:ListItem Value="PRESENTE">PRESENTE</asp:ListItem>
                    <asp:ListItem Value="AUSENTE">AUSENTE</asp:ListItem>
                </asp:DropDownList>

                &nbsp;
                <asp:Button ID="btLimpiar" runat="server" Text="Limpiar" CssClass="btn btn-secondary" OnClick="btLimpiar_Click" CausesValidation="False" Visible="False" />
                <asp:ValidationSummary ID="vsErroresBuscar" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="grupoBuscar" />
            </div>

            <asp:Label ID="lblMensaje" runat="server" ForeColor="Red"></asp:Label>

            <div style="overflow-x:auto;">
                <asp:GridView ID="gvTurnos" runat="server" CssClass="grid" AutoGenerateColumns="False" DataKeyNames="id_tur"
    AllowPaging="True" PageSize="10" OnPageIndexChanging="gvTurnos_PageIndexChanging"
    OnRowEditing="gvTurnos_RowEditing" OnRowCancelingEdit="gvTurnos_RowCancelingEdit" OnRowUpdating="gvTurnos_RowUpdating"
    OnRowDataBound="gvTurnos_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="id_tur" HeaderText="ID" Visible="False" ReadOnly="True" />
                        <asp:BoundField DataField="fecha_tur" HeaderText="Fecha" DataFormatString="{0:yyyy-MM-dd}" ReadOnly="True" />
                        <asp:BoundField DataField="hora_tur" HeaderText="Hora" ReadOnly="True" />
                        <asp:TemplateField HeaderText="Paciente">
                            <ItemTemplate>
                                <%# Eval("nombre_pac") + " " + Eval("apellido_pac") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="dni_pac" HeaderText="DNI" ReadOnly="True" />
                        <asp:TemplateField HeaderText="Estado">
                            <ItemTemplate>
                                <asp:Label ID="lblEstado" runat="server" Text='<%# Eval("estado_tur") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlEstadoEdit" runat="server">
                                    <asp:ListItem Value="PENDIENTE">PENDIENTE</asp:ListItem>
                                    <asp:ListItem Value="PRESENTE">PRESENTE</asp:ListItem>
                                    <asp:ListItem Value="AUSENTE">AUSENTE</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Observación">
                            <ItemTemplate>
                                <asp:Label ID="lblObs" runat="server" Text='<%# Eval("observacion_tur") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtObservacionEdit" runat="server" Text='<%# Eval("observacion_tur") %>' MaxLength="500" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" />
                    </Columns>
                </asp:GridView>
            </div>

            <div style="text-align:center; margin-top:12px;">
                <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="btn btn-secondary" OnClick="btnVolver_Click" />
            </div>
        </div>
    </form>
</body>
</html>
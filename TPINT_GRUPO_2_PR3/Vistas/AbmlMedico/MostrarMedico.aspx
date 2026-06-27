<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MostrarMedico.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.Vistas.MostrarMedico" %>

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
    width: 330px;
    padding: 20px 30px;
    border-radius: 8px;
    box-sizing: border-box;
    margin: 0 auto;
}
.grid {
    width: 100%;
    border-collapse: collapse;
}

.grid th{
    background:#277343;
    color:white;
    padding:8px;
}

.grid td{
    padding:6px;
    border:1px solid #ddd;
}

.grid tr:nth-child(even){
    background:#f5f5f5;
}
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="contenedor">
            
                <table class="tablaHL">
                    <tr>
                        <%--jaja ola k asia--%>
                        <td class="tdHL">
                           <td class="auto-style6"> <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label> </td>
        <table class="auto-style1">
                               Listado de Medicos<tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td colspan="2" rowspan="2">
                    <asp:GridView ID="gvMedicos" runat="server" cssClass="grid">
                        <FooterStyle BackColor="White" ForeColor="#333333" />
                        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="White" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#487575" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#275353" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
                               </div>
    </form>
</body>
</html>

<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BarraSuperior.ascx.cs" Inherits="TPINT_GRUPO_2_PR3.Vistas.BarraSuperior" %>

<style>
.bs-wrapper { width:100%; padding:12px 0; box-sizing:border-box; }
.bs-bar {
  max-width:1100px;
  margin:12px auto !important;
  background-color:#ffffff !important;
  border:1px dotted #d0d0d0 !important;
  border-radius:8px !important;
  padding:10px 16px !important;
  display:flex !important;
  align-items:center !important;
  justify-content:space-between !important;
  box-shadow:0 1px 0 rgba(0,0,0,0.06) !important;
  font-family:Arial,Helvetica,sans-serif !important;
  font-size:14px !important;
  z-index:9999 !important;
  opacity:1 !important;
}
.bs-left, .bs-center, .bs-right { display:flex; align-items:center; }
.bs-center { flex:1; justify-content:center; }
.bs-left img { width:40px; height:40px; margin-right:12px; object-fit:cover; border-radius:4px; }
.bs-links a { color:#333; text-decoration:none; margin-right:12px; }
.bs-user { margin-right:10px; font-weight:700; }
.bs-logout { padding:5px 10px; height:30px; cursor:pointer; }
</style>

<div class="bs-wrapper">
  <div class="bs-bar" role="banner">
    <div class="bs-left">
      <asp:Image ID="imgLogo" runat="server" ImageUrl="~/Imagenes/logo.png" AlternateText="Icono Clínica" />
      <nav class="bs-links" aria-label="Navegación principal">
        <a href="#"> ← easter egg (incompleto) </a>
        <a href="#"></a>
      </nav>
    </div>

    <div class="bs-center">
      
    </div>

    <div class="bs-right">
      <span class="bs-user"><asp:Label ID="lblNombreUsuario" runat="server" /></span>
      <asp:Button ID="btnCerrarSesion" runat="server" CssClass="bs-logout" Text="Cerrar Sesión" OnClick="btnCerrarSesion_Click" CausesValidation="False" />
    </div>
  </div>
</div>
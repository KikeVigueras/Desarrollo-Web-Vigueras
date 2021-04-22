<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarUser.aspx.cs" Inherits="UTTT.Ejemplo.Persona.AgregarUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <title></title>
</head>
<body class="bg-light">
    
         <div class="row justify-content-md-center mt-3">
            <div class="col-md-6">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Label runat="server" ID="lblAccion"></asp:Label>
        <asp:Label runat="server" ID="lblError"></asp:Label>

<%--        <asp:DropDownList  runat="server"></asp:DropDownList>--%>
        <asp:DropDownList ID="ddlPersona" runat="server" class="btn btn-secondary dropdown-toggle" ype="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" Height="35px" Width="271px"></asp:DropDownList>
       <div class="row justify-content-md-center mt-3">
        <div class="col-md-6">
        <asp:TextBox runat="server" ID="txtPersonaEditar" ReadOnly="true"  ViewStateMode="Disabled" Visible="false" CssClass="form-control"></asp:TextBox>
        </div>
   <dt> Usuario:</dt>
        <asp:TextBox runat="server" ID="txtNombreUsuario" CssClass="form-control" placeholder="Nombre de Usuario" MaxLength="20"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNombreUsuario" EnableClientScript="False" ErrorMessage="Es obligatorio llenar este campo" ValidationGroup="validarFormulario"></asp:RequiredFieldValidator>
        <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="txtNombreUsuario" EnableClientScript="False" ErrorMessage="El formato no acepta dos espacios" OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="validarFormulario"></asp:CustomValidator>
 <dt>Contraseña:</dt>
        <asp:TextBox runat="server" ID="txtContrasena" CssClass="form-control" placeholder="Contraseña" MaxLength="20"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtContrasena" EnableClientScript="False" ErrorMessage="Favor de Llenar este campo" ValidationGroup="validarFormulario"></asp:RequiredFieldValidator>
        <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="txtContrasena" EnableClientScript="False" ErrorMessage="El formato no acepta dos espacios" OnServerValidate="CustomValidator2_ServerValidate" ValidationGroup="validarFormulario"></asp:CustomValidator>
 <dt>Confirmacion de Contraseña:</dt>
        <asp:TextBox runat="server" ID="txtContrasena2" CssClass="form-control" placeholder="Confirmar contraseña" MaxLength="20"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtContrasena2" EnableClientScript="False" ErrorMessage="Es obligatorio llenar este campo" ValidationGroup="validarFormulario"></asp:RequiredFieldValidator>
        <asp:CustomValidator ID="CustomValidator3" runat="server" ControlToValidate="txtContrasena2" EnableClientScript="False" ErrorMessage="El formato no acepta dos espacios" OnServerValidate="CustomValidator3_ServerValidate" ValidationGroup="validarFormulario"></asp:CustomValidator>
        <asp:CustomValidator ID="CustomValidator4" runat="server" ControlToValidate="txtContrasena2" EnableClientScript="False" ErrorMessage="Las contraseñas no Coinciden" OnServerValidate="CustomValidator4_ServerValidate" ValidationGroup="validarFormulario"></asp:CustomValidator>
        <asp:DropDownList runat="server" ID="ddlEstado" CssClass="form-control" Visible="false"></asp:DropDownList>
        <dt>Favor de Ingresar la Contraseña:</dt>
           <asp:TextBox runat="server" ID="txtFechaIngreso" CssClass="form-control" autocomplete="off" ViewStateMode="Disabled" placeholder="Fecha de ingreso"></asp:TextBox>
       
           <ajaxToolkit:CalendarExtender ID="cdlFechaInicio" runat="server" Format="dd/MM/yyyy" TargetControlID="txtFechaIngreso" />
        <asp:Button runat="server" ID="btnAceptar" Text="Aceptar" ViewStateMode="Disabled" CssClass="btn btn-block create-account" OnClick="btnAceptar_Click" ValidationGroup="validarFormulario" />
        <a class="btn btn-block create-account" href="AgregarUser.aspx">Cancelar</a>
        <a href="UsuarioPrinc.aspx" class="btn btn-link">Volver.</a>
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecPass.aspx.cs" Inherits="UTTT.Ejemplo.Persona.RecPass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <title></title>
</head>
<body>
      <div class="row justify-content-md-center mt-3">
            <div class="col-md-6"> 
    <form id="form1" runat="server">
        
            <asp:Label ID="lblError" runat="server" CssClass="text-danger"></asp:Label>
          
            <asp:TextBox runat="server" ID="txtCorreo" ViewStateMode="Disabled" ReadOnly="true" CssClass="form-control" ></asp:TextBox>
            </div>
            </div>

            <asp:TextBox runat="server" ID="txtPersona" ViewStateMode="Disabled" ReadOnly="true"></asp:TextBox>
            <asp:TextBox runat="server" ID="txtNombreUsuario" ViewStateMode="Disabled" ReadOnly="true"></asp:TextBox>
            <asp:TextBox runat="server" ID="txtContrasena" ViewStateMode="Disabled" TextMode="Password" MaxLength="20" placeholder="Confirmar contraseña"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtContrasena" EnableClientScript="False" ErrorMessage="El campo contraseña es requerido" ValidationGroup="validarFormulario"></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="txtContrasena" EnableClientScript="False" ErrorMessage="Este campo no puede tener más de 2 espacios seguidos!!" OnServerValidate="CustomValidator2_ServerValidate" ValidationGroup="validarFormulario"></asp:CustomValidator>
            <asp:TextBox runat="server" ID="txtContrasena2" ViewStateMode="Disabled" TextMode="Password" MaxLength="20" placeholder="Confirmar contraseña"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtContrasena2" EnableClientScript="False" ErrorMessage="El segundo campo de contraseña es requerido" ValidationGroup="validarFormulario"></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidator3" runat="server" ControlToValidate="txtContrasena2" EnableClientScript="False" ErrorMessage="Formato invalid" OnServerValidate="CustomValidator3_ServerValidate" ValidationGroup="validarFormulario"></asp:CustomValidator>
            <asp:CustomValidator ID="CustomValidator4" runat="server" ControlToValidate="txtContrasena2" EnableClientScript="False" ErrorMessage="Las contraseñas ingresadas deben ser iguales" OnServerValidate="CustomValidator4_ServerValidate" ValidationGroup="validarFormulario"></asp:CustomValidator>
            <asp:Button runat="server" Text="Cambiar contraseña" ID="btnReestablecerContrasena" ValidationGroup="validarFormulario" OnClick="btnReestablecerContrasena_Click" />
            <a href="Login.aspx" class="btn btn-link">Regresar</a>




    </form>
</body>
</html>

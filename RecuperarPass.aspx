<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecuperarPass.aspx.cs" Inherits="UTTT.Ejemplo.Persona.RecuperarPass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <title></title>
</head>
<body>
    &nbsp;<center>
        <br />
        <br />
        <br />
        <br />
        <br />
        
        <br />
        <asp:Label ID="lblError" runat="server"></asp:Label>
  <div class="row justify-content-md-center mt-3">
            <div class="col-md-6"> 
    <form id="form2" runat="server">
        
        
       
                         <asp:TextBox runat="server" ID="txtCorreo" ViewStateMode="Disabled" TextMode="Email" placeholder="Correo electrónico" CssClass="form-control"></asp:TextBox>

     </div>
     </div>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCorreo" EnableClientScript="False" ErrorMessage="Para poder recuperar contraseña ingresa un correo."></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtCorreo" EnableClientScript="False" ErrorMessage="Favor de ingresar un correo Valido." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        
        <br />
        <asp:Button runat="server" Text="Enviar correo" ID="btnCorreo" OnClick="btnCorreo_Click" CssClass="btn btn-danger" />
        <a href="Login.aspx" class="btn btn-link">Volver.</a>

       







    </center>

    </form>
</body>
</html>

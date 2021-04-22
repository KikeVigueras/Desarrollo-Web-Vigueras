<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UTTT.Ejemplo.Persona.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
  
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 75px;
            height: 64px;
        }
        .auto-style3 {
            width: 85px;
            height: 43px;
        }
    </style>
</head>

<body class="bg-light">

    <br >
    <br >
    <br >
    <br >
   <center>
       <div class="row justify-content-md-center mt-3">
            <div class="col-md-6">
    <div class="col-sm-12 col-md-12 col-lg-12">
        <dt>Introduce tu Usuario:</dt>
        </div>
    <form id="form1" runat="server">
        <div class="row justify-content-md-center mt-3">
        <div class="col-md-6">  
       <asp:Label ID="lblError" runat="server" CssClass="text-danger"></asp:Label>
        <asp:TextBox runat="server" ID="txtNombreUsuario" MaxLength="20" ViewStateMode="Disabled" placeholder="Nombre de Usuario" CssClass="form-control"  ></asp:TextBox>
         
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNombreUsuario" EnableClientScript="False" ErrorMessage="Favor de escribir un Usuario Valido para ingresar."></asp:RequiredFieldValidator>

            </div>

    <br >
        <div class="col-sm-12 col-md-12 col-lg-12">
        <dt>Introduce tu Contraseña:</dt>
        </div>
        <div class="row justify-content-md-center mt-3">
        <div class="col-md-6">  
        <asp:TextBox runat="server" ID="txtContrasena" MaxLength="20" ViewStateMode="Disabled" TextMode="Password" placeholder="Contraseña" CssClass="form-control" ></asp:TextBox>
          </div>
     <div>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtContrasena" EnableClientScript="False" ErrorMessage="Favor de escribir una Contraseña valida para ingresar."></asp:RequiredFieldValidator>
    </div>
    <br >
        <div class="col-sm-12 col-md-12 col-lg-12">
         <asp:Button runat="server" Text="Iniciar sesión" ID="btnIngresar" OnClick="btnIngresar_Click" CssClass="btn btn-danger"  />
             
            
        </div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <img class="auto-style2" src="Images/9d88c9264a0fddfbcfdc83475f13dd83--jean-marie-group.jpg" /><img class="auto-style3" src="Images/PFUM3DDWHJG4RE56PL277TA7NA.jpg" /><br ><a href="RecuperarPass.aspx" >En caso de no recordar tu contraseña, dar Click Aqui!</a>

        </div>
  </div>
        </div>

    </form>
       </center>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaginaPrincipal.aspx.cs" Inherits="UTTT.Ejemplo.Persona.PaginaPrincipal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 90px;
            height: 95px;
        }
    </style>
</head>
<body class="bg-light">




    <body class="bg-light">
   <div class="container  text-white">
        <nav class="navbar navbar-dark bg-primary" >
            <div class="container-fluid">
                <h1>Bienvendio a la Pagina Principal</h1>
               
                
          

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                                <asp:Label ID="lblUser" runat="server"></asp:Label>
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="Login.aspx?logout=true">Cerrar sesión</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
   
   <center>
       <div class="row justify-content-md-center mt-3">
            <div class="col-md-6">

    <br />
        <br />
        <br />
    <center>



    <a href="PersonaPrincipal.aspx" class="btn btn-orange"> <dt>Personas:</dt><a href="UsuarioPrinc.aspx" class="btn btn-red"><img class="auto-style1" src="Images/perfil.png" /></a></a>
        <br />
        <br />
        

    <a href="UsuarioPrinc.aspx" class="btn btn-red"><dt>Asignacion de Roles :</dt></a><img class="auto-style1" src="Images/perfil.png" /></a></a>

    
    <br >
    <br >

        <br />
        <br />
   
        <br />
        <br />
        <br /> 
        
        <div class="container  text-white">
        <nav class="navbar navbar-dark bg-primary" >
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Número de Atencion a Clientes: 5580926013</a>
                <a class="navbar-brand" href="#">Horarios 7:00 am - 5:00 pm</a>
                <a class="navbar-brand" href="Login.aspx">Salir.</a>
                
          

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                                <asp:Label ID="Label1" runat="server"></asp:Label>
                            </a>
                            
                                
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    </center>   


</body>
</html>

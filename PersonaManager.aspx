<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonaManager.aspx.cs" Inherits="UTTT.Ejemplo.Persona.PersonaManager" debug=false%>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .error {
            border-color: red;
        }
        input:focus {
            outline: none;
        }
        .visible {
            display: none !important;
        }
    </style>
</head>
<body class="bg-light">
    <div class="container-fluid">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div style="font-family: Arial; font-size: medium; font-weight: bold" dir="ltr">
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Persona</div>

        

          <div class="row justify-content-md-center">
           <div class="col-md-6">
              <asp:Label ID="lblAccion" runat="server" Text="Accion" Font-Bold="True"></asp:Label>
        
              
        
  
            <div>

        <div > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <center>
           <div class="row justify-content-md-center mt-3">
            <div class="col-md-6">
                <div class="mb-3">
            <dt>Sexo:</dt>
            <asp:DropDownList ID="ddlSexo" runat="server"
               
                OnSelectedIndexChanged="ddlSexo_SelectedIndexChanged" Height="42px" Width="253px" class="btn btn-secondary dropdown-toggle">
            </asp:DropDownList>
       
            </div>
            <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="ddlSexo" EnableClientScript="False" ErrorMessage="Este campo es obligatorio." OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
    </div>
 
        </div>
        
        <div> 
        <center>
        <div class="row justify-content-md-center mt-3">
            <div class="col-md-6">
                <div class="mb-3">
            <dt>Clave Unica:</dt>
<%--            <asp:TextBox ID="txtClaveUnica" runat="server" Width="249px" ViewStateMode="Disabled" CssClass="form-control" ></asp:TextBox>--%>
             <asp:TextBox   ID="txtClaveUnica"  runat="server"  MaxLength="20" ViewStateMode="Disabled"  placeholder="Clave Unica" CssClass="form-control" ></asp:TextBox>

        </div>
            </div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtClaveUnica" EnableClientScript="False" ErrorMessage="Este dato es Obligatorio."></asp:RequiredFieldValidator>
        
     <div class="row justify-content-md-center mt-3">
            <div class="col-md-6">
                <div class="mb-3"> 
             <dt>Nombre:</dt>
        <asp:TextBox  ID="txtNombre"  runat="server"  MaxLength="20" ViewStateMode="Disabled"  placeholder="Nombre" CssClass="form-control" ></asp:TextBox>

          </div>
        
        
        </div>
        
           
        
               
       
            &nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtNombre" EnableClientScript="False" ErrorMessage="Este campo es Obligatorio."></asp:RequiredFieldValidator>
        
                     
        
            </div>
       </div>
       
          <center>  
      <div class="row justify-content-md-center mt-3">
        <div class="col-md-6">          
             <dt>Apellido Paterno:</dt>
            <asp:TextBox   ID="txtAPaterno" runat="server"  MaxLength="20" ViewStateMode="Disabled"  placeholder="Apelleido Paterno" CssClass="form-control" ></asp:TextBox>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAPaterno" EnableClientScript="False" ErrorMessage="Este campo es Obligatorio."></asp:RequiredFieldValidator>
        </div>
       
        <div>
        
       <div class="row justify-content-md-center mt-3">
        <div class="col-md-6"> 
            <dt>Apellido Materno:</dt>
          
                    <asp:TextBox   ID="txtAMaterno" runat="server"  MaxLength="20" ViewStateMode="Disabled"  placeholder="Apellido Materno" CssClass="form-control" ></asp:TextBox>

        </div>
      
    <div style="height: 583px"> 
    
    <%--</div>
        <br>
    <div>
     --%>&nbsp;<div align="center">
         
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         
         
            <div align="center">
                <asp:Calendar ID="cal_Calendar" runat="server" Visible="False"></asp:Calendar>
            </div>
        </div>
        <center>
            <div class="col-md-6"> 
        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="idtxtfecha" PopupButtonID="btnfecha" Format="dd/MM/yyyy"  />
             <div style="margin-left: ">
                 <dt>Fecha:</dt>
          <asp:Button ID="btnfecha" runat="server" Height="34px" Width="56px" Text="Fecha" />

          <asp:TextBox ID="idtxtfecha" runat="server" MaxLength="10" CssClass="form-control"  ></asp:TextBox>
               
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%--<asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="idtxtfecha" EnableClientScript="False" ErrorMessage="RegularExpressionValidator"></asp:RegularExpressionValidator>--%>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<ajaxToolkit:CalendarExtender ID="IdFecha_CalendarExtender" runat="server" Format="dd/MM/yyyy" TargetControlID="idtxtfecha" PopupButtonID="btnfecha" />
            <%--<ajaxToolkit:CalendarExtender ID="" runat="server" Format="dd/MM/yyyy" TargetControlID="IdFecha" PopupButtonID="btnfecha"/>--%>

            
<asp:Label ID="txtMensaje" runat="server" Text="Label" Visible="False"  Height="21px"></asp:Label>
           
           
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="idestadocivil" runat="server" runat="server" class="btn btn-secondary dropdown-toggle" ype="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" Height="35px" Width="271px">
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
           
          <center>
    <div class="row justify-content-md-center mt-3">
        <div class="col-md-6"> 
             <dt>No. Hermanos:</dt>
                 <asp:TextBox   ID="txtnumeroHermanos" runat="server"  MaxLength="2" ViewStateMode="Disabled"  placeholder="No. Hermanos" CssClass="form-control" ></asp:TextBox>
 
        
        </div>
    </div>
         
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtnumeroHermanos" EnableClientScript="False" ErrorMessage="Solo números" ForeColor="Blue" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtnumeroHermanos" EnableClientScript="False" ErrorMessage="Este campo es Obligatorio."></asp:RequiredFieldValidator>
            
              
              
              
               <dt>Correo:</dt>
              <%--<asp:TextBox runat="server" Width="243px"></asp:TextBox>--%>
             <asp:TextBox  ID="txtcorreoElectronico"   runat="server"  MaxLength="25" ViewStateMode="Disabled"  placeholder="E-Mail" CssClass="form-control" ></asp:TextBox>









            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtcorreoElectronico" EnableClientScript="False" ErrorMessage="No es valido." ForeColor="Blue" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            &nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtcorreoElectronico" EnableClientScript="False" ErrorMessage="Este campo es Obligatorio."></asp:RequiredFieldValidator>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           
              
              
              
              
              
<%--              <asp:TextBox ID="txtcodigoPostal" runat="server" Width="243px"></asp:TextBox>--%>
                    <dt>Codigo Postal:</dt>       
              <asp:TextBox  ID="txtcodigoPostal"   runat="server"  MaxLength="20" ViewStateMode="Disabled"  placeholder="Codigo Postal:" CssClass="form-control" ></asp:TextBox>





            &nbsp;
            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtcodigoPostal" EnableClientScript="False" ErrorMessage="No valido." ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtcodigoPostal" EnableClientScript="False" ErrorMessage="Formato Invalido del CP." ValidationExpression="^[0-5][1-9]{3}[0-9]$"></asp:RegularExpressionValidator>
&nbsp;<asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="txtcodigoPostal" EnableClientScript="False" ErrorMessage="El rango valido es de 5 caracteres." OnServerValidate="CustomValidator2_ServerValidate"></asp:CustomValidator>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtcodigoPostal" EnableClientScript="False" ErrorMessage="Este campo es Obligatorio"></asp:RequiredFieldValidator>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           
             <dt>RFC:</dt>       
              <asp:TextBox  ID="txtRFC"  runat="server"  MaxLength="20" ViewStateMode="Disabled"  placeholder="RFC:" CssClass="form-control" ></asp:TextBox>
              
<%--            <asp:TextBox ID="txtRFC" runat="server" Width="243px"></asp:TextBox>--%>






            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtRFC" EnableClientScript="False" ErrorMessage="Incorrecto" ForeColor="Blue" ValidationExpression="^([A-ZÑ\x26]{3,4}([0-9]{2})(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1]))([A-Z\d]{3})?$"></asp:RegularExpressionValidator>
          
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtRFC" EnableClientScript="False" ErrorMessage="Este campo es Obligatorio."></asp:RequiredFieldValidator>
           
        </div>
      <center>
        <asp:Button ID="btnAceptar" runat="server" Text="Aceptar"  BackColor="#58FA58" 
            onclick="btnAceptar_Click" ViewStateMode="Disabled" CssClass="btn btn-danger"  />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" BackColor="#FE2E2E"
            onclick="btnCancelar_Click" ViewStateMode="Disabled" CssClass="btn btn-danger"  />
        </center>
     </div>
    </center>
    </form>
</body>
</html>

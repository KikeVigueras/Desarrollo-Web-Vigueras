<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonaPrincipal.aspx.cs" Inherits="UTTT.Ejemplo.Persona.PersonaPrincipal"  debug=false%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <title></title>
</head>
<body class="bg-light">
    
         <div class="row justify-content-md-center mt-3">
            <div class="col-md-6">
    <form id="form1" runat="server">
    
    <div style="color: #000000; font-size: medium; font-family: Arial; font-weight: bold">    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Persona<br />
        
        </div>
    

        
    <p> 
       <div class="row justify-content-md-center mt-3">
        <div class="col-md-6">  
           <%-- <asp:TextBox ID="txtNombre"  Align="Center"  runat="server" Width="266px" OnTextChanged="txtNombre_TextChanged"  placeholder="Nombre" 
            ViewStateMode="Disabled" AutoPostBack="false" Height="21px" CssClass="form-control"></asp:TextBox></div>--%>
         <dt>Buscar</dt>  
            <asp:TextBox runat="server" ID="txtNombre"  MaxLength="20" ViewStateMode="Disabled" placeholder="Nombre de Usuario" CssClass="form-control"  ></asp:TextBox>

      </div>
    &nbsp;<asp:ScriptManager runat="server"></asp:ScriptManager>
          <asp:UpdatePanel ID="paneltxtName" runat="server">
             <ContentTemplate>

        <%--<asp:TextBox ID="txtNombre" runat="server" Width="266px" OnTextChanged="txtNombre_TextChanged"
            ViewStateMode="Disabled" AutoPostBack="true"></asp:TextBox>--%>
                 <asp:Button style="display:none;" runat="server" OnClick="Unnamed_Click" ID="BtnBus"/>
                  </ContentTemplate>
              </asp:UpdatePanel>

       
      
    </p>
    </div>
    <div id="idBusqueda"  >
    
     
    
         
        <div class="row justify-content-md-center mt-3">
        <div class="col-md-6">  
       <dt>Genero:</dt> 
        <asp:DropDownList ID="ddlSexo" runat="server" Height="42px" Width="253px" class="btn btn-secondary dropdown-toggle" ype="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
        </asp:DropDownList>
        </div>
       </div>
       
       
        <br />
        <div class="row justify-content-md-center mt-3">
        <div class="col-md-6">
        <dt>Busqueda por Estado Civil:</dt> 
        <asp:DropDownList ID="idBusqueda" runat="server" class="btn btn-secondary dropdown-toggle" ype="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        </asp:DropDownList>
        </div>
       </div>
        <br />
        <br />
        <center>
         <div class="col-md-6">
              <asp:Button ID="btnAgregar" runat="server" Text="Agregar" BackColor="#FE2E2E"
            onclick="btnAgregar_Click" ViewStateMode="Disabled" CssClass="btn btn-danger"/>
            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" BackColor="#58FA58" onclick="btnBuscar_Click" ViewStateMode="Disabled" CssClass="btn btn-secondary" />
             <a href="Login.aspx" class="btn btn-link">Salir.</a>
            <a href="PaginaPrincipal.aspx" class="btn btn-link">Volver.</a>
             </div>
             </center>
    </div>

  
        



    <div style="font-weight: bold">
    
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Detalle</div>

        <div>
        
        </div>
       
         <div class="table-responsive">
           <asp:UpdatePanel runat="server" ID="panelGrid">
            <ContentTemplate>
               <div class="table-responsive">
             <asp:GridView ID="dgvPersonas" runat="server" Height="150"
                AllowPaging="True" AutoGenerateColumns="False" DataSourceID="DataSourcePersona" 
                Width="1000px" CellPadding="3" GridLines="Horizontal" 
                onrowcommand="dgvPersonas_RowCommand" BackColor="White" 
                BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
                ViewStateMode="Disabled">
                <AlternatingRowStyle BackColor="#BDBDBD" />
                <Columns>
                    <asp:BoundField DataField="strClaveUnica" HeaderText="Clave Unica" 
                        ReadOnly="True" SortExpression="strClaveUnica" />
                    <asp:BoundField DataField="strNombre" HeaderText="Nombre" ReadOnly="True" 
                        SortExpression="strNombre" />
                    <asp:BoundField DataField="strAPaterno" HeaderText="APaterno" ReadOnly="True" 
                        SortExpression="strAPaterno" />
                    <asp:BoundField DataField="strAMaterno" HeaderText="AMaterno" ReadOnly="True" 
                        SortExpression="strAMaterno" />
                    <asp:BoundField DataField="CatSexo" HeaderText="Sexo" 
                        SortExpression="CatSexo" />
                    <asp:TemplateField HeaderText="Editar">
                        <ItemTemplate>
                                    <asp:ImageButton runat="server" ID="imgEditar" CommandName="Editar" CommandArgument='<%#Bind("id") %>' ImageUrl="~/Images/editrecord_16x16.png" />
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                    
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Eliminar" Visible="True">
                            <ItemTemplate>
                                <asp:ImageButton runat="server" ID="imgEliminar" CommandName="Eliminar" CommandArgument='<%#Bind("id") %>' ImageUrl="~/Images/delrecord_16x16.png" OnClientClick="javascript:return confirm('¿Está seguro de querer eliminar el registro seleccionado?', 'Mensaje de sistema')"/>
                            </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                            </asp:TemplateField>

                      <asp:TemplateField HeaderText="Direccion">
                        <ItemTemplate>
                                    <asp:ImageButton runat="server" ID="imgDireccion" CommandName="Direccion" CommandArgument='<%#Bind("id") %>' ImageUrl="~/Images/editrecord_16x16.png" />
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                    
                    </asp:TemplateField>



                </Columns>

                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#BDBDBD" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#BDBDBD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#BDBDBD" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>

                  </ContentTemplate>
              </asp:UpdatePanel>

        </div>
        
        
          <div align="center" style="width: 671px">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              
            
        &nbsp;&nbsp;&nbsp;
         
        
       
        <br>
    <asp:LinqDataSource ID="DataSourcePersona" runat="server" 
        ContextTypeName="UTTT.Ejemplo.Linq.Data.Entity.DcGeneralDataContext" 
        onselecting="DataSourcePersona_Selecting" 
        Select="new (strNombre, strAPaterno, strAMaterno, CatSexo, strClaveUnica,id)" 
        TableName="Persona" EntityTypeName="">
    </asp:LinqDataSource>
    </form>
    <script type="text/javascript">
        document.querySelector("#txtNombre").addEventListener("keyup",() => {
            document.querySelector("#BtnBus").click();
        });
    </script>
</body>
</html>

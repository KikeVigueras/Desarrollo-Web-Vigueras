<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsuarioPrinc.aspx.cs" Inherits="UTTT.Ejemplo.Persona.UsuarioPrinc" %>

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
    <center>
    <form id="form1" runat="server">
        
        <dt>Roles</dt>
        <br >
        <br >
      
       <div class="row justify-content-md-center mt-3">
        <div class="col-md-6">
        <asp:TextBox runat="server" ID="txtNombre" MaxLength="15" ViewStateMode="Disabled" placeholder="Nombre de Usuario" CssClass="form-control"  ></asp:TextBox>
       </div>
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="panel1" runat="server">
     
            <ContentTemplate>
                <asp:Button Style="display: none;" ID="botonBusquedaXD" runat="server" OnClick="botonBusquedaXD_Click" />
            </ContentTemplate>
        </asp:UpdatePanel>
      </div>
        <br >
        <br >
        <%--<asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-select"></asp:DropDownList>--%>
        <asp:DropDownList ID="ddlEstado" runat="server" runat="server" class="btn btn-secondary dropdown-toggle" ype="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" Height="35px" Width="271px">
            </asp:DropDownList>
          <asp:Button ID="btnBuscar"  text-align="center" runat="server" Text="Buscar" OnClick="btnBuscar_Click" ViewStateMode="Disabled" CssClass="btn btn-danger" />
        <asp:Button ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click" ViewStateMode="Disabled" CssClass="btn btn-secondary " />

        <a href="PaginaPrincipal.aspx" class="btn btn-link">Volver.</a>
       <br >
       <hr >
        <asp:UpdatePanel ID="panelGrid" runat="server">
            <ContentTemplate>
                <asp:GridView ID="dgvUsuario" runat="server"
                    AllowPaging="True" AutoGenerateColumns="False" DataSourceID="DataSourceUsuario"
                    Width="700px" CellPadding="3" GridLines="Horizontal"
                    OnRowCommand="dgvUsuario_RowCommand" BackColor="White"
                    BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px"
                    ViewStateMode="Disabled">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="strNombreUsuario" HeaderText="Nombre de Usuario"
                            ReadOnly="True" SortExpression="strNombreUsuario" />
                        <asp:BoundField DataField="dtFechaIngreso" HeaderText="Fecha de ingreso" ReadOnly="True"
                            SortExpression="dtFechaIngreso" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="EstadoUsuario.strValor" HeaderText="Estado" ReadOnly="True"
                            SortExpression="EstadoUsuarios.strValor" />
                        <asp:TemplateField HeaderText="Editar">
                            <ItemTemplate>
                                <asp:ImageButton runat="server" ID="imgEditar" CommandName="Editar" CommandArgument='<%#Bind("id") %>' ImageUrl="~/Images/editrecord_16x16.png" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="50px" />

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Eliminar" Visible="True">
                            <ItemTemplate>
                                <asp:ImageButton runat="server" ID="imgEliminar" CommandName="Eliminar" CommandArgument='<%#Bind("id") %>' ImageUrl="~/Images/delrecord_16x16.png" OnClientClick="javascript:return confirm('¿Está seguro de querer eliminar el registro seleccionado?', 'Mensaje de sistema')" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:LinqDataSource ID="DataSourceUsuario" runat="server"
            OnSelecting="DataSourceUsuario_Selecting"
            Select="new (strNombreUsuario, dtFechaIngreso, id, EstadoUsuario)"
            TableName="Usuario" EntityTypeName="" ContextTypeName="UTTT.Ejemplo.Linq.Data.Entity.DcGeneralDataContext">
        </asp:LinqDataSource>

        <br >
        <hr >

        
      
    </form>
  </center>
    <script type="text/javascript">
        document.querySelector('#txtNombre').addEventListener('keyup', () => {
            document.querySelector('#botonBusquedaXD').click();
        });
    </script>



</body>
</html>

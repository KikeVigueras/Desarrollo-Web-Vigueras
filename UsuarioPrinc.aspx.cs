using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;
using UTTT.Ejemplo.Persona.Control;
using UTTT.Ejemplo.Persona.Control.Ctrl;

namespace UTTT.Ejemplo.Persona
{
    public partial class UsuarioPrinc : System.Web.UI.Page
    {
        private SessionManager sesion = new SessionManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Response.Buffer = true;
                DataContext siuu = new DcGeneralDataContext();
                if (!this.IsPostBack)
                {
                    List<EstadoUsuario> estadoUsuarios = siuu.GetTable<EstadoUsuario>().ToList();
                    EstadoUsuario estadoTemp = new EstadoUsuario();
                    estadoTemp.id = -1;
                    estadoTemp.strValor = "Todos";
                    estadoUsuarios.Insert(0, estadoTemp);
                    this.ddlEstado.DataTextField = "strValor";
                    this.ddlEstado.DataValueField = "id";
                    this.ddlEstado.DataSource = estadoUsuarios;
                    this.ddlEstado.DataBind();
                }

            }
            catch (Exception _e)
            {
                this.showMessage("Valio Chetos no cargo");
            }

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                this.DataSourceUsuario.RaiseViewChanged();
            }
            catch (Exception _e)
            {
                this.showMessage("No se pudo Buscar");
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            this.sesion.Pantalla = "~/AgregarUser.aspx";
            Hashtable parametrosRagion = new Hashtable();
            parametrosRagion.Add("idUsuario", "0");
            this.sesion.Parametros = parametrosRagion;
            this.Session["SessionManager"] = this.sesion;
            this.Response.Redirect(this.sesion.Pantalla, false);
        }

        protected void botonBusquedaXD_Click(object sender, EventArgs e)
        {
            this.DataSourceUsuario.RaiseViewChanged();
        }

        protected void DataSourceUsuario_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            try
            {
                DataContext consul = new DcGeneralDataContext();
                bool name= false;
                bool roles = false;
                if (!this.txtNombre.Text.Equals(String.Empty))
                {
                    name = true;
                }
                if (this.ddlEstado.Text != "-1")
                {
                    roles = true;
                }

                Expression<Func<Usuario, bool>>
                    predicate =
                    (c =>
                    ((roles) ? c.idEstado == int.Parse(this.ddlEstado.Text) : true) &&
                    ((name) ? (((name) ? c.strNombreUsuario.Contains(this.txtNombre.Text.Trim()) : false)) : true)
                    );

                predicate.Compile();

                List<Usuario> usersList = consul.GetTable<Usuario>().Where(predicate).ToList();
                e.Result = usersList;
            }
            catch (Exception _e)
            {
                throw _e;
            }
        }
        protected void dgvUsuario_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int idUser = int.Parse(e.CommandArgument.ToString());
                switch (e.CommandName)
                {
                    case "Editar":
                        this.editar(idUser);
                        break;
                    case "Eliminar":
                        this.eliminar(idUser);
                        break;
                }
            }
            catch (Exception ex)
            {

            }
        }
        private void editar(int idUser)
        {
            try
            {
                Hashtable parameters = new Hashtable();
                parameters.Add("idUsuario", idUser.ToString());
                this.sesion.Parametros = parameters;
                this.Session["SessionManager"] = this.sesion;
                this.sesion.Pantalla = String.Empty;
                this.sesion.Pantalla = "~/AgregarUser.aspx";
                this.Response.Redirect(this.sesion.Pantalla, false);

            }
            catch (Exception _e)
            {
                throw _e;
            }
        }
        private void eliminar(int idUser)
        {
            try
            {
                DataContext Delete = new DcGeneralDataContext();
                Usuario user = Delete.GetTable<Usuario>().First(
                    c => c.id == idUser);
                Delete.GetTable<Usuario>().DeleteOnSubmit(user);
                Delete.SubmitChanges();
                this.showMessage("Agregado Correctamente.");
                this.DataSourceUsuario.RaiseViewChanged();
            }
            catch (Exception _e)
            {
                throw _e;
            }
        }








    }
}
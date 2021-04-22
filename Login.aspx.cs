using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;
using UTTT.Ejemplo.Persona.Control.Ctrl;

namespace UTTT.Ejemplo.Persona
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            if (!IsValid)
            {
                return;
            }
            try
            {
                DataContext condb = new DcGeneralDataContext();
                String mensaje = String.Empty;
                if (!this.val(ref mensaje))
                {
                    this.lblError.Text = mensaje;
                    this.lblError.Visible = true;
                    return;
                }
                if (!this.insql(ref mensaje))
                {
                    this.lblError.Text = mensaje;
                    this.lblError.Visible = true;
                    return;
                }
                if (!this.htmlInjectionValida(ref mensaje))
                {
                    this.lblError.Text = mensaje;
                    this.lblError.Visible = true;
                    return;
                }
                var usuario = condb.GetTable<Usuario>().FirstOrDefault(u => u.strNombreUsuario == this.txtNombreUsuario.Text.Trim());
                if (usuario == null)
                {
                    this.lblError.Text = "Algun dato escrito es incorrecto, favor de intentar con los datos correctos.";
                    this.lblError.Visible = true;
                    return;
                }
                if (usuario.idEstado != 1)
                {
                    this.lblError.Text = "Actualmente tu usuario esta bloqueado, favor de comunicarse con sistemas, gracias!!";
                    this.lblError.Visible = true;
                    return;
                }



                var contra = CtrlEncrypt.DesEncriptar(usuario.strContrasena);
                //var contraseñas= CtrlEncrypt.DesEncriptar(usuario.strContrasena);

                if (!contra.Equals(this.txtContrasena.Text.Trim()))
                {
                    this.lblError.Text = "La contraseña Introducida es Incorrecta";
                    this.lblError.Visible = true;
                    return;
                }
                this.Response.Redirect("~/PaginaPrincipal.aspx", false);
            }
            catch (Exception ex)
            {
                Crtlemail email = new Crtlemail();
                email.sendEmail(ex.Message);
                this.Response.Redirect("~/ErrorPage.aspx", false);
            }
        }
        private bool val(ref String mensaje)
        {
            if (txtNombreUsuario.Text.Trim().Length == 0)
            {
                mensaje = "Este Campo es requerido";
                return false;
            }
            if (txtNombreUsuario.Text.Trim().Length > 20)
            {
                mensaje = "El usuario revasa el limite de caracteres";
                return false;
            }
            if (txtContrasena.Text.Trim().Length == 0)
            {
                mensaje = "Este campo es Requerido";
                return false;
            }
            if (this.txtContrasena.Text.Trim().Length > 20)
            {
                mensaje = "La Contraseña revasa el limite de caracteres";
                return false;
            }
            return true;
        }
        public bool insql(ref String _mensaje)
        {
            ControlSQl valida = new ControlSQl();
            String _mensajeFuncion = String.Empty;
            if (valida.sqlInjectionValida(this.txtNombreUsuario.Text.Trim(), ref _mensajeFuncion, "Nombre de usuario", ref this.txtNombreUsuario))
            {
                _mensaje = _mensajeFuncion;
                return false;
            }
            if (valida.sqlInjectionValida(this.txtContrasena.Text.Trim(), ref _mensajeFuncion, "Contraseña", ref this.txtContrasena))
            {
                _mensaje = _mensajeFuncion;
                return false;
            }
            return true;
        }

        public bool htmlInjectionValida(ref String _mensaje)
        {
            ControlSQl valida = new ControlSQl();
            String mensajeFuncion = String.Empty;
            if (valida.htmlInjectionValida(this.txtNombreUsuario.Text.Trim(), ref mensajeFuncion, "Nombre de usuario", ref this.txtNombreUsuario))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.htmlInjectionValida(this.txtContrasena.Text.Trim(), ref mensajeFuncion, "Contraseña", ref this.txtContrasena))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            return true;
        }




    }
}
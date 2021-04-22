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
    public partial class RecuperarPass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCorreo_Click(object sender, EventArgs e)
        {
            if (!IsValid)
            {
                return;
            }
            try
            {
                Crtlemail email = new Crtlemail();
                DataContext db = new DcGeneralDataContext();
                var persona = db.GetTable<Linq.Data.Entity.Persona>().FirstOrDefault(p => p.strEmail == this.txtCorreo.Text.Trim());
                if (persona == null)
                {
                    this.lblError.Visible = true;
                    this.lblError.Text = "No exixste el correo que ingresaste.";
                    return;
                }
                var usuario = db.GetTable<Usuario>().FirstOrDefault(u => u.idComPersona == persona.id);
                if (usuario == null)
                {
                    this.lblError.Visible = true;
                    this.lblError.Text = "Correo Invalido, favor de serciorarse si el correo es valido. ";
                    return;
                }
                if (usuario.idEstado > 1)
                {
                    this.lblError.Visible = true;
                    this.lblError.Text = "Actualmente no estas activo dentro de la plataforma, comunicate con sistemas";
                    return;
                }
                var token = CtrlEncrypt.GetSHA256(Guid.NewGuid().ToString());
                usuario.strTokenContrasena = token;
                db.SubmitChanges();
                if (email.recuperarContrasenaCorreo(persona.strEmail, persona.strNombre, token))
                {
                    Response.Redirect("~/CorreoEnviado.html", false);
                }
                else
                {
                    this.lblError.Visible = true;
                    this.lblError.Text = "Ocurrio un Error al enviar el correo.";
                    return;
                }

            }
            catch (Exception ex)
            {
                Crtlemail email = new Crtlemail();
                email.sendEmail(ex.Message);
                this.Response.Redirect("~/ErrorPage.aspx", false);
            }
        }













    }
}
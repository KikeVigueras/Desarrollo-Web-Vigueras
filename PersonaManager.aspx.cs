#region Using

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;
using System.Data.Linq;
using System.Linq.Expressions;
using System.Collections;
using UTTT.Ejemplo.Persona.Control;
using UTTT.Ejemplo.Persona.Control.Ctrl;
using System.Text.RegularExpressions;
using System.Globalization;

#endregion

namespace UTTT.Ejemplo.Persona
{
    public partial class PersonaManager : System.Web.UI.Page
    {
        #region Variables

        private SessionManager session = new SessionManager();
        private int idPersona = 0;
        private UTTT.Ejemplo.Linq.Data.Entity.Persona baseEntity;
        private DataContext dcGlobal = new DcGeneralDataContext();
        private int tipoAccion = 0;
        private readonly Regex numeros = new Regex(@"^\d+$");
        private readonly Regex gmail = new Regex(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");
        private readonly Regex rfcc = new Regex(@"^([aA-zZñÑ\x26]{3,4}([0-9]{2})(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1]))([aA-zZ\d]{3})?$");

        #endregion
        Regex regex = new Regex(@"^[0-5][1-9]{3}[0-9]$");
        //        Regex REgex = new Regex(@"^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$
        //");
        private readonly Regex SoloLetras = new Regex(@"^[a-zA-ZÀ-ÿ\s\u00f1\u00d1]+$");

        #region Eventos

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                this.Response.Buffer = true;
                this.session = (SessionManager)this.Session["SessionManager"];
                this.idPersona = this.session.Parametros["idPersona"] != null ?
                    int.Parse(this.session.Parametros["idPersona"].ToString()) : 0;
                if (this.idPersona == 0)
                {
                    this.baseEntity = new Linq.Data.Entity.Persona();
                    this.tipoAccion = 1;
                }
                else
                {
                    this.baseEntity = dcGlobal.GetTable<Linq.Data.Entity.Persona>().First(c => c.id == this.idPersona);
                    this.tipoAccion = 2;
                }

                if (!this.IsPostBack)
                {
                    if (this.session.Parametros["baseEntity"] == null)
                    {
                        this.session.Parametros.Add("baseEntity", this.baseEntity);
                    }

                    List<CatSexo> lista = dcGlobal.GetTable<CatSexo>().ToList();
                    CatSexo catTemp = new CatSexo();
                    //catTemp.id = -1;
                    //catTemp.strValor = "Seleccionar";
                    //lista.Insert(0, catTemp);
                    //this.ddlSexo.DataTextField = "strValor";
                    //this.ddlSexo.DataValueField = "id";
                    //this.ddlSexo.DataSource = lista;
                    //this.ddlSexo.DataBind();
                    //-----------------------------------
                    this.ddlSexo.SelectedIndexChanged += new EventHandler(ddlSexo_SelectedIndexChanged);
                    this.ddlSexo.AutoPostBack = false;
                    //-----------------------------------
                    List<EstadoCivil> estadosCiviles = dcGlobal.GetTable<EstadoCivil>().ToList();
                    this.idestadocivil.DataTextField = "strValor";
                    this.idestadocivil.DataValueField = "id";

                    if (this.idPersona == 0)
                    {
                        catTemp.id = -1;
                        catTemp.strValor = "Seleccionar";
                        lista.Insert(0, catTemp);
                        this.ddlSexo.DataTextField = "strValor";
                        this.ddlSexo.DataValueField = "id";
                        this.ddlSexo.DataSource = lista;
                        this.ddlSexo.DataBind();

                        EstadoCivil estadoCivilTemp = new EstadoCivil();
                        estadoCivilTemp.Id = -1;
                        estadoCivilTemp.strValor = "Seleccionar";
                        estadosCiviles.Insert(0, estadoCivilTemp);



                        this.idestadocivil.DataSource = estadosCiviles;
                        this.idestadocivil.DataBind();
                        this.lblAccion.Text = "Agregar";
                        DateTime date = new DateTime(2000, 7, 8);
                        this.cal_Calendar.TodaysDate = date;
                    }
                    else
                    {
                        catTemp.id = baseEntity.CatSexo.strValor == "Masculino" ? 1 : 2;
                        catTemp.strValor = baseEntity.CatSexo.strValor;
                        lista.Insert(0, catTemp);
                        this.ddlSexo.DataTextField = "strValor";
                        this.ddlSexo.DataValueField = "id";
                        lista.RemoveAt(0);
                        this.ddlSexo.DataSource = lista;
                        this.ddlSexo.DataBind();

                        this.lblAccion.Text = "Editar";
                        this.txtNombre.Text = this.baseEntity.strNombre;
                        this.txtAPaterno.Text = this.baseEntity.strAPaterno;
                        this.txtAMaterno.Text = this.baseEntity.strAMaterno;
                        this.txtClaveUnica.Text = this.baseEntity.strClaveUnica;
                        this.setItem(ref this.ddlSexo, baseEntity.CatSexo.strValor);

                        this.txtnumeroHermanos.Text = this.baseEntity.intNumHermanos.ToString();
                        this.txtcorreoElectronico.Text = this.baseEntity.strEmail;
                        this.txtcodigoPostal.Text = this.baseEntity.strCP;
                        this.txtRFC.Text = this.baseEntity.strRFC;
                        DateTime? fechaNa = this.baseEntity.dtFechaNacimiento;

                        if (fechaNa != null)
                        {
                            this.cal_Calendar.TodaysDate = (DateTime)fechaNa;
                            this.cal_Calendar.SelectedDate = (DateTime)fechaNa;
                            this.idtxtfecha.Text = fechaNa.Value.Date.ToString("dd/MM/yyyy");
                        }
                        //-----------------------------------
                        if (baseEntity.EstadoCivil == null)
                        {
                            EstadoCivil ecTemp = new EstadoCivil();
                            ecTemp.Id = -1;
                            ecTemp.strValor = "Seleccionar";
                            estadosCiviles.Insert(0, ecTemp);
                        }
                        this.idestadocivil.DataSource = estadosCiviles;
                        this.idestadocivil.DataBind();
                        if (baseEntity.EstadoCivil != null)
                        {
                            this.setItem(ref this.idestadocivil, baseEntity.EstadoCivil.strValor);
                        }




                    }

                }

            }


            catch (Exception _e)
            {
                this.showMessage("Neeel no se puede cargar la pagina");
                this.Response.Redirect("~/PersonaPrincipal.aspx", false);
            }

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                if (!IsValid)
                {
                    return;
                }


                DataContext dcGuardar = new DcGeneralDataContext();
                UTTT.Ejemplo.Linq.Data.Entity.Persona persona = new Linq.Data.Entity.Persona();
                int i = 0;
                DateTime dateValue = DateTime.Now;
                if (this.idPersona == 0)

                {
                    persona.dtFechaNacimiento = (!DateTime.TryParseExact(this.idtxtfecha.Text.Trim(), "dd/MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out dateValue)) ? (DateTime?)null : dateValue;
                    //persona.fechaNaci = this.cal_Calendar.SelectedDate.Date;
                    persona.strClaveUnica = this.txtClaveUnica.Text.Trim();
                    persona.strNombre = this.txtNombre.Text.Trim();
                    persona.strAMaterno = this.txtAMaterno.Text.Trim();
                    persona.strAPaterno = this.txtAPaterno.Text.Trim();
                    persona.idCatSexo = int.Parse(this.ddlSexo.Text);

                    //persona.numeroHermanos = int.Parse(this.txtnumeroHermanos.Text);
                    persona.intNumHermanos = this.txtnumeroHermanos.Text.Trim().Length > 0 ? (int.TryParse(this.txtnumeroHermanos.Text.Trim(), out i) ? int.Parse(this.txtnumeroHermanos.Text.Trim()) : 0) : 0;
                    persona.strEmail = this.txtcorreoElectronico.Text;
                    persona.strCP = this.txtcodigoPostal.Text;
                    persona.strRFC= this.txtRFC.Text;
                    string mensaje = string.Empty;
                    persona.idEstadoCivil = int.Parse(this.idestadocivil.Text);


                    if (!this.validacion(persona, ref mensaje))
                    {
                        this.txtMensaje.Text = mensaje;
                        this.txtMensaje.Visible = true;
                        return;
                    }

                    if (!this.ValidacionSql(ref mensaje))
                    {
                        this.txtMensaje.Text = mensaje;
                        this.txtMensaje.Visible = true;
                        return;
                    }

                    if (!this.Validationhtml(ref mensaje))
                    {
                        this.txtMensaje.Text = mensaje;
                        this.txtMensaje.Visible = true;
                        return;
                    }
                    if (!this.consuledi(persona, ref mensaje))
                    {
                        this.txtMensaje.Text = mensaje;
                        this.txtMensaje.Visible = true;
                        return;
                    }

                    dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Persona>().InsertOnSubmit(persona);
                    dcGuardar.SubmitChanges();
                    this.showMessage("El registro se agrego correctamente.");
                    this.Response.Redirect("~/PersonaPrincipal.aspx", false);

                }
                if (this.idPersona > 0)
                {
                    persona = dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Persona>().First(c => c.id == idPersona);
                    persona.dtFechaNacimiento = (!DateTime.TryParseExact(this.idtxtfecha.Text.Trim(), "dd/MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out dateValue)) ? (DateTime?)null : dateValue;
                    
                    //persona.fechaNaci = this.cal_Calendar.SelectedDate.Date;
                    
                    persona.strClaveUnica = this.txtClaveUnica.Text.Trim();
                    persona.strNombre = this.txtNombre.Text.Trim();
                    persona.strAMaterno = this.txtAMaterno.Text.Trim();
                    persona.strAPaterno = this.txtAPaterno.Text.Trim();
                    persona.idCatSexo = int.Parse(this.ddlSexo.Text);
                    //persona.numeroHermanos = int.Parse(this.txtnumeroHermanos.Text);
                    persona.intNumHermanos = this.txtnumeroHermanos.Text.Trim().Length > 0 ? (int.TryParse(this.txtnumeroHermanos.Text.Trim(), out i) ? int.Parse(this.txtnumeroHermanos.Text.Trim()) : 0) : 0;
                    persona.strEmail = this.txtcorreoElectronico.Text;
                    persona.strCP = this.txtcodigoPostal.Text;
                    persona.strRFC = this.txtRFC.Text;
                    String mensage = String.Empty;

                    persona.idEstadoCivil = int.Parse(this.idestadocivil.Text);
                    if (!this.validacion(persona, ref mensage))
                    {
                        this.txtMensaje.Text = mensage;
                        this.txtMensaje.Visible = true;
                        return;
                    }
                    if (!this.ValidacionSql(ref mensage))
                    {
                        this.txtMensaje.Text = mensage;
                        this.txtMensaje.Visible = true;
                        return;
                    }
                    if (!this.Validationhtml(ref mensage))
                    {
                        this.txtMensaje.Text = mensage;
                        this.txtMensaje.Visible = true;
                        return;
                    }

                    if (!this.consuledi(persona, ref mensage))
                    {
                        this.txtMensaje.Text = mensage;
                        this.txtMensaje.Visible = true;
                        return;
                    }






                    dcGuardar.SubmitChanges();
                    this.showMessage("El registro se edito correctamente.");
                    this.Response.Redirect("~/PersonaPrincipal.aspx", false);
                }
            }
            catch (Exception _e)
            {
                //this.showMessageException(_e.Message);

                Crtlemail ctrlmail = new Crtlemail();
                ctrlmail.sendEmail(_e.Message);
                this.Response.Redirect("~/ErrorPage.aspx", false);

            }


        }

        //public bool validarCons(Linq.Data.Entity.Persona _persona, ref String mensaje)
        //{
        //    var persona = dcGlobal.GetTable<Linq.Data.Entity.Persona>().FirstOrDefault(p => p.strEmail == _persona.strEmail);
        //    if (persona != null)
        //    {
        //        mensaje = "El e-mail ya fue usado";
        //        return false;
        //    }


            public bool validarCons(Linq.Data.Entity.Persona _persona, ref String mensaje)
        {
            var persona = dcGlobal.GetTable<Linq.Data.Entity.Persona>().FirstOrDefault(p => p.strEmail == _persona.strEmail);
            if (persona != null)
            {
                mensaje = "El e-mail ya fue usado";
                return false;
            }
            return true;
        }
         
        public bool consuledi(Linq.Data.Entity.Persona persona, ref String mensaje)
        {
            var personCount = dcGlobal.GetTable<Linq.Data.Entity.Persona>().Where(u => u.strEmail == persona.strEmail && u.id != persona.id).Count();
            if (personCount > 0)
            {
                mensaje = "E-mail inscrito, favor de ingresar otro.";
                return false;
            }
            return true;
        }
        //public bool consuledi(Linq.Data.Entity.Persona persona, ref String mensaje)
        //{
        //    var personCount = dcGlobal.GetTable<Linq.Data.Entity.Persona>().Where(u => u.strEmail == persona.strEmail && u.id != persona.id).Count();
        //    if (personCount > 0)
        //    {
        //        mensaje = "E-mail inscrito, favor de ingresar otro.";
        //        return false;
        //    }
        //    return true;
        //}


        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            try
            {
                this.Response.Redirect("~/PersonaPrincipal.aspx", false);
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un error inesperado");
            }
        }

        protected void ddlSexo_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int idSexo = int.Parse(this.ddlSexo.Text);
                Expression<Func<CatSexo, bool>> predicateSexo = c => c.id == idSexo;
                predicateSexo.Compile();
                List<CatSexo> lista = dcGlobal.GetTable<CatSexo>().Where(predicateSexo).ToList();
                CatSexo catTemp = new CatSexo();
                this.ddlSexo.DataTextField = "strValor";
                this.ddlSexo.DataValueField = "id";
                this.ddlSexo.DataSource = lista;
                this.ddlSexo.DataBind();
            }
            catch (Exception)
            {
                this.showMessage("Ha ocurrido un error inesperado");
            }
        }

        #endregion

        #region Metodos

        public void setItem(ref DropDownList _control, String _value)
        {
            foreach (ListItem item in _control.Items)
            {
                if (item.Value == _value)
                {
                    item.Selected = true;
                    break;
                }
            }
            _control.Items.FindByText(_value).Selected = true;
        }

        #endregion


        #region MetodosValidaciones
        /// <summary>
        /// Validación datos
        /// </summary>
        /// <param name="_persona"></param>
        /// <param name="_mensaje"></param>
        /// <returns></returns>

        public bool validacion(UTTT.Ejemplo.Linq.Data.Entity.Persona _persona, ref String _mensaje)
        {
            int i;
            if (_persona.idCatSexo < 0)
            {
                _mensaje = "El campo de sexo es requerido";
                return false;
            }

            //if (_persona.strClaveUnica.Equals(String.Empty))
            //{
            //    _mensaje = "El campo clave única es requerido";
            //    return false;
            //}
            if (!int.TryParse(_persona.strClaveUnica, out i))
            {
                _mensaje = "La clave única debe ser un número";
                return false;
            }
            if (int.Parse(_persona.strClaveUnica) < 100 || int.Parse(_persona.strClaveUnica) > 999)
            {
                _mensaje = "La clave unica no contiene rango necesario";
                return false;
            }
            if (!int.TryParse(_persona.strClaveUnica, out i))
            {
                _mensaje = "La clave única debe ser un número";
                return false;
            }
            if (int.Parse(_persona.strClaveUnica) < 100 || int.Parse(_persona.strClaveUnica) > 999)
            {
                _mensaje = "La clave unica no contiene rango necesario";
                return false;
            }
            ////if (_persona.strClaveUnica.Length > 3 || _persona.strClaveUnica.Length < 50)
            //{
            //    _mensaje = "La clave unica debe tener 3 caracteres de longitud";
            //    return false;
            //}

            if (_persona.strNombre.Length < 3 || _persona.strNombre.Length > 50)
            {
                _mensaje = "Rango de Apellido Paterno no es valido";
                return false;
            }
            if (!this.SoloLetras.IsMatch(_persona.strNombre))
            {
                _mensaje = "El campo Nombre debe contener solo letras.";
                return false;
            }
            if (_persona.strNombre.Equals(String.Empty))
            {
                _mensaje = "El campo de nombre es requerido";
                return false;
            }

            if (_persona.strAPaterno.Length < 3 || _persona.strAPaterno.Length > 50)
            {
                _mensaje = "Rango de Apellido Paterno no es valido";
                return false;
            }
            if (!this.SoloLetras.IsMatch(_persona.strAPaterno))
            {
                _mensaje = "El campo Apellido Paterno debe contener solo letras.";
                return false;
            }
            if (_persona.strAPaterno.Equals(String.Empty))
            {
                _mensaje = "El campo de apellido paterno es requerido";
                return false;
            }
            //if (_persona.fechaNaci.ToString().Equals("01/01/0001 12:00:00 a. m."))
            //{
            //    _mensaje = "El campo fecha de nacimiento es requerido";
            //    return false;
            //}

            if (this.idtxtfecha.Text.Trim().Equals(String.Empty))
            {
                _mensaje = "La fecha de nacimiento es requerida.";
                return false;
            }



            if (_persona.dtFechaNacimiento == null)
            {
                _mensaje = "La fecha no es válida.";
                return false;
            }
            var time = DateTime.Now - _persona.dtFechaNacimiento.Value.Date;

            if (time.Days < 6570)
            {
                _mensaje = "Debes ser mayor de 18 años";
                return false;
            }

            //if (idtxtfecha.Equals)
            //{
            //    _mensaje = "El formato del CP es invalido, Ingresa uno Correcto";
            //    return false;
            //}


            //var time = DateTime.Now - _persona.Fecha_Naci.Value.Date;
            //if (time.Days < 6570)
            //{
            //    _mensaje = "Debes ser mayor de 18 años";
            //    return false;
            //}

            if (_persona.intNumHermanos.ToString().Equals(String.Empty))
            {
                _mensaje = "El campo de numero de hermanos es requerido";
                return false;
            }
            if (_persona.intNumHermanos.ToString().Equals(String.Empty))
            {
                _mensaje = "Rango no Admitido en el Número de Hermanos";
                return false;
            }
            if (_persona.strEmail.Equals(String.Empty))
            {
                _mensaje = "El campo de correo es requerido";
                return false;
            }
            if (!this.gmail.IsMatch(_persona.strEmail.ToString()))
            {
                _mensaje = "Correo invalido";
                return false;
            }


            //if (int.Parse(_persona.CodigoPostal)==00000)
            //{
            //    _mensaje = "El Formato del codigo postal es incorrecto coloque un CP Valido";

            //}
            //if (_persona.CodigoPostal.ToString().Equals((00000)))
            //{
            //    _mensaje = "El Formato del codigo postal es incorrecto coloque un CP Valido";
            //    return false;
            //}


            //if (_persona.CodigoPostal.ToString().Equals(00000))
            //{
            //    _mensaje = "Sii";

            //}
            //    else _persona.CodigoPostal.Equals(String.Empty);
            //}
            //_mensaje = "El campo de CP es requerido";

            //        return false;
            //int  CP=00000;
            //int puerto = Convert.ToInt32(CP);

            //if (_persona.CodigoPostal.Equals(CP))
            //{
            //    _mensaje = "SIUU";
            //    return false;

            //}
            if (_persona.strCP.Equals(String.Empty))
            {
                _mensaje = "El campo de CP es requerido";
                return false;
            }

            if (_persona.strCP.Length > 5 || _persona.strCP.Length < 5)
            {
                _mensaje = "Codigo postal Fuera de rango";
                return false;
            }

            //if (_persona.CodigoPostal.Equals(00000))
            //{
            //    _mensaje = ".i.";
            //    return false;
            //}



            if (!regex.IsMatch(_persona.strCP))
            {
                _mensaje = "El formato del CP es invalido, Ingresa uno Correcto";
                return false;
            }

            if (_persona.strRFC.Equals(String.Empty))
            {
                _mensaje = "El campo de Rfc es requerido";
                return false;
            }
            if (!this.rfcc.IsMatch(_persona.strRFC.ToString()))
            {
                _mensaje = "Rfc invalido";
                return false;
            }


            return true;
        }

        public bool ValidacionSql(ref String _mensaje)
        {
            ControlSQl ctrsql = new ControlSQl();
            String _mensajeFuncion = String.Empty;

         
            if (ctrsql.sqlInjectionValida(this.txtClaveUnica.Text.Trim(), ref _mensajeFuncion, "Clave Unica ", ref this.txtClaveUnica))
            {
                _mensaje = _mensajeFuncion;
                return false;
            }
            if (ctrsql.sqlInjectionValida(this.txtNombre.Text.Trim(), ref _mensajeFuncion, "Nombre", ref this.txtNombre))
            {
                _mensaje = _mensajeFuncion;
                return false;
            }
            if (ctrsql.sqlInjectionValida(this.txtAPaterno.Text.Trim(), ref _mensajeFuncion, "APaterno", ref this.txtAPaterno))
            {
                _mensaje = _mensajeFuncion;
                return false;
            }
            if (ctrsql.sqlInjectionValida(this.txtAMaterno.Text.Trim(), ref _mensajeFuncion, "AMaterno", ref this.txtAMaterno))
            {
                _mensaje = _mensajeFuncion;
                return false;
            }

            //if (ctrsql.sqlInjectionValida(this.txtAPaterno.Text.Trim(), ref _mensajeFuncion, "AMaterno", ref this.txtAPaterno))
            //{
            //    _mensaje = _mensajeFuncion;
            //    return false;
            //}

            if (ctrsql.sqlInjectionValida(this.txtnumeroHermanos.Text.Trim(), ref _mensajeFuncion, "Numero Hermanos", ref this.txtnumeroHermanos))
            {
                _mensaje = _mensajeFuncion;
                return false;
            }

            if (ctrsql.sqlInjectionValida(this.txtcorreoElectronico.Text.Trim(), ref _mensajeFuncion, "Correo Electronico", ref this.txtcorreoElectronico))
            {
                _mensaje = _mensajeFuncion;
                return false;
            }
            if (ctrsql.sqlInjectionValida(this.txtcodigoPostal.Text.Trim(), ref _mensajeFuncion, "Codigo Postal", ref this.txtcodigoPostal))
            {
                _mensaje = _mensajeFuncion;
                return false;
            }
            if (ctrsql.sqlInjectionValida(this.txtRFC.Text.Trim(), ref _mensajeFuncion, "RFC", ref this.txtRFC))
            {
                _mensaje = _mensajeFuncion;
                return false;
            }
            return true;
        }

        public bool Validationhtml(ref String _mensaje)
        {
            ControlSQl valida = new ControlSQl();
            String mensajeFuncion = String.Empty;
            if (valida.htmlInjectionValida(this.txtClaveUnica.Text.Trim(), ref mensajeFuncion, "Clave Única", ref this.txtClaveUnica))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.htmlInjectionValida(this.txtNombre.Text.Trim(), ref mensajeFuncion, "Nombre", ref this.txtNombre))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.htmlInjectionValida(this.txtAPaterno.Text.Trim(), ref mensajeFuncion, "APaterno", ref this.txtAPaterno))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.htmlInjectionValida(this.txtAMaterno.Text.Trim(), ref mensajeFuncion, "AMaterno", ref this.txtAMaterno))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.htmlInjectionValida(this.txtnumeroHermanos.Text.Trim(), ref mensajeFuncion, "Número Hermanos", ref this.txtnumeroHermanos))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.htmlInjectionValida(this.txtcorreoElectronico.Text.Trim(), ref mensajeFuncion, "Correro Electronico", ref this.txtcorreoElectronico))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.htmlInjectionValida(this.txtcorreoElectronico.Text.Trim(), ref mensajeFuncion, "Codigo Postal", ref this.txtcorreoElectronico))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.htmlInjectionValida(this.txtRFC.Text.Trim(), ref mensajeFuncion, "Correro Electronico", ref this.txtRFC))
            {
                _mensaje = mensajeFuncion;
                return false;
            }

            return true;
        }



        #endregion


        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            int sexo = int.Parse(this.ddlSexo.SelectedValue);
            if (sexo > 0)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void txtObligatorio_ServerValidate(object source, ServerValidateEventArgs args)
        {

        }

        protected void txtNombre_TextChanged(object sender, EventArgs e)
        {

        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (this.txtcodigoPostal.Text.Trim().Length == 5)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (this.idtxtfecha.Text.Trim().Length == 5)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void Unnamed1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}

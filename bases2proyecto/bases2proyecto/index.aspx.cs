using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bases2proyecto
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*Session["usuario"] = "usuario_5344";
            Session["user"] = "usuario_5344";
            Session["password"] = "password";*/

            ContentPlaceHolder cph;
            string us = (string)Session["user"];
            if (us != null)
            {
                cph = (ContentPlaceHolder)this.Page.Master.FindControl("ContentPlaceHolder2");
                cph.Visible = false;
                cph = (ContentPlaceHolder)this.Page.Master.FindControl("ContentPlaceHolder3");
                cph.Visible = true;
            }
            else
            {
                cph = (ContentPlaceHolder)this.Page.Master.FindControl("ContentPlaceHolder2");
                cph.Visible = true;
                cph = (ContentPlaceHolder)this.Page.Master.FindControl("ContentPlaceHolder3");
                cph.Visible = false;
            }
        }

        protected void btningresar_Click(object sender, EventArgs e)
        {
            login();
        }

        public void login() {            
            ConexionBD conn = new ConexionBD();
            string query = "select verifica_usuario('" + txtuser.Text + "','" + txtpass.Text + "')";
            string result = conn.getLogin(query);
            
            if (result.Equals("1"))
            {
                Response.Write("<script languaje = javascript>alert('Bienvenido " + txtuser.Text + " '); </script>");
                Session["usuario"] = txtuser.Text;
                Session["user"] = txtuser.Text;
                Session["password"] = txtpass.Text;
                Response.Redirect("index.aspx", true);
            }
            else {
                Response.Write("<script languaje = javascript>alert('Usuario o contraseña incorrectos'); </script>");
            }
        }

        protected void btnsalir_Click(object sender, EventArgs e)
        {
            Session["usuario"] = null;
            Session["user"] = null;
            Session["password"] = null;
            Response.Redirect("index.aspx", true);
        }

    }
}
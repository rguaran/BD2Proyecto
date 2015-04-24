using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;

namespace bases2proyecto
{
    public partial class WebForm2 : System.Web.UI.Page
    {
       

        private void setSession(int iniciar, int final)
        {
            Session["insert"] = "insertarMoneda";
            Session["select"] = "seleccionarMoneda()";
            Session["update"] = "actualizarMoneda";
            Session["delete"] = "eliminarMoneda";
            Session["origen"] = "moneda";
            Session["titulo"] = "Monedas";
            Session["iniciar"] = iniciar;
            Session["final"] = final;
        }
        
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            setSession(1, 3);            
            Response.Redirect("editar.aspx", true);
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            setSession(0, 3);
            Response.Redirect("editar.aspx", true);
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            setSession(0, 1);
            Response.Redirect("suprimir.aspx", true);
        }
    }
}
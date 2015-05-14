using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bases2proyecto
{
    public partial class cobertura : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            setSession();
            Response.Redirect("bien.aspx", true);
        }
        

        private void setSession()
        {
            Session["insert"] = "insertarCobertura";
            Session["select"] = "seleccionarCobertura(" + (string)Session["tipoSeguro"] + ", " +(string)Session["idPoliza"] + ")";
            Session["update"] = "actualizarCobertura";
            Session["delete"] = "eliminarCobertura";
            Session["origen"] = "poliza";
            Session["titulo"] = "Cobertura";
            Session["iniciar"] = 0;
            Session["iniciarInsert"] = 1;
            Session["final"] = 1;
        }
    }
}
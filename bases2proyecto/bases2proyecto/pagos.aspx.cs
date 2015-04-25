using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bases2proyecto
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["insert"] = "insertarMoneda";
            Session["select"] = "seleccionarMoneda()";
            Session["update"] = "actualizarMoneda";
            Session["delete"] = "eliminarMoneda";
            Session["origen"] = "pagos";
            Session["titulo"] = "Monedas";
            Session["iniciar"] = 0;
            Session["iniciarInsert"] = 1;
            Session["final"] = 1;
            Response.Redirect("pagos_mantenimiento.aspx", true);

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Session["insert"] = "insertarTipoDeCambio";
            Session["select"] = "seleccionarTipoDeCambio()";
            Session["update"] = "actualizarTipoDeCambio";
            Session["delete"] = "eliminarTipoDeCambio";
            Session["origen"] = "pagos";
            Session["titulo"] = "Tipo de Cambio";
            Session["iniciar"] = 0;
            Session["iniciarInsert"] = 0;
            Session["final"] = 3;
            Response.Redirect("pagos_mantenimiento.aspx", true);
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Session["insert"] = "insertarTipoDePago";
            Session["select"] = "seleccionarTipoDePago()";
            Session["update"] = "actualizarTipoDePago";
            Session["delete"] = "eliminarTipoDePago";
            Session["origen"] = "pagos";
            Session["titulo"] = "Tipo de Pago";
            Session["iniciar"] = 0;
            Session["iniciarInsert"] = 1;
            Session["final"] = 1;
            Response.Redirect("pagos_mantenimiento.aspx", true);
        }
    }
}
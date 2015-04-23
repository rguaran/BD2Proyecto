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
        protected void BtnNuevo_Click(object sender, ImageClickEventArgs e)
        {
            Session["Item"] = CmbItems.SelectedItem.Value;
            Response.Redirect("Modificar.aspx", true);
        }

        protected void BtnModificar_Click(object sender, ImageClickEventArgs e)
        {
            Session["Item"] = CmbItems.SelectedItem.Value;
            Response.Redirect("Modificar.aspx", true);
        }

        protected void BtnEliminar_Click(object sender, ImageClickEventArgs e)
        {
            Session["Item"] = CmbItems.SelectedItem.Value;
            Response.Redirect("Eliminar.aspx", true);
        }
    }
}
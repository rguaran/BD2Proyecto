using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bases2proyecto
{
    public partial class beneficiarios : System.Web.UI.Page
    {
        string tipo_seguro;
        string no_poliza;
        string usuario;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            tipo_seguro = (string)Session["tipoSeguro"];
            no_poliza = (string)Session["idPoliza"];
            usuario = (String)Session["user"];
            txtnopoliza.Text = no_poliza;

            ddltiposeguro.DataBind();
            ddltiposeguro.SelectedIndex = -1;
            ddltiposeguro.Items.FindByValue(tipo_seguro).Selected = true;
        }

        protected void btnagregarbenef_Click(object sender, EventArgs e)
        {
            agregarbenef();
            txtnombre.Text = "";
            txttelefono.Text = "";
        }

        public void agregarbenef() {
            ConexionBD conn = new ConexionBD();
            string query = "select insertarBeneficiario('" + txtnombre.Text + "','" + txttelefono.Text + "','" +
                ddltiposeguro.SelectedValue + "'," + txtnopoliza.Text + ",'" + usuario + "')";
            conn.Query(query);
        }
    }
}
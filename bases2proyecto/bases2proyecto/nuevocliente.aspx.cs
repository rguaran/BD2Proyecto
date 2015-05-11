using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bases2proyecto
{
    public partial class nuevocliente : System.Web.UI.Page
    {
        string user = "";
        private ConexionBD con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new ConexionBD();
            user = (String)Session["user"];
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            insertarCliente();
        }


        public void insertarCliente() {
            
            try
            {
                string query = "select insertarCliente('" + txtnombre.Text + "','" + txtdomicilio.Text + "'," + ddltipocliente.SelectedValue + "," + ddlpais.SelectedValue +",'" + user +"')";
                con.Query(query);
                Response.Redirect("clientesmantenimiento.aspx", true);
            }
            catch (Exception e) { }

        }
    }
}
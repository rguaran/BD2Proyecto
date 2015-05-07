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
        string user = "user";
        private ConexionBD con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new ConexionBD();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            insertarCliente();
        }


        public void insertarCliente() {
            
            try
            {
                string query = "select insertarCliente('" + user + "','" + txtnombre.Text + "','" + txtdomicilio.Text + "'," + ddltipocliente.SelectedValue + "," + ddlpais.SelectedValue + ")";
                con.Query(query);
                Response.Redirect("clientesmantenimiento.aspx", true);
            }
            catch (Exception e) { }

        }
    }
}
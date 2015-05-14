using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bases2proyecto
{
    public partial class clientesmantenimiento : System.Web.UI.Page
    {
        ConexionBD con;
        private ArrayList Titulos;

        string user = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string user = (String)Session["user"];
            con = new ConexionBD();
            Titulos = new ArrayList();
            Session["lugar"] = "clientesmantenimiento.aspx";
        }

        protected void BtnNuevo_Click(object sender, ImageClickEventArgs e)
        {
            Session["Item"] = CmbItems.SelectedItem.Value;
            Session["lugar"] = "clientesmantenimiento.aspx";
            Response.Redirect("Modificar.aspx", true);
        }

        protected void BtnModificar_Click(object sender, ImageClickEventArgs e)
        {
            Session["Item"] = CmbItems.SelectedItem.Value;
            Session["lugar"] = "clientesmantenimiento.aspx";
            Response.Redirect("Modificar.aspx", true);
        }

        protected void BtnEliminar_Click(object sender, ImageClickEventArgs e)
        {
            Session["Item"] = CmbItems.SelectedItem.Value;
            Session["lugar"] = "clientesmantenimiento.aspx";
            Response.Redirect("Eliminar.aspx", true);
        }

        protected void BtnNuevo2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("nuevocliente.aspx", true);
        }

        /*protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string[] valores = new string[e.Values.Count];
            e.Values.Values.CopyTo(valores, 0);
            Titulos = (ArrayList)Session["Titulos"];
            string query = "select eliminarCliente('" + user + "',";

            query += "'" + valores[0] + "')";

            con.Query(query);
            GridView1.DataBind();

        }*/

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "eliminar")
            {

                // Convert the row index stored in the CommandArgument
                // property to an Integer.
                int index = Convert.ToInt32(e.CommandArgument);

                // Get the last name of the selected author from the appropriate
                // cell in the GridView control.
                GridViewRow selectedRow = GridView1.Rows[index];
                TableCell id = selectedRow.Cells[0];
                int ide = Convert.ToInt32(id.Text);

                // Display the selected author.
                string query = "select eliminarCliente(";

                query += "'" + ide + "','"+ user +"')";

                con.Query(query);
                GridView1.DataBind();

            }
            else if (e.CommandName == "modificar") { 
                            
            }
        }

       

    }
}
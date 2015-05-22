using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bases2proyecto
{
    public partial class poliza : System.Web.UI.Page
    {
 
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("nuevapoliza.aspx", true);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("modificarpoliza.aspx",true);
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "modificar")
            {
                int index = Convert.ToInt32(e.CommandArgument);

                GridViewRow selectedRow = GridView1.Rows[index];
                TableCell id_poliza = selectedRow.Cells[0];
                TableCell id_ts = selectedRow.Cells[7];
               
                Response.Redirect("~/modificarpoliza.aspx?idPoliza=" + id_poliza.Text + "&tipoSeguro=" + id_ts.Text);

            }
        }

       
    }
}
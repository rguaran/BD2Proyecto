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

        ConexionBD con;
        DataSet Ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new ConexionBD();
            Label1.Text = (String)Session["titulo"];
            
            if (!IsPostBack)
            {
                BindData();
            }
        }

        private void BindData()
        {
            GridView1.AllowPaging = true;
            GridView1.AllowSorting = true;
            string item = (string)Session["select"];
            string strCommand = "SELECT * FROM " + item;
            Ds = con.consulta(strCommand);
            DataTable Dt = Ds.Tables[0];

            GridView1.DataSource = Ds;
            GridView1.DataBind();
            GridView1.HorizontalAlign = HorizontalAlign.Center;
            
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
                       
            Response.Redirect("editar.aspx", true);
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("editar.aspx", true);
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("suprimir.aspx", true);
        }

    }
}
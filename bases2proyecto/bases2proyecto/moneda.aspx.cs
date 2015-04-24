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
        private ConexionBD con;
        private DataSet Ds;
        private ArrayList Titulos;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataBind();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            /*string strCommand = "SELECT moneda.* FROM moneda";
            con = new ConexionBD();
            Ds = con.consulta(strCommand);
            DataTable Dt = Ds.Tables[0];
            Titulos = new ArrayList();
            for (int i = 0; i < Dt.Columns.Count; i++)
            {
                Titulos.Add(Dt.Columns[i].ColumnName);
            }
            Session["Titulos"] = Titulos;
            DataRow dr = Dt.NewRow();
            Dt.Rows.InsertAt(dr, 0);
            GridView1.EditIndex = 0;
            GridView1.DataSource = Dt;
            //GridView1.DataBind();
            //Changing the Text for Inserting a New Record
            ((LinkButton)GridView1.Rows[0].Cells[0].Controls[0]).Text = "Insert";
            GridView1.HorizontalAlign = HorizontalAlign.Center;*/
        }
    }
}
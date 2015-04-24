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
    public partial class tiposeguro : System.Web.UI.Page
    {
        private ConexionBD con;
        private DataSet Ds;
        private ArrayList Titulos;

        protected void Page_Load(object sender, EventArgs e)
        {
            con = new ConexionBD();
            if (!IsPostBack)
            {
                BindData();
            }

        }

        private void BindData()
        {
            string item = (string)Session["Item"];
            string strCommand = "select * from consultarTipoSeguro()";
            Ds = con.consulta(strCommand);
            DataTable Dt = Ds.Tables[0];
            Titulos = new ArrayList();
            for (int i = 0; i < Dt.Columns.Count; i++)
            {
                Titulos.Add(Dt.Columns[i].ColumnName);
            }
            Session["Titulos"] = Titulos;
            GridView1.DataSource = Ds;
            GridView1.DataBind();
            GridView1.HorizontalAlign = HorizontalAlign.Center;
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

            GridView1.EditIndex = e.NewEditIndex;

            BindData();

        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

            GridView1.EditIndex = -1;

            BindData();

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        { 
        }
    }
}
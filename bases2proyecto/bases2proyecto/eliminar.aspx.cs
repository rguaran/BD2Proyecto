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
    public partial class WebForm7 : System.Web.UI.Page
    {
        private ConexionBD con;
        private DataSet Ds;
        private ArrayList Titulos;
        string user = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (String)Session["user"];
            con = new ConexionBD();
            if (!IsPostBack)
            {
                BindData();
            }
        }

        private void BindData()
        {
            string item = (string)Session["Item"];
            string strCommand = "SELECT * FROM consultar_" + item + "()";
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

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string[] valores = new string[e.Values.Count];
            e.Values.Values.CopyTo(valores, 0);
            Titulos = (ArrayList)Session["Titulos"];
            string query = "select delete_" + (string)Session["Item"] + "(";

            query += "'" + valores[0] + "','"+user+"')";
                        
            con.Query(query);
            BindData();

        }

        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            if ((string)Session["lugar"] == "mantenimiento.aspx")
            {
                Response.Redirect("Mantenimiento.aspx", true);
            }
            else
            {
                Response.Redirect("clientesmantenimiento.aspx", true);
            }
        }
        
    }
}
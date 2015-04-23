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
    public partial class WebForm3 : System.Web.UI.Page
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
            string strCommand = "SELECT " + item + ".* FROM " + item;
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
            string query = "Delete From " + (string)Session["Item"];

            if (((string)Session["Item"]).Equals("asignacion_recurso"))
            {
                query += " where (" + Titulos[2] + " = '" + valores[2] + "' and " + Titulos[3] + " = '" + valores[3] + "' and " + Titulos[4] + " = '" + valores[4] + "')";
            }
            else if (((string)Session["Item"]).Equals("asignacion_tarea"))
            {
                query += " where (" + Titulos[2] + " = '" + valores[2] + "' and " + Titulos[3] + " = '" + valores[3] + "' and " + Titulos[4] + " = '" + valores[4] + "' and " + Titulos[5] + " = '" + valores[5] + "')";
            }
            else if (((string)Session["Item"]).Equals("plaza_empleado"))
            {
                query += " where (" + Titulos[2] + " = '" + valores[2] + "' and " + Titulos[3] + " = '" + valores[3] + "')";
            }
            else if (((string)Session["Item"]).Equals("pais_idioma"))
            {
                query += " where (" + Titulos[0] + " = '" + valores[0] + "' and " + Titulos[1] + " = '" + valores[1] + "')";
            }
            else
            {
                query += " where " + Titulos[0] + " = '" + valores[0] + "'";
            }

            con.Query(query);
            BindData();

        }

        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            Response.Redirect("mantenimiento.aspx", true);
        }
    }
}
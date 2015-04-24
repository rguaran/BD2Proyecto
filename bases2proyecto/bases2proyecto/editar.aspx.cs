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
    public partial class WebForm5 : System.Web.UI.Page
    {
        ConexionBD con;
        DataSet Ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new ConexionBD();
            Label1.Text = "Editar " + Session["titulo"];
            if (!IsPostBack)
            {
                BindData();
            }
        }

        private void BindData()
        {
            string item = (string)Session["select"];
            string strCommand = "SELECT * FROM " + item;
            Ds = con.consulta(strCommand);
            DataTable Dt = Ds.Tables[0];
            
            GridView1.DataSource = Ds;
            GridView1.DataBind();
            GridView1.HorizontalAlign = HorizontalAlign.Center;
            GridView1.AllowPaging = true;
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
            string item = "";
            int iniciar = 0;
            if (((LinkButton)GridView1.Rows[0].Cells[0].Controls[0]).Text == "Insertar")
            {
                item = (string)Session["insert"];
                iniciar = (Int32)Session["iniciarInsert"];
            }
            else
            {
                item = (string)Session["update"];
                iniciar = (Int32)Session["iniciar"];
            }
            string query = "SELECT " + item + "(";
            string[] valores = new string[e.NewValues.Count];
            e.NewValues.Values.CopyTo(valores, 0);
           
            
            for (int i = iniciar; i < e.NewValues.Count; i++)
            {
                query += "'" + valores[i] + "' ";
                if (i != e.NewValues.Count - 1)
                {
                    query += ", ";
                }

            }
            query += ")";
            GridView1.EditIndex = -1;
            con.Query(query);
            BindData();
        }



        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Response.Redirect((string)Session["origen"]+".aspx", true);
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            string item = (string)Session["select"];
            string strCommand = "SELECT * FROM " + item;
            Ds = con.consulta(strCommand);
            DataTable Dt = Ds.Tables[0];
            
            DataRow dr = Dt.NewRow();
            Dt.Rows.InsertAt(dr, 0);
            GridView1.EditIndex = 0;
            GridView1.DataSource = Dt;
            GridView1.DataBind();
            //Changing the Text for Inserting a New Record
            ((LinkButton)GridView1.Rows[0].Cells[0].Controls[0]).Text = "Insertar";
            GridView1.HorizontalAlign = HorizontalAlign.Center;
        }

        

    }
}
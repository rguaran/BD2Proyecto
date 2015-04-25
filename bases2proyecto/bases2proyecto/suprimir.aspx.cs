using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace bases2proyecto
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        private ConexionBD con;
        private DataSet Ds;
        

        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "Eliminar " + Session["titulo"];
            con = new ConexionBD();
            if (!IsPostBack)
            {
                BindData();
            }
        }

        private void BindData()
        {
            GridView1.AllowPaging = true;
            string item = (string)Session["select"];
            string strCommand = "SELECT * FROM " + item;
            Ds = con.consulta(strCommand);
            DataTable Dt = Ds.Tables[0];

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

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string[] valores = new string[e.Values.Count];
            e.Values.Values.CopyTo(valores, 0);
            string item = (string)Session["delete"];
            string query = "SELECT " + item + "('" + Session["usuario"] + "',";
            int iniciar = (Int32)Session["iniciar"];
            int final = (Int32)Session["final"];
            for (int i = iniciar; i < final; i++)
            {
                query += "'" + valores[i] + "' ";
                if (i != final - 1)
                {
                    query += ", ";
                }

            }
            query = query + ")";

            con.Query(query);
            BindData();

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Response.Redirect((string)Session["origen"] + ".aspx", true);
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindData();
        }


       
    }
}
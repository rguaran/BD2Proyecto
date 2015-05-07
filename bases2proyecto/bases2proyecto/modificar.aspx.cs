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
    public partial class modificar : System.Web.UI.Page
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

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (((LinkButton)GridView1.Rows[0].Cells[0].Controls[0]).Text == "Insert")
            {
                string query = "Select insertar_" + (string)Session["Item"] + "('" + user + "',";
                string[] valores = new string[e.NewValues.Count];
                e.NewValues.Values.CopyTo(valores, 0);
                Titulos = (ArrayList)Session["Titulos"];

                if ((string)Session["Item"] == "tipo_de_seguro")
                {
                    for (int i = 0; i < e.NewValues.Count; i++)
                    {
                        query += "'" + valores[i] + "' ";
                        if (i != e.NewValues.Count - 1)
                        {
                            query += ", ";
                        }

                    }
                }
                else
                {
                    for (int i = 1; i < e.NewValues.Count; i++)
                    {
                        query += "'" + valores[i] + "' ";
                        if (i != e.NewValues.Count - 1)
                        {
                            query += ", ";
                        }

                    }
                }
                query += ")";
                GridView1.EditIndex = -1;
                con.Query(query);
                BindData();
            }
            else
            {
                string query = "select update_" + (string)Session["Item"] + "('" + user + "',";
                string[] valores = new string[e.NewValues.Count];
                e.NewValues.Values.CopyTo(valores, 0);
                Titulos = (ArrayList)Session["Titulos"];
                query += " '" + valores[0] + "'";

                query += ", ";
                for (int i = 1; i < e.NewValues.Count; i++)
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
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

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

        protected void BtnAgregar_Click(object sender, EventArgs e)
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
            DataRow dr = Dt.NewRow();
            Dt.Rows.InsertAt(dr, 0);
            GridView1.EditIndex = 0;
            GridView1.DataSource = Dt;
            GridView1.DataBind();
            //Changing the Text for Inserting a New Record
            ((LinkButton)GridView1.Rows[0].Cells[0].Controls[0]).Text = "Insert";
            GridView1.HorizontalAlign = HorizontalAlign.Center;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;

namespace bases2proyecto
{
    public partial class bien : System.Web.UI.Page
    {
        ConexionBD con;
        DataSet Ds;
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
            GridView1.AllowPaging = true;

            string strCommand = "SELECT * FROM seleccionarbien('" + (string)Session["tipoSeguro"] + "', " + (string)Session["idPoliza"] + ")";
            Ds = con.consulta(strCommand);
            DataTable Dt = Ds.Tables[0];

            GridView1.DataSource = Ds;
            GridView1.DataBind();
            GridView1.HorizontalAlign = HorizontalAlign.Center;

        }

        private void BindData2()
        {
            GridView1.AllowPaging = true;

            string strCommand = "SELECT * FROM seleccionarbienreducido('" + (string)Session["tipoSeguro"] + "', " + (string)Session["idPoliza"] + ")";
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

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string item = "";
            string terminar = ")";
            int iniciar = 0;
            if (((LinkButton)GridView1.Rows[0].Cells[0].Controls[0]).Text == "Insertar")
            {
                item = "insertarbien";
                terminar = ",'" + (string)Session["tipoSeguro"] + "', " + (string)Session["idPoliza"] + ")";
            }
            else
            {
                item = "actualizarbien";
                iniciar = 0;
            }
            string query = "SELECT " + item + "('" + Session["usuario"] + "',";
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


            query += terminar;
            GridView1.EditIndex = -1;
            con.Query(query);
            BindData();
        }



        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Response.Redirect("poliza.aspx", true);
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {

            string strCommand = "SELECT * FROM seleccionarbienreducido('" + (string)Session["tipoSeguro"] + "', " + (string)Session["idPoliza"] + ")";
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

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void btnInspeccion_Click(object sender, EventArgs e)
        {
            Session["insert"] = "insertarInspeccion";
            Session["select"] = "seleccionarInspeccion('" + (string)Session["tipoSeguro"] + "', " + (string)Session["idPoliza"] + ")";
            Session["update"] = "actualizarInspeccion";
            Session["delete"] = "eliminarInspeccion";
            Session["origen"] = "bien";
            Session["titulo"] = "Inspeccion";
            Session["iniciar"] = 0;
            Session["iniciarInsert"] = 1;
            Session["final"] = 1;
            Response.Redirect("editar.aspx", true);
        }



    }
}
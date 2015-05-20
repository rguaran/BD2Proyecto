using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bases2proyecto
{
    public partial class nuevapoliza : System.Web.UI.Page
    {
        ConexionBD con;

        protected void Page_Load(object sender, EventArgs e)
        {
            con = new ConexionBD();
        }

        

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            insertarpoliza();
        }


        public void insertarpoliza()
        {
            DateTime fechainicio = Convert.ToDateTime(txtfechainicio.Text);
            DateTime fechafin = Convert.ToDateTime(txtfechafinal.Text);
            try
            {
                string sql = "select insertarPoliza('" + (String)Session["user"] + "',";
                string sql2 = ddlestado.SelectedValue + "," + ddlcondicionesparticulares.SelectedValue + ",'" + fechainicio.ToString("dd/MM/yyyy") + "','" +
                              fechafin.ToString("dd/MM/yyyy") + "','" + txtclausulas.Text + "'," + ddlcliente.SelectedValue + ",'" + ddltiposeguro.SelectedValue + "','" + ddlpolizavieja.SelectedValue + "'," +
                              txtmeses.Text + ",'" + txtdescripcion.Text + "','" + ddlstatus.SelectedItem + "'," +txtprecio.Text +"," + txtvalorseguro.Text + "," + ddlvendedor.SelectedItem + "," + ddloperador.SelectedItem + "," + ddlnegociador.SelectedItem + ",'" +
                                  txtcodigoventa.Text + "','" + txtcoveradicionales.Text + "'," + ddlvendedor.SelectedValue + "," + ddloperador.SelectedValue + "," + ddlnegociador.SelectedValue + ")";
                con.Query(sql + sql2);

                Session["tipoSeguro"] = ddltiposeguro.SelectedValue;
                //Session["ts"] = ddltiposeguro.SelectedItem;

                string idpoliza = con.getIDpoliza(sql2);

                Session["idPoliza"] = idpoliza;

                Response.Write("<script languaje = javascript>alert('Se ha creado la Poliza! " + ddltiposeguro.SelectedValue +  "-"+ idpoliza + " '); </script>");
            }
            catch (Exception ex) { }

        }

        protected void btnbeneficiarios_Click(object sender, EventArgs e)
        {
            Response.Redirect("beneficiarios.aspx", true);
        }

        protected void btnplanpagos_Click(object sender, EventArgs e)
        {
            Response.Redirect("nuevoplanpago.aspx", true);
        }

        protected void btnadjuntararchivos_Click(object sender, EventArgs e)
        {
            Response.Redirect("archivos.aspx", true);
        }

        protected void btnbienes_Click(object sender, EventArgs e)
        {
            Response.Redirect("bien.aspx", true);
        }

        protected void btncoberturas_Click(object sender, EventArgs e)
        {
            Response.Redirect("cobertura.aspx", true);
        }


    }
}
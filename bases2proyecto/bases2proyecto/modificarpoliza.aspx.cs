using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bases2proyecto
{
    public partial class modificarpoliza : System.Web.UI.Page
    {
        string tipo_seguro;
        string no_poliza;
        string usuario;
        ConexionBD conn = new ConexionBD();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            //tipo_seguro = (string)Session["tipoSeguro"];
            //no_poliza = (string)Session["idPoliza"];
            usuario = (String)Session["user"];
            tipo_seguro = Request.QueryString["tipoSeguro"];
            no_poliza = Request.QueryString["idPoliza"];
            
            txtnopoliza.Text = no_poliza;
            ddltiposeguro.DataBind();
            ddltiposeguro.SelectedIndex = -1;
            ddltiposeguro.Items.FindByValue(tipo_seguro).Selected = true;
          
            DataSet ds = conn.consulta("select * from getpoliza(" +no_poliza+",'" +tipo_seguro+ "')");
            string cliente = ds.Tables[0].Rows[0][6].ToString();
            string fechainicio = ds.Tables[0].Rows[0][3].ToString();
            string fechafin = ds.Tables[0].Rows[0][4].ToString();
            string descripcion = ds.Tables[0].Rows[0][10].ToString();
            string estado = ds.Tables[0].Rows[0][1].ToString();
            string polizavieja = ds.Tables[0].Rows[0][8].ToString();
            string clasulas = ds.Tables[0].Rows[0][5].ToString();
            string codigoventa = ds.Tables[0].Rows[0][17].ToString();
            string coberturasadicionales = ds.Tables[0].Rows[0][18].ToString();
            string condparticulares = ds.Tables[0].Rows[0][2].ToString();
            string vendedor = ds.Tables[0].Rows[0][14].ToString();
            string operador = ds.Tables[0].Rows[0][15].ToString();
            string negociador = ds.Tables[0].Rows[0][16].ToString();
            string cvendedor = ds.Tables[0].Rows[0][19].ToString();
            string coperador = ds.Tables[0].Rows[0][20].ToString();
            string cnegociador = ds.Tables[0].Rows[0][21].ToString();
            string precio = ds.Tables[0].Rows[0][12].ToString();
            string valorseguro = ds.Tables[0].Rows[0][13].ToString();

            ddlcliente.DataBind();
            ddlcliente.SelectedIndex = -1;
            ddlcliente.Items.FindByValue(cliente).Selected = true;

            DateTime dtfechaini = Convert.ToDateTime(fechainicio);
            txtfechainicio.Text = dtfechaini.ToString("yyyy-MM-dd");

            DateTime dtfechafin = Convert.ToDateTime(fechafin);
            txtfechafinal.Text = dtfechafin.ToString("yyyy-MM-dd");

            txtdescripcion.Text = descripcion;

            ddlestado.DataBind();
            ddlestado.SelectedIndex = -1;
            ddlestado.Items.FindByValue(estado).Selected = true;

            ddlpolizavieja.DataBind();
            ddlpolizavieja.SelectedIndex = -1;
            ddlpolizavieja.Items.FindByValue(polizavieja).Selected = true;

            txtclausulas.Text = clasulas;

            txtcodigoventa.Text = codigoventa;

            txtcoveradicionales.Text = coberturasadicionales;

            ddlcondicionesparticulares.DataBind();
            ddlcondicionesparticulares.SelectedIndex = -1;
            ddlcondicionesparticulares.Items.FindByValue(condparticulares).Selected = true;

            ddlvendedor.DataBind();
            ddlvendedor.SelectedIndex = -1;
            ddlvendedor.Items.FindByText(vendedor).Selected = true;

            ddloperador.DataBind();
            ddloperador.SelectedIndex = -1;
            ddloperador.Items.FindByText(operador).Selected = true;

            ddlnegociador.DataBind();
            ddlnegociador.SelectedIndex = -1;
            ddlnegociador.Items.FindByText(negociador).Selected = true;

            txtprecio.Text = precio;

            txtvalorseguro.Text = valorseguro;
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            DateTime fechai = Convert.ToDateTime(txtfechainicio.Text);
            DateTime fechaf = Convert.ToDateTime(txtfechafinal.Text);

            
                string sql = "select modificarPoliza('" + usuario + "',";
                string sql2 = no_poliza + "," + ddlestado.SelectedValue + "," + ddlcondicionesparticulares.SelectedValue + ",'" + fechai.ToString("dd/MM/yyyy") + "','" +
                              fechaf.ToString("dd/MM/yyyy") + "','" + txtclausulas.Text + "'," + ddlcliente.SelectedValue + ",'" + tipo_seguro + "','" + ddlpolizavieja.SelectedValue + "','" 
                              + txtdescripcion.Text + "','" + ddlstatus.SelectedItem + "'," + txtprecio.Text + "," + txtvalorseguro.Text + "," + ddlvendedor.SelectedItem + "," + ddloperador.SelectedItem + "," + ddlnegociador.SelectedItem + ",'" +
                              txtcodigoventa.Text + "','" + txtcoveradicionales.Text + "'," + ddlvendedor.SelectedValue + "," + ddloperador.SelectedValue + "," + ddlnegociador.SelectedValue + ")";
                conn.Query(sql + sql2);

                Response.Redirect("~/modificarpoliza.aspx?idPoliza=" + no_poliza + "&tipoSeguro=" + tipo_seguro);
                Response.Write("<script languaje = javascript>alert('Poliza Modificada! " + tipo_seguro + "-" + no_poliza + " '); </script>");
        }
    }
}
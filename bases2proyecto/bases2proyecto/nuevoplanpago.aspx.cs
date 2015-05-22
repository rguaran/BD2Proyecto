using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bases2proyecto
{
    public partial class WebForm1 : System.Web.UI.Page
    {
       
        string tipo_seguro;
        string no_poliza;

        protected void Page_Load(object sender, EventArgs e)
        {
         
            tipo_seguro = (string)Session["tipoSeguro"];
            no_poliza = (string)Session["idPoliza"];
            
            if (!IsPostBack)
            {
                //BindData();
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            float prima = float.Parse(txtPrima.Text);
            float noCuotas = float.Parse(txtNoCuotas.Text);
            float recargo = float.Parse(txtRecargo.Text);
            float pcnDeducible = float.Parse(txtPorcentajeDeducible.Text);
            float deducible = prima * pcnDeducible / 100;

            float pagoCuota = (prima * (recargo / 100 + 1) / noCuotas);
            txtDeducible.Text = deducible.ToString();
            
            ConexionBD con = new ConexionBD();

            string query = "SELECT insertarplandepagos('" + Session["usuario"] + "',";
            query += prima + "," + noCuotas + "," + recargo + "," + DropDownList1.SelectedValue + ",";
            query += 0 + ",'" + tipo_seguro + "'," + no_poliza + "," + pcnDeducible + "," + deducible + "," + txtTipoCuota.Text + "," + DropDownList2.SelectedValue;
            query += ")";
            con.Query(query);
            Label1.Text = "Plan de pagos guardado exitosamente";
        }

        protected void btnDetalle_Click(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void btnContinuar_Click(object sender, EventArgs e)
        {
            Response.Redirect("nuevapoliza.aspx", true);
        }


       
    }
}
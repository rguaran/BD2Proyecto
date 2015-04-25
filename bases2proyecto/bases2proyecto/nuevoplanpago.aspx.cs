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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {
            
            
        }

        protected void txtDeducible_TextChanged(object sender, EventArgs e)
        {
     
        }

        protected void txtPrima_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void txtPorcentajeDeducible_TextChanged(object sender, EventArgs e)
        {
            

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
            txtPagoCuota.Text = pagoCuota.ToString();

            /*ConexionBD con = new ConexionBD();
            con.executeQuery("insertarMoneda('pago"+pagoCuota.ToString()+"');");*/
        }

        protected void btnDetalle_Click(object sender, EventArgs e)
        {

        }


       
    }
}
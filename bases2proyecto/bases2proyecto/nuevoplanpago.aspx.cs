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
        string nuevo;
        string tipo_seguro;
        int no_poliza;

        protected void Page_Load(object sender, EventArgs e)
        {
            nuevo = (string)Session["nuevoPlanPago"];
            tipo_seguro = (string)Session["tipoSeguro"];
            no_poliza = (Int32)Session["idPoliza"];
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
            txtPagoCuota.Text = pagoCuota.ToString();


        }

        protected void btnDetalle_Click(object sender, EventArgs e)
        {

        }


       
    }
}
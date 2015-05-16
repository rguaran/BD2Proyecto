using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bases2proyecto
{
    public partial class verReporte : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ocultarFiltros();
            int reporte = (int)Session["noReporte"];

            if (reporte == 2 || reporte == 3 || reporte == 5 || reporte == 7 || reporte == 9 || reporte == 11 || reporte == 13)
            {
                lblFiltros.Visible = true;
                btnActualizar.Visible = true;
            }

            switch (reporte)
            {
                case 2: lblTipoSeguro.Visible = true; cmbTipoSeguro.Visible = true; 
                        lblMoneda.Visible = true; cmbMoneda.Visible = true; break;
                case 3: lblTipoSeguro.Visible = true; cmbTipoSeguro.Visible = true; 
                    lblPoliza.Visible = true; txtPoliza.Visible = true; 
                    lblTipoCliente.Visible = true; txtCliente.Visible = true; 
                    lblAgente.Visible = true; txtAgente.Visible = true; break;

            }
        }

        private void ocultarFiltros()
        {
            lblFiltros.Visible = false;
            btnActualizar.Visible = false;
            lblTipoSeguro.Visible = false;
            cmbTipoSeguro.Visible = false;
            lblTipoCliente.Visible = false;
            txtCliente.Visible = false;
            lblMoneda.Visible = false;
            cmbMoneda.Visible = false;
            lblPoliza.Visible = false;
            txtPoliza.Visible = false;
            lblAgente.Visible = false;
            txtAgente.Visible = false;
            lblUsuario.Visible = false;
            txtUsuario.Visible = false;
            lblVendedor.Visible = false;
            txtVendedor.Visible = false;
            lblTop.Visible = false;
            chkTop.Visible = false;
            lblFecha.Visible = false;
            txtFecha.Visible = false;
            lblAccion.Visible = false;
            cmbAccion.Visible = false;
            lblPolizaVieja.Visible = false;
            cmbPolizaVieja.Visible = false;
        }
    }
}
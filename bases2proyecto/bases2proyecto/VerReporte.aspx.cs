using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Globalization;

using System.Text;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;

namespace bases2proyecto
{
    public partial class verReporte : System.Web.UI.Page
    {
        ConexionBD con;
        DataSet Ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            ocultarFiltros();

            int reporte = (int)Session["noReporte"];

            if (!(reporte == 1 || reporte == 10 || reporte == 14 ))
            {
                lblFiltros.Visible = true;
                btnActualizar.Visible = true;
            }

            switch (reporte)
            {
                case 2: lblTipoSeguro.Visible = true; cmbTipoSeguro.Visible = true; 
                        //lblMoneda.Visible = true; cmbMoneda.Visible = true; 
                        break;

                case 3: lblTipoSeguro.Visible = true; cmbTipoSeguro.Visible = true;  
                    lblPoliza.Visible = true; txtPoliza.Visible = true; 
                    lblTipoCliente.Visible = true; txtCliente.Visible = true; 
                    lblAgente.Visible = true; txtAgente.Visible = true; lblAgente.Text = "Agente";
                    lblPolizaVieja.Visible = true; cmbPolizaVieja.Visible = true; break;

                case 4: lblMoneda.Visible = true; cmbMoneda.Visible = true; break;

                case 5: lblAgente.Visible = true; txtAgente.Visible = true; lblAgente.Text = "Empleado";
                        lblPoliza.Visible = true; txtPoliza.Visible = true; break;

                case 6: lblMoneda.Visible = true; cmbMoneda.Visible = true; break;

                case 7: lblVendedor.Visible = true; txtVendedor.Visible = true; lblVendedor.Text = "Código vendedor";
                        lblMoneda.Visible = true; cmbMoneda.Visible = true; break;

                case 8: lblMoneda.Visible = true; cmbMoneda.Visible = true;
                        lblAgente.Visible = true; txtAgente.Visible = true; break;

                case 9: lblTop.Visible = true; chkTop.Visible = true; 
                        lblMoneda.Visible = true; cmbMoneda.Visible = true; break;

                case 11: lblFechaInicio.Visible = true; txtFechaInicio.Visible = true;
                    lblFechaFinal.Visible = true; txtFechaFinal.Visible = true;
                    lblAccion.Visible = true; cmbAccion.Visible = true;
                    lblPoliza.Visible = true; txtPoliza.Visible = true;
                    lblUsuario.Visible = true; txtUsuario.Visible = true; break;

                case 12: lblMoneda.Visible = true; cmbMoneda.Visible = true; break;

                case 13: lblMoneda.Visible = true; cmbMoneda.Visible = true;
                    lblTipoCliente.Visible = true; txtCliente.Visible = true; break;


            }

            lblTitulo.Text = (string)Session["titulo"];
            con = new ConexionBD();

            if (reporte == 1 || reporte == 5 || reporte == 10 || reporte == 14)
            {
                llenarGrid(true);
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
            lblFechaInicio.Visible = false; 
            txtFechaInicio.Visible = false;
            lblFechaFinal.Visible = false;
            txtFechaFinal.Visible = false;
            lblAccion.Visible = false;
            cmbAccion.Visible = false;
            lblPolizaVieja.Visible = false;
            cmbPolizaVieja.Visible = false;
            
        }

        protected void btnPDF_Click(object sender, EventArgs e)
        {
            llenarGrid(false);
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename="+lblTitulo.Text+".pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            HtmlForm frm = new HtmlForm();
            gridReporte.Parent.Controls.Add(frm);
            frm.Attributes["runat"] = "server";
            frm.Controls.Add(gridReporte);
            frm.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
            llenarGrid(true);
        }


        protected void btnExcel_Click(object sender, EventArgs e)
        {
            llenarGrid(false);
            string attachment = "attachment; filename=" + lblTitulo.Text + ".xlsx";
            Response.ClearContent();
            Response.AddHeader("content-disposition", attachment);
            Response.ContentType = "application/ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            HtmlForm frm = new HtmlForm();
            gridReporte.Parent.Controls.Add(frm);
            frm.Attributes["runat"] = "server";
            frm.Controls.Add(gridReporte);
            frm.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();
            llenarGrid(true);
        }

        private string obtenerParametros()
        {
            string devolver = "";
            int reporte = (int)Session["noReporte"];

            switch (reporte)
            {
                case 2:
                    devolver += "'" + cmbTipoSeguro.SelectedValue + "'";
                    break;
                case 3:

                    if (txtPoliza.Text.Length > 0) { devolver += "'numeropoliza'," + txtPoliza.Text; break; } 
                    if (txtCliente.Text.Length > 0) { devolver += "'cliente','" + txtCliente.Text+"'"; }
                    if (txtAgente.Text.Length > 0) { devolver += "'agentenegocio','" + txtAgente.Text + "'"; }
                    if (cmbTipoSeguro.SelectedIndex == -1) { devolver += "'tiposeguro','" + cmbTipoSeguro.SelectedValue + "'"; }
                    if (cmbPolizaVieja.SelectedIndex == -1) { devolver += "'polizavieja','" +  cmbPolizaVieja.SelectedValue + "'"; }
                    break;
                case 4:
                    devolver += cmbMoneda.SelectedValue;
                    break;
                case 5:
                    if (txtAgente.Text.Length > 0) {devolver += "'%" + txtAgente.Text + "%'";}
                    if (txtPoliza.Text.Length > 0) { if (txtAgente.Text.Length > 0) { devolver += ","; } devolver +=  txtPoliza.Text ; }
                    
                    break;
                case 6:
                    devolver += cmbMoneda.SelectedValue;
                    break;

                case 7:
                    devolver += cmbMoneda.SelectedValue;
                    devolver += ", '%" + txtVendedor.Text + "%'";

                    break;
                case 8:
                    devolver += cmbMoneda.SelectedValue;
                    if (txtAgente.Text.Length > 0) { devolver += ",'%" + txtAgente.Text + "%'"; }
                    break;
                case 9:
                    devolver += cmbMoneda.SelectedValue;
                    if (chkTop.Items[0].Selected)
                    {
                        devolver += ",0";
                    }
                    if (chkTop.Items[1].Selected)
                    {
                        devolver += ",1";
                    }
                    if (chkTop.Items[2].Selected)
                    {
                        devolver += ",2";
                    }
                    
                    break;
                case 11:
                    if (txtUsuario.Text.Length > 0 && cmbAccion.SelectedIndex > -1) { devolver += "'%"+txtUsuario.Text+"%','%"+cmbAccion.SelectedValue+"%'"; }
                    if (txtFechaInicio.Text.Length > 0 && txtFechaFinal.Text.Length > 0) { devolver += "'" + txtFechaInicio.Text + "','" + txtFechaFinal.Text + "'"; }
                    break;
                case 13:
                    devolver += cmbMoneda.SelectedValue;
                    if (txtCliente.Text.Length > 0) { devolver += ",'%"+txtCliente.Text+"%'";}
                    break;
                default: break;
            }

            return devolver;
        }

        private void llenarGrid(Boolean page) {
            string consulta = (string)Session["consulta"];
            consulta += obtenerParametros() + ")";
            gridReporte.AllowPaging = page;
            Ds = con.consulta(consulta);
            DataTable Dt = Ds.Tables[0];

            gridReporte.DataSource = Ds;
            gridReporte.DataBind();
            gridReporte.HorizontalAlign = HorizontalAlign.Center;
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            llenarGrid( true);
        }

        protected void gridReporte_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridReporte.PageIndex = e.NewPageIndex;
            llenarGrid(true);
        }
    }
}
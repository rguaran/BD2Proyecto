using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using Npgsql;

namespace bases2proyecto
{
    public partial class frmreporte1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            poblarReporte();
            //CrystalReportViewer1.Visible = true;
            //ReportDocument rDoc = new ReportDocument();
            //Reporte1 dset = new Reporte1(); // dataset file name
            //DataTable dtable = new DataTable(); // data table name
            //dtable.TableName = "Reporte 1 - Clientes";  // Crystal Report Name
            //rDoc.Load(Server.MapPath("/reporte1.rpt")); // Your .rpt file path
            //rDoc.SetDataSource(dset); //set dataset to the report viewer.
            //CrystalReportViewer1.ReportSource = rDoc;
            //CrystalReportViewer1.RefreshReport();
        }

        private void poblarReporte() {
            string sqlClientes = "select * from consultar_cliente()";
            string sqlPais = "select * from consultar_pais()";
            string sqlTipoCliente = "select * from consultar_tipo_cliente()";

            Reporte1 ds = new Reporte1();

            try {
                NpgsqlConnection conne = new NpgsqlConnection("Server=localhost;User Id=postgres;Password=admin123;Database=proyectoBD2;");
                NpgsqlDataAdapter sqlDaClientes = new NpgsqlDataAdapter(sqlClientes, conne);
                NpgsqlDataAdapter sqlDaPais = new NpgsqlDataAdapter(sqlPais, conne);
                NpgsqlDataAdapter sqlDaTipoCliente = new NpgsqlDataAdapter(sqlTipoCliente, conne);

                sqlDaClientes.Fill(ds,"cliente");
                sqlDaPais.Fill(ds, "pais");
                sqlDaTipoCliente.Fill(ds,"tipo_cliente");

                reporte1 rep = new reporte1();
                rep.SetDataSource(ds);
                CrystalReportViewer1.ReportSource = rep;
            }catch(Exception e){
                Console.Write(e.Message);
            }
        }
    }
}
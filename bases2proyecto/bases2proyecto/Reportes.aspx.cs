using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bases2proyecto
{
    public partial class Reportes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnreporte1_Click(object sender, EventArgs e)
        {
            Session["noReporte"] = 1;
            Session["titulo"] = "Reporte de clientes";
            Session["consulta"] = "Select * from reporte1(";
            Response.Redirect("VerReporte.aspx", true);
        }

        protected void btnreporte9_Click(object sender, EventArgs e)
        {
            Session["noReporte"] = 9;
            Session["titulo"] = "Reporte TOP 10 de clientes";
            Session["consulta"] = "Select * from reporte9(";
            Response.Redirect("VerReporte.aspx", true);
        }

        protected void btnreporte2_Click(object sender, EventArgs e)
        {
            Session["noReporte"] = 2;
            Session["titulo"] = "Reporte de totales por Tipo de Seguro";
            Session["consulta"] = "Select * from reporte2(";
            Response.Redirect("VerReporte.aspx", true);
        }

        protected void btnreporte3_Click(object sender, EventArgs e)
        {
            Session["noReporte"] = 3;
            Session["titulo"] = "Reporte de Búsqueda de Pólizas";
            Session["consulta"] = "Select * from reporte3(";
            Response.Redirect("VerReporte.aspx", true);
        }

        protected void btnreporte4_Click(object sender, EventArgs e)
        {
            Session["noReporte"] = 4;
            Session["titulo"] = "Reporte de Total asegurado, Total pagado y deuda total";
            Session["consulta"] = "Select * from reporte4(";
            Response.Redirect("VerReporte.aspx", true);
        }

        protected void btnreporte5_Click(object sender, EventArgs e)
        {
            Session["noReporte"] = 5;
            Session["titulo"] = "Reporte de empleados con pólizas asociadas";
            Session["consulta"] = "Select * from reporte5(";
            Response.Redirect("VerReporte.aspx", true);
        }

        protected void btnreporte6_Click(object sender, EventArgs e)
        {
            Session["noReporte"] = 6;
            Session["titulo"] = "Reporte de suma de coberturas";
            Session["consulta"] = "Select * from reporte6(";
            Response.Redirect("VerReporte.aspx", true);
        }

        protected void btnreporte7_Click(object sender, EventArgs e)
        {
            Session["noReporte"] = 7;
            Session["titulo"] = "Reporte sumarizado y agrupado por vendedor";
            Session["consulta"] = "Select * from reporte7(";
            Response.Redirect("VerReporte.aspx", true);
        }

        protected void btnreporte8_Click(object sender, EventArgs e)
        {
            Session["noReporte"] = 8;
            Session["titulo"] = "Reporte sumarizado de Agente del negocio";
            Session["consulta"] = "Select * from reporte8(";
            Response.Redirect("VerReporte.aspx", true);
        }

        protected void btnreporte10_Click(object sender, EventArgs e)
        {
            Session["noReporte"] = 10;
            Session["titulo"] = "Reporte de flujo de inspecciones";
            Session["consulta"] = "Select * from reporte10(";
            Response.Redirect("VerReporte.aspx", true);
        }

        protected void btnreporte11_Click(object sender, EventArgs e)
        {
            Session["noReporte"] = 11;
            Session["titulo"] = "Reporte de Bitácora de transaccioness";
            Session["consulta"] = "Select * from reporte11(";
            Response.Redirect("VerReporte.aspx", true);
        }

        protected void btnreporte12_Click(object sender, EventArgs e)
        {
            Session["noReporte"] = 12;
            Session["titulo"] = "Reporte de cuotas y deuda por cliente";
            Session["consulta"] = "Select * from reporte12(";
            Response.Redirect("VerReporte.aspx", true);
        }

        protected void btnreporte13_Click(object sender, EventArgs e)
        {
            Session["noReporte"] = 13;
            Session["titulo"] = "Reporte de suma de coberturas por cliente y por tipo de Seguro";
            Session["consulta"] = "Select * from reporte13(";
            Response.Redirect("VerReporte.aspx", true);
        }

        protected void btnreporte14_Click(object sender, EventArgs e)
        {
            Session["noReporte"] = 14;
            Session["titulo"] = "Reporte de documentos subidos a la base de datos";
            Session["consulta"] = "Select * from reporte14(";
            Response.Redirect("VerReporte.aspx", true);
            
        }

        protected void btnreporte15_Click(object sender, EventArgs e)
        {
            Session["noReporte"] = 15;
            Session["titulo"] = "Reporte de usuarios";
            Session["consulta"] = "Select * from reporte15(";
            Response.Redirect("VerReporte.aspx", true);
            
        }
    }
}
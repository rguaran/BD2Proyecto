using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bases2proyecto
{
    public partial class empleados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void setSession()
        {
            Session["insert"] = "insertarEmpleado";
            Session["select"] = "seleccionarEmpleado()";
            Session["update"] = "actualizarEmpleado";
            Session["delete"] = "eliminarEmpleado";
            Session["origen"] = "empleados";
            Session["titulo"] = "Emplelados";
            Session["iniciar"] = 0;
            Session["iniciarInsert"] = 1;
            Session["final"] = 1;
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {

            setSession();
            Response.Redirect("editar.aspx", true);
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            setSession();
            Response.Redirect("editar.aspx", true);
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            setSession();
            Response.Redirect("suprimir.aspx", true);
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["insert"] = "insertarTipoEmpleado";
            Session["select"] = "seleccionarTipoEmpleado()";
            Session["update"] = "actualizarTipoEmpleado";
            Session["delete"] = "eliminarTipoEmpleado";
            Session["origen"] = "empleados";
            Session["titulo"] = "Tipo de empleados";
            Session["iniciar"] = 0;
            Session["iniciarInsert"] = 1;
            Session["final"] = 1;
            Response.Redirect("pagos_mantenimiento.aspx", true);
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Session["insert"] = "insertarDepartamento";
            Session["select"] = "seleccionarDepartamento()";
            Session["update"] = "actualizarDepartamento";
            Session["delete"] = "eliminarDepartamento";
            Session["origen"] = "empleados";
            Session["titulo"] = "Departamento";
            Session["iniciar"] = 0;
            Session["iniciarInsert"] = 1;
            Session["final"] = 1;
            Response.Redirect("pagos_mantenimiento.aspx", true);
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Session["insert"] = "insertarOficina";
            Session["select"] = "seleccionarOficina()";
            Session["update"] = "actualizarOficina";
            Session["delete"] = "eliminarOficina";
            Session["origen"] = "empleados";
            Session["titulo"] = "Oficina";
            Session["iniciar"] = 0;
            Session["iniciarInsert"] = 0;
            Session["final"] = 1;
            Response.Redirect("pagos_mantenimiento.aspx", true);
        }
    }
}
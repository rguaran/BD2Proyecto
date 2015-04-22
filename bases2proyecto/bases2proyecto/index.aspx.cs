using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bases2proyecto
{
    public partial class index : System.Web.UI.Page
    {
        ConexionBD conexion = new ConexionBD();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int id = Int32.Parse(TextBox1.Text);
            string nom = TextBox2.Text;
            conexion.Crear(id,nom);
        }
    }
}
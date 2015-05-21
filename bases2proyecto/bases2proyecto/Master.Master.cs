using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bases2proyecto
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string user = (string)Session["user"];

                if (!user.Equals(""))
                {
                    poliza.Visible = true;
                    A1.Visible = true;
                    A2.Visible = true;
                    A3.Visible = true;
                    A4.Visible = true;
                    A5.Visible = true;
                }
                else
                {
                    poliza.Visible = false;
                    A1.Visible = false;
                    A2.Visible = false;
                    A3.Visible = false;
                    A4.Visible = false;
                    A5.Visible = false;
                }
            }
            catch
            {
                poliza.Visible = false;
                    A1.Visible = false;
                    A2.Visible = false;
                    A3.Visible = false;
                    A4.Visible = false;
                    A5.Visible = false;
            }
        }
    }
}
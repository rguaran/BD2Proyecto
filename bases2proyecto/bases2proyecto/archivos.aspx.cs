using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Npgsql;
using NpgsqlTypes;
using System.Data;
using System.IO;

namespace bases2proyecto
{
    public partial class archivos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownList1.SelectedValue = (string)Session["tipoSeguro"];
            txtIdPoliza.Text = (string)Session["idPoliza"];
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if ( FileUpload1.PostedFile != null)
            {
                NpgsqlConnection conn = new NpgsqlConnection("Server=localhost;User Id=postgres;Password=admin123;Database=proyectoBD2;");
                conn.Open();
                FileUpload1.SaveAs(@"C:\tmp\" + FileUpload1.FileName);
                FileStream fs = new FileStream(@"C:\tmp\" + FileUpload1.FileName, FileMode.Open, FileAccess.Read);
                BinaryReader br = new BinaryReader(new BufferedStream(fs));
                Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                Console.WriteLine(fs.Length);

                br.Close();
                fs.Close();

                NpgsqlCommand command = new NpgsqlCommand("insert into archivos(nombre,id_ts, id_poliza, archivo) values('" + FileUpload1.FileName + "','" + DropDownList1.SelectedValue + "'," + Int32.Parse(txtIdPoliza.Text) + ",:bytesData)", conn);
                NpgsqlParameter param = new NpgsqlParameter(":bytesData", NpgsqlDbType.Bytea);
                param.Value = bytes;
                command.Parameters.Add(param);
                command.ExecuteNonQuery();

            }
        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            cargarAdjuntos(DropDownList1.SelectedValue, Int32.Parse(txtIdPoliza.Text));
        }

        protected void cargarAdjuntos(string id_ts, int id_poliza)
        {
            NpgsqlConnection conn = new NpgsqlConnection("Server=localhost;User Id=postgres;Password=admin123;Database=proyectoBD2;");
            conn.Open();
            String adjunto = "";
            ConexionBD conexion = new ConexionBD();
            DataTable archivos = conexion.consulta("select * from archivos  where id_ts = '" + id_ts + "' and id_poliza = "+id_poliza + "and archivo is not null LIMIT 1").Tables[0];
            foreach (DataRow archivo in archivos.Rows)
            {
                
                    NpgsqlCommand command = new NpgsqlCommand("select archivo from archivos where id_archivo = " + archivo[0].ToString(), conn);

                    Byte[] result = (Byte[])command.ExecuteScalar();
                    FileStream fs = new FileStream(Server.MapPath("/archivos/" + archivo[2].ToString()), FileMode.Create, FileAccess.Write);
                    BinaryWriter bw = new BinaryWriter(new BufferedStream(fs));
                    bw.Write(result);

                    bw.Flush();
                    fs.Close();
                    bw.Close();
                    conn.Close();

                    adjunto += archivo[2].ToString();
                    lblFilename.Text = archivo[2].ToString();
                
            }

            if (adjunto.Length > 0)
            {
                
                LinkButton1.Text = adjunto;
                LinkButton1.Visible = true;
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (lblFilename.Text != string.Empty)
            {
                if (lblFilename.Text.EndsWith(".txt"))
                {
                    Response.ContentType = "application/txt";
                }
                else if (lblFilename.Text.EndsWith(".pdf"))
                {
                    Response.ContentType = "application/pdf";
                }
                else if (lblFilename.Text.EndsWith(".docx"))
                {
                    Response.ContentType = "Application/msword";
                }
                else if (lblFilename.Text.EndsWith(".xlsx"))
                {
                    Response.ContentType = "Application/x-msexcel";
                }
                else if (lblFilename.Text.EndsWith(".jpg"))
                {
                    Response.ContentType = "image/jpg";
                }
                else if (lblFilename.Text.EndsWith(".png"))
                {
                    Response.ContentType = "image/png";
                }
                else
                {
                    Response.ContentType = "text/plain";
                }
                string filePath = "/archivos/" + lblFilename.Text;

                Response.AddHeader("Content-Disposition", "attachment;filename=\"" + filePath + "\"");
                Response.TransmitFile(Server.MapPath(filePath));
                Response.End();
            }
        }

        protected void btnContinuar_Click(object sender, EventArgs e)
        {
            Response.Redirect("nuevapoliza.aspx", true);
        }


    }
}
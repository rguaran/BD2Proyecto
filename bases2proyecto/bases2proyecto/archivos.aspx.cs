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
using Ionic.Zip;
using Ionic.Zlib;

namespace bases2proyecto
{
    public partial class archivos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList1.SelectedValue = (string)Session["tipoSeguro"];
                txtIdPoliza.Text = (string)Session["idPoliza"];
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

          string filepath = Server.MapPath("\\Upload");
          HttpFileCollection uploadedFiles = Request.Files;
          
          for(int i = 0;i < uploadedFiles.Count;i++) {
              HttpPostedFile userPostedFile = uploadedFiles[i];

              try {
                  if (userPostedFile.ContentLength > 0) {
                     
                    NpgsqlConnection conn = new NpgsqlConnection("Server=localhost;User Id=postgres;Password=admin123;Database=proyectoBD2;");
                    conn.Open();
                    userPostedFile.SaveAs(@"C:\tmp\" + userPostedFile.FileName);
                    FileStream fs = new FileStream(@"C:\tmp\" + userPostedFile.FileName, FileMode.Open, FileAccess.Read);
                    BinaryReader br = new BinaryReader(new BufferedStream(fs));
                    Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    Console.WriteLine(fs.Length);

                    br.Close();
                    fs.Close();

                    NpgsqlCommand command = new NpgsqlCommand("insert into archivos(nombre,id_ts, id_poliza, archivo) values('" + userPostedFile.FileName + "','" + DropDownList1.SelectedValue + "'," + Int32.Parse(txtIdPoliza.Text) + ",:bytesData)", conn);
                    NpgsqlParameter param = new NpgsqlParameter(":bytesData", NpgsqlDbType.Bytea);
                    param.Value = bytes;
                    command.Parameters.Add(param);
                    command.ExecuteNonQuery(); 
                     
                  }
              } catch(Exception Ex) {
                 Console.Write("Error: <br>" + Ex.Message);
              }
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
            DataTable archivos = conexion.consulta("select * from archivos  where id_ts = '" + id_ts + "' and id_poliza = "+id_poliza + "and archivo is not null").Tables[0];
            conn.Close();
            foreach (DataRow archivo in archivos.Rows)
            {
                    
                    conn.Open();
                    NpgsqlCommand command = new NpgsqlCommand("select archivo from archivos where id_archivo = " + archivo[0].ToString(), conn);

                    Byte[] result = (Byte[])command.ExecuteScalar();
                    var folder = Server.MapPath("/archivos/" + DropDownList1.SelectedValue + txtIdPoliza.Text );
                    if (!Directory.Exists(folder))
                    {
                        Directory.CreateDirectory(folder);
                    }
                    FileStream fs = new FileStream(Server.MapPath("/archivos/" + DropDownList1.SelectedValue + txtIdPoliza.Text + "/" + archivo[2].ToString()), FileMode.Create, FileAccess.Write);
                    BinaryWriter bw = new BinaryWriter(new BufferedStream(fs));
                    bw.Write(result);

                    bw.Flush();
                    fs.Close();
                    bw.Close();
                    conn.Close();

                    adjunto = archivo[2].ToString();
                    lblFilename.Text = archivo[2].ToString();

                    

                    if (adjunto.Length > 0)
                    {
                        LinkButton link = new LinkButton();
                        link.Text = adjunto;
                        link.Visible = true;
                        link.OnClientClick = "CallMe();";
                        TableRow row = new TableRow();
                        TableCell cell = new TableCell();
                        cell.Controls.Add(link);
                        row.Cells.Add(cell);
                        Table1.Rows.Add(row);
                    }
            }

            
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string nombreArchivo = ((LinkButton)sender).Text;
            if (nombreArchivo != string.Empty)
            {
                if (nombreArchivo.EndsWith(".txt"))
                {
                    Response.ContentType = "application/txt";
                }
                else if (nombreArchivo.EndsWith(".pdf"))
                {
                    Response.ContentType = "application/pdf";
                }
                else if (nombreArchivo.EndsWith(".docx"))
                {
                    Response.ContentType = "Application/msword";
                }
                else if (nombreArchivo.EndsWith(".xlsx"))
                {
                    Response.ContentType = "Application/x-msexcel";
                }
                else if (nombreArchivo.EndsWith(".jpg"))
                {
                    Response.ContentType = "image/jpg";
                }
                else if (nombreArchivo.EndsWith(".png"))
                {
                    Response.ContentType = "image/png";
                }
                else
                {
                    Response.ContentType = "text/plain";
                }
                string filePath = "/archivos/" + nombreArchivo;

                Response.AddHeader("Content-Disposition", "attachment;filename=\"" + filePath + "\"");
                Response.TransmitFile(Server.MapPath(filePath));
                Response.End();
            }
        }

        protected void btnContinuar_Click(object sender, EventArgs e)
        {
            Response.Redirect("nuevapoliza.aspx", true);
        }

        protected void btnDescargarTodos_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.BufferOutput = false;
            Response.ContentType = "application/zip";
            Response.AddHeader("content-disposition", "attachment; filename=" + DropDownList1.SelectedValue +txtIdPoliza.Text + ".zip");

            using (ZipFile zip = new ZipFile())
            {
                zip.CompressionLevel = CompressionLevel.None;
                zip.AddSelectedFiles("*.*", Server.MapPath("/archivos/" + DropDownList1.SelectedValue + txtIdPoliza.Text + "/"), "", false);
                zip.Save(Response.OutputStream);
            }

            Response.Close();
        }


    }
}
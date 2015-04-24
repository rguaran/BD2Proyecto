using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Npgsql;

namespace bases2proyecto
{
    public class ConexionBD
    {
       private string connstring;
        public NpgsqlConnection con;
        NpgsqlTransaction tran;
        NpgsqlCommand dbcmd;

        public ConexionBD()
        {
            connstring = "Server=localhost;User Id=postgres;Password=admin123;Database=proyectoBD2;";
            con = new NpgsqlConnection(connstring);
        }

        public DataSet consulta(string consulta)
        {
            try
            {
                abrirConexion();
                NpgsqlDataAdapter ada = new NpgsqlDataAdapter(consulta, con);
                DataSet ds = new DataSet();
                ada.Fill(ds);
                con.Close();
                return ds;
            }
            catch (Exception e)
            {
                Console.Write(e.Message);
            }
            return null;
        }

        public void iniciarTransaccion()
        {
            abrirConexion();
            tran = con.BeginTransaction();
            dbcmd = con.CreateCommand();
            dbcmd.Transaction = tran;
            
        }

        public string ejecutarTransaccion(string sqlStr)
        {
            try
            {
                dbcmd.CommandText = sqlStr;
                dbcmd.ExecuteNonQuery();
                return "OK";
            }
            catch (Exception e)
            {
                return e.Message;
            }
        }


        public void commit()
        {
            tran.Commit();
            con.Close();
        }

        public void rollback()
        {
            tran.Rollback();
            con.Close();
        }

        public void Query(string SqlStr)
        {
            try
            {
                abrirConexion();
                NpgsqlCommand dbcmd = con.CreateCommand();
                dbcmd.CommandText = SqlStr;
                dbcmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception e)
            {
                Console.Write(e.Message);
            }
        }

        public void abrirConexion()
        {
            if(con.State != ConnectionState.Open){
                con.Open();
            }
        }



    }
}
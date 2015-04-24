using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Npgsql;
using System.Data;
using System.Data.SqlClient;

namespace bases2proyecto
{
    public class ConexionBD
    {
        String cadenaConexion = "Server=localhost;User Id=postgres;Password=admin123;Database=proyectoBD2;";
        NpgsqlCommand miComandoSQL;
        NpgsqlConnection miConexionBase;
        NpgsqlDataAdapter adaptadorDatos;
        
        public ConexionBD() { 
        }

        public void inicia()
        {
            miConexionBase = new NpgsqlConnection();
            miConexionBase.ConnectionString = cadenaConexion;
            miConexionBase.Open();
        }

        public void Crear(int id, String nombre)
        {
            inicia();
            miComandoSQL = new NpgsqlCommand("insert into pruebas values (" + id + ",'" + nombre + "')", miConexionBase);
            miComandoSQL.ExecuteNonQuery();
            miConexionBase.Close();
        }

        public void executeQuery(String query)
        {
            inicia();
            miComandoSQL = new NpgsqlCommand(query, miConexionBase);
            miComandoSQL.ExecuteNonQuery();
            miConexionBase.Close();
        }

        public DataSet consulta(string consulta)
        {
            try
            {
                inicia();
                NpgsqlDataAdapter ada = new NpgsqlDataAdapter(consulta, miConexionBase);
                DataSet ds = new DataSet();
                ada.Fill(ds);
                miConexionBase.Close();
                return ds;
            }
            catch (Exception e)
            {
                Console.Write(e.Message);
            }
            return null;
        }

        public void query(string SqlStr)
        {
            try
            {
                inicia();
                NpgsqlCommand dbcmd = miConexionBase.CreateCommand();
                dbcmd.CommandText = SqlStr;
                dbcmd.ExecuteNonQuery();
                miConexionBase.Close();
            }
            catch (Exception e)
            {
                Console.Write(e.Message);
            }
        }

    }
}
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

    }
}
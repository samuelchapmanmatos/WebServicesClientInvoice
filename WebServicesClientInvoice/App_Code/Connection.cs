using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Connection
/// </summary>
public class Connection
{

    //Database connection string.
    private SqlConnection Connection_crud = new SqlConnection(ConfigurationManager.ConnectionStrings["NewClientDB"].ToString());

    //Function or method to initiate open connection to the database.
    public SqlConnection StartConnection()
    {

        if (Connection_crud.State == ConnectionState.Closed)
            Connection_crud.Open();
        return Connection_crud;
    }

    //Function or method to close connection with the database.
    public SqlConnection EndConnection()
    {
        if (Connection_crud.State == ConnectionState.Open)
            Connection_crud.Close();
        return Connection_crud;
    }
}
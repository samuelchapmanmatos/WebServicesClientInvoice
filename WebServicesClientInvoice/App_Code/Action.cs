using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Action
/// </summary>
public class Action
{
    private Connection cn = new Connection();
    SqlDataReader read;
    DataSet ds = new DataSet();
    DataTable table = new DataTable();
    SqlCommand cmd = new SqlCommand();
    public DataSet Show(Client client)
    {
            cmd.Connection = cn.StartConnection();
            cmd.CommandText = "SP_Client_Search";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Name", client.Name);
            cmd.Parameters.AddWithValue("@Adress", client.Adress);
            cmd.Parameters.AddWithValue("@Phone", client.Phone);
            cmd.Parameters.AddWithValue("@NIE", client.NIE);
            read = cmd.ExecuteReader();
            table.Load(read);
            cn.EndConnection();
            ds.Tables.Add(table);
        
        return ds;

    }
    public DataSet Insert(Client client)
    {
        cmd.Connection = cn.StartConnection();
        cmd.CommandText = "SP_Client_Insert";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Id", client.Id);
        cmd.Parameters.AddWithValue("@Name", client.Name);
        cmd.Parameters.AddWithValue("@Adress", client.Adress);
        cmd.Parameters.AddWithValue("@Age", client.Age);
        cmd.Parameters.AddWithValue("@Phone", client.Phone);
        cmd.Parameters.AddWithValue("@NIE", client.NIE);
        cmd.Parameters.AddWithValue("@Status", client.Status);
        read = cmd.ExecuteReader();
        table.Load(read);
        cn.EndConnection();
        ds.Tables.Add(table);
        return ds;
    }
    public DataSet Edit(Client client)
    {
        cmd.Connection = cn.StartConnection();
        cmd.CommandText = "SP_Client_Update";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Id", client.Id);
        cmd.Parameters.AddWithValue("@Name", client.Name);
        cmd.Parameters.AddWithValue("@Adress", client.Adress);
        cmd.Parameters.AddWithValue("@Age", client.Age);
        cmd.Parameters.AddWithValue("@Phone", client.Phone);
        cmd.Parameters.AddWithValue("@NIE", client.NIE);
        cmd.Parameters.AddWithValue("@Status", client.Status);
        read = cmd.ExecuteReader();
        table.Load(read);
        cn.EndConnection();
        ds.Tables.Add(table);
        return ds;
    }
    public DataSet UpdateStatus(Client client)
    {
        cmd.Connection = cn.StartConnection();
        cmd.CommandText = "SP_Client_Change_Status";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Id", client.Id);
        cmd.Parameters.AddWithValue("@Status", client.Status);
        read = cmd.ExecuteReader();
        table.Load(read);
        cn.EndConnection();
        ds.Tables.Add(table);
        return ds;
    }
}
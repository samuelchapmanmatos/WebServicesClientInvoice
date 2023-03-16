using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Descripción breve de WS_Client_Invoice_AE016
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
// [System.Web.Script.Services.ScriptService]
public class WS_Client_Invoice_AE016 : System.Web.Services.WebService
{
    Connection cn = new Connection();
    public WS_Client_Invoice_AE016()
    {

        //Elimine la marca de comentario de la línea siguiente si utiliza los componentes diseñados 
        //InitializeComponent(); 
    }

    [WebMethod]
    public DataSet Customers(string Id, string Name, string Adress, string Age, string Phone, 
        string NIE, string Opc, bool Status) {

        int opc = Convert.ToInt32(Opc);

        Client client = new Client
        {
            Id = Convert.ToInt32(Id),
            Name = Name,
            Adress = Adress,
            Age = Convert.ToInt32(Age),
            Phone = Phone,
            NIE = NIE,
            Status = Status
        };

        Action action = new Action();

        DataSet ds = new DataSet();

        switch (opc)
        {
            case 1:
                ds = action.Show(client);
                break;
            case 2:
                ds = action.Insert(client);
                break;
            case 3:
                ds = action.UpdateStatus(client);
                break;
            case 4:
                ds = action.Edit(client);
                break;
            default:
                break;
        }        

        return ds;
    }

}

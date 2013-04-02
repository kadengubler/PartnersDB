using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using AjaxControlToolkit;

/// <summary>
/// Summary description for AutoExtender
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class AutoExtender : System.Web.Services.WebService {

    public AutoExtender () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string[] GetCompletionList(string prefixText, int count)
    {
        List<string> listString = new List<string>();
        using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|\\Partners.mdf;Integrated Security=True"))
        {
            SqlCommand cm = new SqlCommand("SELECT OrgName,OrgID FROM Organization Where OrgName like '" + prefixText + "%'", con);
            con.Open();
            SqlDataReader dr = cm.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    listString.Add(AutoCompleteExtender.CreateAutoCompleteItem(dr["OrgName"].ToString(), dr["OrgID"].ToString()));

                    //c.FullName, serializer.Serialize(c))
                }
            }
        }
        string[] str = listString.ToArray();
        return str;

    }
    //[System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    //public static string[] GetCompletionList(string prefixText, int count, string contextKey)
    //{
    //    return default(string[]);
    //}
    //public class AutoExtender : System.Web.Services.WebService
    //{


    //}
}

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StatusBoard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
        //<UpdateParameters>
        //    <asp:Parameter Name="SpeakerStatus" Type="String" />
        //    <asp:Parameter Name="Picture" Type="Boolean" />
        //    <asp:Parameter Name="Bio" Type="Boolean" />
        //    <asp:Parameter Name="Summary" Type="Boolean" />
        //    <asp:Parameter Name="Slides" Type="Boolean" />
        //    <asp:Parameter Name="Travel" Type="Boolean" />
        //    <asp:Parameter Name="Hotel" Type="Boolean" />
        //    <asp:Parameter Name="SpeakerID" Type="Int32" />
        //</UpdateParameters>
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|\\Partners.mdf;Integrated Security=True");
        //SqlCommand cmd = new SqlCommand("usp_NewOrg", con);
        //cmd.CommandType = CommandType.StoredProcedure;
        //con.Open();
        //cmd.ExecuteNonQuery();
        //con.Close();
        //string SpeakerID = GridView1.DataKeys[e.RowIndex].Value.ToString();
    }
}
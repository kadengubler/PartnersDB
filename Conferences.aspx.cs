using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class Conferences : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
//<<<<<<< HEAD

    }
//    protected void ddl_Conference_SelectedIndexChanged(object sender, EventArgs e)
//    {
//        lblConferenceDate.Visible = true;
//        lblConferenceDate.Text = ddl_Conference.SelectedItem.ToString();
//    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        dtvSponsors.Visible = true;
    }
    protected void btnSponsor_Click(object sender, EventArgs e)
    {
        gvSponsor.Visible = true;
    }
    protected void btnCoSponsor_Click(object sender, EventArgs e)
    {

//=======
    }
    protected void ddl_Conference_SelectedIndexChanged(object sender, EventArgs e)
    {
         SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|\\Partners.mdf;Integrated Security=True");

        lblConferenceDate.Visible = true;
        lblConferenceDate.Text = 

            SqlCommand cmdAddAttendee = new SqlCommand("usp_NewConferenceAttendee", con);
            cmdAddAttendee.CommandType = CommandType.StoredProcedure;
            cmdAddAttendee.Parameters.AddWithValue("@ContactID", ContactID);
            cmdAddAttendee.Parameters.AddWithValue("@ConferenceID", ConfID);
            cmdAddAttendee.Parameters.AddWithValue("@PromoCode", promocode.Text);
            cmdAddAttendee.Parameters.AddWithValue("@PartnershipID", partnership.Text);
            cmdAddAttendee.Parameters.AddWithValue("@DaysAttending", ddl_daysAttending.SelectedValue);
            cmdAddAttendee.Parameters.AddWithValue("@Lunch", cb_lunch.Checked);
            cmdAddAttendee.Parameters.AddWithValue("@Daybook", cb_daybook.Checked);
            cmdAddAttendee.Parameters.AddWithValue("@NetworkDinner", cb_networkDinner.Checked);
            con.Open();
            cmdAddAttendee.ExecuteNonQuery();
            con.Close();
        
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvSponsor.Visible = true;
    }
    protected void btnAddSponsor_Click(object sender, EventArgs e)
    {
        dtvAddSponsor.Visible = true;
        
    }
    protected void dtvAddSponsor_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        dtvAddSponsor.Visible = true;
        
    }
    protected void dtvAddSponsor_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            dtvAddSponsor.Visible = false;
        }
//>>>>>>> kaden
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class Registration : System.Web.UI.Page
{
    bool statusStudent = false;
    bool statusFaculty = false;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
        
    
    protected void ddl_Conference_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_Conference.SelectedIndex == 0)
        {
            ddl_RegistrationType.Visible = false;
            ddl_RegistrationType.SelectedIndex = 0;
            ddl_RegistrationType_SelectedIndexChanged(sender, e);
        }
        else
        {
            ddl_RegistrationType.Visible = true;
        }
    }
    protected void ddl_RegistrationType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_RegistrationType.SelectedIndex == 0)
        {
            fName.Visible = false;
            lName.Visible = false;
            title.Visible = false;
            company.Visible = false;
            department.Visible = false;
            address.Visible = false;
            city.Visible = false;
            ddl_state.Visible = false;
            zip.Visible = false;
            areaCode.Visible = false;
            exchange.Visible = false;
            subscriberNumber.Visible = false;
            email.Visible = false;
            submit.Visible = false;
            add.Visible = false;
            clear.Visible = false;
            partnership.Visible = false;
            aNumber.Visible = false;
            cb_student.Visible = false;
            cb_faculty.Visible = false;
        }
        else
        {
            fName.Visible = true;
            lName.Visible = true;
            title.Visible = true;
            company.Visible = true;
            department.Visible = true;
            address.Visible = true;
            city.Visible = true;
            ddl_state.Visible = true;
            zip.Visible = true;
            areaCode.Visible = true;
            exchange.Visible = true;
            subscriberNumber.Visible = true;
            email.Visible = true;
            submit.Visible = true;
            add.Visible = true;
            clear.Visible = true;
        }
        if (ddl_RegistrationType.SelectedValue.ToString() == "Student/Faculty")
        {
            aNumber.Visible = true;
            cb_student.Visible = true;
            cb_faculty.Visible = true;
        }
        else
        {
            aNumber.Visible = false;
            cb_student.Visible = false;
            cb_faculty.Visible = false;
        }
        if (ddl_RegistrationType.SelectedValue.ToString() == "Partner")
        {
            partnership.Visible = true;
        }
        else
        {
            partnership.Visible = false;
        }
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        //submit form data to the DB
        int OrgID = 0;
        
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|\\Partners.mdf;Integrated Security=True");
        SqlCommand cmd5 = new SqlCommand("usp_NewOrg", con);
        cmd5.CommandType = CommandType.StoredProcedure;
        cmd5.Parameters.AddWithValue("@OrgName", company.Text);
        con.Open();
        cmd5.ExecuteNonQuery();
        con.Close();
        SqlCommand cmd6 = new SqlCommand("usp_GetOrgID", con);
        cmd6.CommandType = CommandType.StoredProcedure;
        cmd6.Parameters.AddWithValue("@OrgName", company.Text);
        con.Open();
        SqlDataReader reader = cmd6.ExecuteReader();
        reader.Read();
        OrgID = reader.GetInt32(0);
        con.Close();
        SqlCommand cmd1 = new SqlCommand("usp_NewContact", con); // Connection String
        cmd6.CommandType = CommandType.StoredProcedure;        
        cmd1.Parameters.AddWithValue("@LastName", lName.Text);
        cmd1.Parameters.AddWithValue("@FirstName", fName.Text);
        cmd1.Parameters.AddWithValue("@Title", title.Text);
        cmd1.Parameters.AddWithValue("@OrgID", OrgID);
        cmd1.Parameters.AddWithValue("@Department", department.Text);
        cmd1.Parameters.AddWithValue("@Email", email.Text);
        cmd1.Parameters.AddWithValue("@Street", address.Text);
        cmd1.Parameters.AddWithValue("@City", city.Text);
        cmd1.Parameters.AddWithValue("@ST", ddl_state.SelectedValue.ToString());
        cmd1.Parameters.AddWithValue("@Zip", zip.Text);
        cmd1.Parameters.AddWithValue("@Student", cb_student.Checked);
        cmd1.Parameters.AddWithValue("@Faculty", cb_faculty.Checked);
        cmd1.Parameters.AddWithValue("@AcctEmail", cb_acct.Checked);
        cmd1.Parameters.AddWithValue("@ITEmail", cb_it.Checked);
        cmd1.Parameters.AddWithValue("@CREmail", cb_cr.Checked);
        cmd1.Parameters.AddWithValue("@LeadEmail", cb_lead.Checked);
        cmd1.Parameters.AddWithValue("@OEEmail", cb_oe.Checked);
        
        con.Open();
        cmd1.ExecuteNonQuery();
        con.Close();
        SqlCommand cmd4 = new SqlCommand("SELECT ContactID FROM Contacts WHERE Email = @Email AND FirstName = @FirstName AND LastName = @LastName", con);
        cmd4.Parameters.AddWithValue("@Email", email.Text);
        cmd4.Parameters.AddWithValue("@FirstName", fName.Text);
        cmd4.Parameters.AddWithValue("@LastName", lName.Text);
        
        con.Open();
        int id = 0;

        reader = cmd4.ExecuteReader();
        reader.Read();
        id = reader.GetInt32(0);
        con.Close();
        SqlCommand cmd2 = new SqlCommand("INSERT INTO Phone(ContactID, AreaCode, Exchange, SubscriberNumber) VALUES (@ContactID, @AreaCode, @Exchange, @SubscriberNumber)", con);
        cmd2.Parameters.AddWithValue("@AreaCode", areaCode.Text);
        cmd2.Parameters.AddWithValue("@Exchange", exchange.Text);
        cmd2.Parameters.AddWithValue("@SubscriberNumber", subscriberNumber.Text);        
        cmd2.Parameters.AddWithValue("@ContactID", id);
        con.Open();
        cmd2.ExecuteNonQuery();
        con.Close();
        if (ddl_RegistrationType.SelectedValue == "Student/Faculty")
        {
        SqlCommand cmd3 = new SqlCommand("INSERT INTO Student(Anumber, ContactID) VALUES(@Anumber, @ContactID)", con);
        cmd3.Parameters.AddWithValue("@ContactID", id);
        cmd3.Parameters.AddWithValue("@Anumber", aNumber.Text);
        con.Open();
            cmd3.ExecuteNonQuery();
        con.Close();
        }
        //redirect to confirmation page
        redirectToConfirmationPage();
    }

    protected void redirectToConfirmationPage()
    { 
        
    }
    
    protected void add_Click(object sender, EventArgs e)
    {
        //submit form data to the DB
        int OrgID = 0;

        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|\\Partners.mdf;Integrated Security=True");
        SqlCommand cmd5 = new SqlCommand("usp_NewOrg", con);
        cmd5.CommandType = CommandType.StoredProcedure;
        cmd5.Parameters.AddWithValue("@OrgName", company.Text);
        con.Open();
        cmd5.ExecuteNonQuery();
        con.Close();
        SqlCommand cmd6 = new SqlCommand("usp_GetOrgID", con);
        cmd6.CommandType = CommandType.StoredProcedure;
        cmd6.Parameters.AddWithValue("@OrgName", company.Text);
        con.Open();
        SqlDataReader reader = cmd6.ExecuteReader();
        reader.Read();
        OrgID = reader.GetInt32(0);
        con.Close();
        SqlCommand cmd1 = new SqlCommand("usp_NewContact", con); // Connection String
        cmd6.CommandType = CommandType.StoredProcedure;
        cmd1.Parameters.AddWithValue("@LastName", lName.Text);
        cmd1.Parameters.AddWithValue("@FirstName", fName.Text);
        cmd1.Parameters.AddWithValue("@Title", title.Text);
        cmd1.Parameters.AddWithValue("@OrgID", OrgID);
        cmd1.Parameters.AddWithValue("@Department", department.Text);
        cmd1.Parameters.AddWithValue("@Email", email.Text);
        cmd1.Parameters.AddWithValue("@Street", address.Text);
        cmd1.Parameters.AddWithValue("@City", city.Text);
        cmd1.Parameters.AddWithValue("@ST", ddl_state.SelectedValue.ToString());
        cmd1.Parameters.AddWithValue("@Zip", zip.Text);
        cmd1.Parameters.AddWithValue("@Student", cb_student.Checked);
        cmd1.Parameters.AddWithValue("@Faculty", cb_faculty.Checked);
        cmd1.Parameters.AddWithValue("@AcctEmail", cb_acct.Checked);
        cmd1.Parameters.AddWithValue("@ITEmail", cb_it.Checked);
        cmd1.Parameters.AddWithValue("@CREmail", cb_cr.Checked);
        cmd1.Parameters.AddWithValue("@LeadEmail", cb_lead.Checked);
        cmd1.Parameters.AddWithValue("@OEEmail", cb_oe.Checked);

        con.Open();
        cmd1.ExecuteNonQuery();
        con.Close();
        SqlCommand cmd4 = new SqlCommand("SELECT ContactID FROM Contacts WHERE Email = @Email AND FirstName = @FirstName AND LastName = @LastName", con);
        cmd4.Parameters.AddWithValue("@Email", email.Text);
        cmd4.Parameters.AddWithValue("@FirstName", fName.Text);
        cmd4.Parameters.AddWithValue("@LastName", lName.Text);

        con.Open();
        int id = 0;

        reader = cmd4.ExecuteReader();
        reader.Read();
        id = reader.GetInt32(0);
        con.Close();
        SqlCommand cmd2 = new SqlCommand("INSERT INTO Phone(ContactID, AreaCode, Exchange, SubscriberNumber) VALUES (@ContactID, @AreaCode, @Exchange, @SubscriberNumber)", con);
        cmd2.Parameters.AddWithValue("@AreaCode", areaCode.Text);
        cmd2.Parameters.AddWithValue("@Exchange", exchange.Text);
        cmd2.Parameters.AddWithValue("@SubscriberNumber", subscriberNumber.Text);
        cmd2.Parameters.AddWithValue("@ContactID", id);
        con.Open();
        cmd2.ExecuteNonQuery();
        con.Close();
        if (ddl_RegistrationType.SelectedValue == "Student/Faculty")
        {
            SqlCommand cmd3 = new SqlCommand("INSERT INTO Student(Anumber, ContactID) VALUES(@Anumber, @ContactID)", con);
            cmd3.Parameters.AddWithValue("@ContactID", id);
            cmd3.Parameters.AddWithValue("@Anumber", aNumber.Text);
            con.Open();
            cmd3.ExecuteNonQuery();
            con.Close();
        }
        clear_Fields();
    }

    protected void clear_Fields()
    {

        //clear the text fields
        aNumber.Text = string.Empty;
        partnership.Text = string.Empty;
        cb_student.Checked = false;
        cb_faculty.Checked = false;
        cb_acct.Checked = false;
        cb_oe.Checked = false;
        cb_it.Checked = false;
        cb_cr.Checked = false;
        cb_lead.Checked = false;
        fName.Text = string.Empty;
        lName.Text = string.Empty;
        title.Text = string.Empty;
        company.Text = string.Empty;
        department.Text = string.Empty;
        address.Text = string.Empty;
        city.Text = string.Empty;
        ddl_state.SelectedIndex = 0;
        zip.Text = string.Empty;
        areaCode.Text = string.Empty;
        exchange.Text = string.Empty;
        subscriberNumber.Text = string.Empty;
        email.Text = string.Empty;

    }
    
    protected void clear_Click(object sender, EventArgs e)
    {
        //clear the text fields
        ddl_Conference.SelectedIndex = 0;
        ddl_RegistrationType.SelectedIndex = 0;
        clear_Fields();
    }
}
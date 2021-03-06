﻿using System;
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
            Panel1.Visible = false;
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
            Panel1.Visible = false;
            notifications.Visible = false;
            buttons.Visible = false;
            ddl_daysAttending.Visible = false;
        }
        else
        {
            Panel1.Visible = true;
            notifications.Visible = true;
            buttons.Visible = true;
            Panel1.Focus();
        }
        if (ddl_RegistrationType.SelectedValue.ToString() == "Student/Faculty")
        {
            aNumber.Visible = true;
            cb_student.Visible = true;
            cb_faculty.Visible = true;
            title.Visible = false;
            company.Visible = false;
            department.Visible = false;

        }
        else
        {
            aNumber.Visible = false;
            cb_student.Visible = false;
            cb_faculty.Visible = false;
            title.Visible = true;
            company.Visible = true;
            department.Visible = true;
        }
        if (ddl_RegistrationType.SelectedValue.ToString() == "Partner")
        {
            partnership.Visible = true;
            promocode.Visible = true;
        }
        else
        {
            partnership.Visible = false;
            promocode.Visible = false;
        }
        if (cb_student.Checked == true)
        {
            cb_lunch.Visible = true;
            cb_daybook.Visible = true;
            cb_networkDinner.Visible = true;
        }
        else
        {
            cb_lunch.Visible = false;
            cb_daybook.Visible = false;
            cb_networkDinner.Visible = false;
        }
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        Register();
        //redirect to confirmation page
        Save2Session();
        redirectToConfirmationPage();
    }

    protected void redirectToConfirmationPage()
    {
        Response.Redirect("Confirmation.aspx");
    }

    protected void Register()
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|\\Partners.mdf;Integrated Security=True");
        
        //submit form data to the DB
        int OrgID = 0, ContactID = 0, ConfID = 0, Status = 0;
        if (ddl_RegistrationType.SelectedValue.ToString() == "Student/Faculty")
        {
            SqlCommand cmd9 = new SqlCommand("usp_ValidateUniqueAnumber", con);
            cmd9.CommandType = CommandType.StoredProcedure;
            cmd9.Parameters.AddWithValue("@Anumber", aNumber.Text);
            cmd9.Parameters.AddWithValue("@Fname", fName.Text);
            cmd9.Parameters.AddWithValue("@Lname", lName.Text);
            con.Open();
            SqlDataReader reader9 = cmd9.ExecuteReader();
            reader9.Read();
            Status = reader9.GetInt32(0);

            con.Close();

            if (Status > 0)
            {

            }
            else
            {
                //Add behavior for a failed unique validation
                Response.Redirect("Error.html");
            }
        }
        
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
        //if()Add stored procedure that evaluates whether a contact exists
        //{

        //}
        SqlCommand cmdGetContactID = new SqlCommand("usp_NewContact", con); // Connection String
        cmdGetContactID.CommandType = CommandType.StoredProcedure;
        cmdGetContactID.Parameters.AddWithValue("@LastName", lName.Text);
        cmdGetContactID.Parameters.AddWithValue("@FirstName", fName.Text);
        cmdGetContactID.Parameters.AddWithValue("@Title", title.Text);
        cmdGetContactID.Parameters.AddWithValue("@OrgID", OrgID);
        cmdGetContactID.Parameters.AddWithValue("@Department", department.Text);
        cmdGetContactID.Parameters.AddWithValue("@Email", email.Text);
        cmdGetContactID.Parameters.AddWithValue("@Street", address.Text);
        cmdGetContactID.Parameters.AddWithValue("@City", city.Text);
        cmdGetContactID.Parameters.AddWithValue("@ST", ddl_state.SelectedValue.ToString());
        cmdGetContactID.Parameters.AddWithValue("@Zip", zip.Text);
        cmdGetContactID.Parameters.AddWithValue("@Student", cb_student.Checked);
        cmdGetContactID.Parameters.AddWithValue("@Faculty", cb_faculty.Checked);
        cmdGetContactID.Parameters.AddWithValue("@AcctEmail", cb_acct.Checked);
        cmdGetContactID.Parameters.AddWithValue("@ITEmail", cb_it.Checked);
        cmdGetContactID.Parameters.AddWithValue("@CREmail", cb_cr.Checked);
        cmdGetContactID.Parameters.AddWithValue("@LeadEmail", cb_lead.Checked);
        cmdGetContactID.Parameters.AddWithValue("@OEEmail", cb_oe.Checked);
        

        con.Open();
        cmdGetContactID.ExecuteNonQuery(); //inserts and returns ContactID
        con.Close();
        SqlCommand cmd4 = new SqlCommand("SELECT ContactID FROM Contacts WHERE Email = @Email AND FirstName = @FirstName AND LastName = @LastName", con);
        cmd4.Parameters.AddWithValue("@Email", email.Text);
        cmd4.Parameters.AddWithValue("@FirstName", fName.Text);
        cmd4.Parameters.AddWithValue("@LastName", lName.Text);

        con.Open();



        reader = cmd4.ExecuteReader();
        reader.Read();
        ContactID = reader.GetInt32(0);
        con.Close();
        SqlCommand cmdGetConferenceID = new SqlCommand("usp_GetConferenceID", con);
        cmdGetConferenceID.CommandType = CommandType.StoredProcedure;
        cmdGetConferenceID.Parameters.AddWithValue("@ConferenceTitle", ddl_Conference.SelectedValue);
        con.Open();

        reader = cmdGetConferenceID.ExecuteReader();
        reader.Read();
        ConfID = reader.GetInt32(0);
        con.Close();
        SqlCommand cmdAddPhone = new SqlCommand("usp_NewPhone", con);
        cmdAddPhone.CommandType = CommandType.StoredProcedure;
        cmdAddPhone.Parameters.AddWithValue("@AreaCode", areaCode.Text);
        cmdAddPhone.Parameters.AddWithValue("@Exchange", exchange.Text);
        cmdAddPhone.Parameters.AddWithValue("@SubscriberNumber", subscriberNumber.Text);
        cmdAddPhone.Parameters.AddWithValue("@ContactID", ContactID);
        con.Open();
        cmdAddPhone.ExecuteNonQuery();
        con.Close();
        //Add Validation of Contacts.OrgID and Partnership.OrgID for PartnershipID
        try
        {
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
        catch (SqlException ex)
        {
            //Response.Redirect("Error.html");
        }
        finally
        {
            con.Close();        
        }

        if (ddl_RegistrationType.SelectedValue == "Student/Faculty")
        {
            SqlCommand cmdAddStudent = new SqlCommand("	IF NOT EXISTS (SELECT @Anumber FROM Student WHERE Anumber = @Anumber)	INSERT INTO Student(Anumber, ContactID) VALUES(@Anumber, @ContactID)", con);
            cmdAddStudent.Parameters.AddWithValue("@Anumber", aNumber.Text);
            cmdAddStudent.Parameters.AddWithValue("@ContactID", ContactID);
            con.Open();
            cmdAddStudent.ExecuteNonQuery();
            con.Close();
        }
    }

    protected void add_Click(object sender, EventArgs e)
    {
        //submit form data to the DB
        Register();
        //redirect to confirmation page
        Save2Session();
        //redirectToConfirmationPage();
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

    //public TextBox reg_fName { get { return fName; } }

    public void Save2Session()
    {
        //save all inputs to a session
        Session["SessionID"] = Session.SessionID;
        Session["Conference"] = ddl_Conference.SelectedItem;
        Session["Reg_aNumber"] = aNumber.Text;
        Session["Reg_partnership"] = partnership.Text;
        Session["Reg_cb_student"] = cb_student.Checked;
        Session["Reg_cb_faculty"] = cb_faculty.Checked;
        Session["Reg_cb_acct"] = cb_acct.Checked;
        Session["Reg_cb_oe"] = cb_oe.Checked;
        Session["Reg_cb_it"] = cb_it.Checked;
        Session["Reg_cb_cr"] = cb_cr.Checked;
        Session["Reg_cb_lead"] = cb_lead.Checked;
        Session["Reg_fName"] = fName.Text;
        Session["Reg_lName"] = lName.Text;
        Session["Reg_title"] = title.Text;
        Session["Reg_company"] = company.Text;
        Session["Reg_department"] = department.Text;
        Session["Reg_address"] = address.Text;
        Session["Reg_city"] = city.Text;
        Session["Reg_state"] = ddl_state.SelectedValue;
        Session["Reg_zip"] = zip.Text;
        Session["Reg_areaCode"] = areaCode.Text;
        Session["Reg_exchange"] = exchange.Text;
        Session["Reg_subscriberNumber"] = subscriberNumber.Text;
        Session["Reg_email"] = email.Text;

    }

    protected void clear_Click(object sender, EventArgs e)
    {
        //clear the text fields
        ddl_Conference.SelectedIndex = 0;
        ddl_RegistrationType.SelectedIndex = 0;
        clear_Fields();
    }

    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {

        args.IsValid = true;

        foreach (DataRowView drv in SqlDataSource_aNumberValidation.Select(DataSourceSelectArguments.Empty))
        {
            if (drv["aNumber"].ToString() == args.Value)
            {
                args.IsValid = false;
                break;
            }
        }
    }
}
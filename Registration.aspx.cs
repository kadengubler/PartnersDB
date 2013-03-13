using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ddl_Conference_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddl_RegistrationType.Visible = true;
    }
    protected void ddl_RegistrationType_SelectedIndexChanged(object sender, EventArgs e)
    {
        fName.Visible = true;
        lName.Visible = true;
        title.Visible = true;
        company.Visible = true;
        address.Visible = true;
        city.Visible = true;
        ddl_state.Visible = true;
        zip.Visible = true;
        phone.Visible = true;
        email.Visible = true;
        submit.Visible = true;
        add.Visible = true;
        clear.Visible = true;
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        //submit form data to the DB

        //redirect to confirmation page
    }
    
    protected void add_Click(object sender, EventArgs e)
    {
        //submit form data to the DB


        //clear the text fields
        fName.Text = "";
        lName.Text = "";
        title.Text = "";
        company.Text = "";
        address.Text = "";
        city.Text = "";
        ddl_state.Text = "";
        zip.Text = "";
        phone.Text = "";
        email.Text = "";

    }
    
    protected void clear_Click(object sender, EventArgs e)
    {
        //clear the text fields
        fName.Text = "";
        lName.Text = "";
        title.Text = "";
        company.Text = "";
        address.Text = "";
        city.Text = "";
        ddl_state.Text = "";
        zip.Text = "";
        phone.Text = "";
        email.Text = "";

    }
}
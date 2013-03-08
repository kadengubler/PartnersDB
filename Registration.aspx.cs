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

    //method to display fields based on what the user selects


    
    protected void applyPromo_Click(object sender, EventArgs e)
    {
        //Check the promo code that was entered against the DB and adjust the price.
    }
    
    
    
    
    protected void submit_Click(object sender, EventArgs e)
    {
        //run in if stmt to be sure that validators are valid before post
        if (this.IsValid)
        { 
            //submit form data to the DB
            Response.Write("Writing values to the database...");
        }
       
    }
}
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

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        
    }
    protected void btnSponsor_Click(object sender, EventArgs e)
    {
        gvSponsors.Visible = true;
        gvCoSponsors.Visible = false;
    }
    protected void btnCoSponsor_Click(object sender, EventArgs e)
    {
        gvCoSponsors.Visible = true;
        gvSponsors.Visible = false;
    }
    
}
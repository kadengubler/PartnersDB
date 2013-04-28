using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Conferences : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void ddl_Conference_SelectedIndexChanged(object sender, EventArgs e)
    {
        conferenceDate.Visible = true;
        
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvSponsors.Visible = true;
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
    }
}
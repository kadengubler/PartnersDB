using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Partnerships : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvPartners.Visible = false;
        gvDaysUsed.Visible = true;
    }

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvPartners.Visible = true;
        gvDaysUsed.Visible = false;
    }
}
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
        Label1.Text = "This page contains a list of current partnerships.";
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvPartners.Visible = false;
        gvDaysUsed.Visible = true;
        Label1.Text = "This page contains a list of days attended using the partner number ";
    }

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvPartners.Visible = true;
        gvDaysUsed.Visible = false;
        Label1.Text = "This page contains a list of current partnerships.";
    }


}
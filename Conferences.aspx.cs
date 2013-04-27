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
        conferenceDate.Text = ddl_Conference.SelectedItem.ToString();
    }
}
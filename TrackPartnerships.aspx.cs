using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TrackPartnerships : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        GridView2.Visible = true;
    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.Visible = true;
        GridView2.Visible = false;
    }
}
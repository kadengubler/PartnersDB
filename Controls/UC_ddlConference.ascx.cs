using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_UC_ddlConference : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public int GetSelectedIndex
    {
        get
        {
            return ddl_Conference.SelectedIndex;
        }
    }
}
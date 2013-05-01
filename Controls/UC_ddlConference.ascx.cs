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

    public event EventHandler DropDownSelected;

    public int GetSelectedIndex
    {
        get
        {
            return ddl_Conference.SelectedIndex;
        }
    }

    public string GetSelectedValue
    {
        get
        {
            return ddl_Conference.SelectedValue;
        }
    }

    public string GetSelectedItem
    {
        get
        {
            return ddl_Conference.SelectedItem.ToString();
        }
    }
    

    protected void DropDownSelectionChanged(object sender, EventArgs e)
    {
        if (DropDownSelected != null)
        {
            DropDownSelected(this, EventArgs.Empty);
        }
    }
}
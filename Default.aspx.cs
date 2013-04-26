using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_search_Click(object sender, EventArgs e)
    {
        //***take the user inputs and query the DB***

        //make gridview visable
        gv_search.Visible = true;

    }

    //protected void search_Click(object sender, EventArgs e)
    //{
    //    //***take the user inputs and query the DB***



    //    //make the gridview visable
    //    gv_search.Visible = true;

    //    //?? add code to set focus of page to gv_search ??
    //    //Page.SetFocus(this.FindControl("gv_search"));
    //    //SetFocus(this.gv_search);
    //    gv_search.Focus();
    //}

    //protected void clear_Click(object sender, EventArgs e)
    //{
    //    txt_fName.Text = "";
    //    txt_lName.Text = "";
    //    txt_org.Text = "";
    //    txt_partNum.Text = "";

    //    //?? add code to set focus of the page to #quicksearch ??

    //}



}
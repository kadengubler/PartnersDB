using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Reports : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ddl_Conference_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_Conference.SelectedIndex == 0)
        {
            ddl_Report.Visible = false;
        }
        else
        {
            ddl_Report.Visible = true;
        }
    }
    protected void ddl_Report_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_Report.SelectedIndex == 1)
        {
            //Custom Report
            //*** code to allow user to select fields to show in report ***
            gvAttendee.Visible = true;
            gvAttendee.Focus();
        }
        //else if (ddl_Report.SelectedIndex == 2)
        //{
        //    //Current list of registered attendees
        //    //*** Query DB and list [fName] [lName] [company] [title] ***
        //    //*** calculate the number of attendees for each category (students, professionals, partners)
        //    gvAttendee.Visible = true;
        //    gvAttendee.Focus();
        //}
        //else if (ddl_Report.SelectedIndex == 3)
        //{
        //    //List of attendees at past conferences

        //}
        //else if (ddl_Report.SelectedIndex == 4)
        //{
        //    //List of current partnerships

        //}
        //else if (ddl_Report.SelectedIndex == 5)
        //{
        //    //List of current sponsors

        //}
        //else if (ddl_Report.SelectedIndex == 6)
        //{
        //    //List of current co-sponsors

        //}
        //else if (ddl_Report.SelectedIndex == 7)
        //{
        //    //Name Badges

        //}
        //else if (ddl_Report.SelectedIndex == 8)
        //{
        //    //Speaker itineraries

        //}
        //else if (ddl_Report.SelectedIndex == 9)
        //{
        //    //List of past years partnerships 

        //}
        //else if (ddl_Report.SelectedIndex == 10)
        //{
        //    //Email Blast List
        //}
        //else if (ddl_Report.SelectedIndex == 0)
        //{
        //    cr.Visible = false;
        //}

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView1.Visible = true;
    }

}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Confirmation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["SessionID"] != null)
        {
            lblHeaderMessage.Text = "Thank you for registering for the " + Session["Conference"] + " conference. " + "<br />" + "Below are the details of your registration.";
            fName.Text = Session["Reg_fName"].ToString();
            lName.Text = Session["Reg_lName"].ToString();
            if (fName.Text.Length + lName.Text.Length < 2)
            {
                lblName.Visible = false;
                fName.Visible = false;
            }

            email.Text = Session["Reg_email"].ToString();
            if (email.Text.Length < 1)
            {
                lblEmail.Visible = false;
                email.Visible = false;
            }

            areaCode.Text = Session["Reg_areaCode"].ToString();
            exchange.Text = Session["Reg_exchange"].ToString();
            subscriberNumber.Text = Session["Reg_subscriberNumber"].ToString();
            if (areaCode.Text.Length + exchange.Text.Length + subscriberNumber.Text.Length < 9)
            {
                lblPhone.Visible = false;
                areaCode.Visible = false;
                exchange.Visible = false;
                subscriberNumber.Visible = false;
            }

            if (Session["Reg_aNumber"] != null) aNumber.Text = Session["Reg_aNumber"].ToString();

            if (Session["Reg_partnership"] != null)
            {
                partnership.Text = Session["Reg_partnership"].ToString();
                if (partnership.Text.Length > 1)
                {
                    partnership.Visible = true;
                    lbl_partnum.Visible = true;                    
                }
            }
            if (Session["Reg_cb_student"] != null && Session["Reg_cb_faculty"] != null) 
            { 
                if (Session["Reg_cb_student"].ToString() == "True" || Session["Reg_cb_faculty"].ToString() == "True")
                {
                    lbl_anum.Visible = true;
                    if (Session["Reg_cb_student"].ToString() == "True") 
                    {
                        cb_student.Visible = true;
                        lblOptions.Visible = true;
                        if (Session["Reg_cb_lunch"] != null && Session["Reg_cb_lunch"].ToString() == "True")
                        {
                            lblOptionsChose.Text += "Lunch" + "<br>";
                        }
                        if (Session["Reg_cb_daybook"] != null && Session["Reg_cb_daybook"].ToString() == "True")
                        {
                            lblOptionsChose.Text += "Day Book" + "<br>";
                        }
                        if (Session["Reg_cb_networkDinner"] != null && Session["Reg_cb_networkDinner"].ToString() == "True")
                        {
                            lblOptionsChose.Text = "Network Dinner";
                        }
                    }
                    else 
                    {
                        lblOptions.Visible = false;
                        lblOptionsChose.Visible = false;
                    }

                    if (Session["Reg_cb_faculty"].ToString() == "True") cb_faculty.Visible = true;

                }
                else
                {
                    cb_student.Visible = false; 
                    cb_faculty.Visible = false;
                    lblOptions.Visible = false;
                    lblOptionsChose.Visible = false;
                }
            }

            if (Session["Reg_cb_acct"] != null && Session["Reg_cb_acct"].ToString() == "True")
            {
                lblNotifications.Text += "Accounting" + "<br>";
            }
            if (Session["Reg_cb_oe"] != null && Session["Reg_cb_oe"].ToString() == "True")
            {
                lblNotifications.Text += "Operational Excellence" + "<br>";
            }
            if (Session["Reg_cb_it"] != null && Session["Reg_cb_it"].ToString() == "True")
            {
                lblNotifications.Text += "Information Technology" + "<br>";
            }
            if (Session["Reg_cb_cr"] != null && Session["Reg_cb_cr"].ToString() == "True")
            {
                lblNotifications.Text += "Human Resources" + "<br>";
            }
            if (Session["Reg_cb_lead"] != null && Session["Reg_cb_lead"].ToString() == "True")
            {
                lblNotifications.Text += "Leadership";
            }
            if (lblNotifications.Text.Length < 2)
            {
                lblNotifications.Visible = false;
                lblNotificationsTitle.Visible = false;
            }

            if (Session["Reg_title"] != null)   title.Text = Session["Reg_title"].ToString();
            if (Session["Reg_company"] != null) company.Text = Session["Reg_company"].ToString();
            if (title.Text.Length + company.Text.Length > title.Text.Length + 1)
            {
                lblPosition.Visible = true;
                lblAt.Visible = true;
                title.Visible = true;
                company.Visible = true;
            }
            else if (title.Text.Length > 1)
            {
                lblPosition.Text = "Title: ";
                lblPosition.Visible = true;
                title.Visible = true;
            }
            else if (company.Text.Length > 1)
            {
                lblPosition.Text = "Company: ";
                lblPosition.Visible = true;
                company.Visible = true;
            }
            else
            {
                lblPosition.Visible = false;
                lblAt.Visible = false;
                title.Visible = false;
                company.Visible = false;
            }



            if (Session["Reg_department"] != null) department.Text = Session["Reg_department"].ToString();
            if (department.Text.Length < 1)
            {
                department.Visible = false;
                lblDepartment.Visible = false;
            }

            if (Session["Reg_address"] != null) address.Text = Session["Reg_address"].ToString();
            if (Session["Reg_city"] != null)    city.Text = Session["Reg_city"].ToString();
            if (Session["Reg_state"] != null)   ddl_state.Text = Session["Reg_state"].ToString();
            if (Session["Reg_zip"] != null)     zip.Text = Session["Reg_zip"].ToString();
        }
        else
        {
            Panel1.Visible = false;
            Panel2.Visible = false;
            lblHeaderMessage.Text = "Your session has expired. Confirmation information is not available.";
        }
    }
}
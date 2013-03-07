<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title>Registration | Partners In Business</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,600,700" rel="stylesheet" />
		<script src="js/jquery-1.8.3.min.js" ></script>
		<script src="css/5grid/init.js?use=mobile,desktop,1000px" ></script>
		<script src="js/init.js" ></script>
        <noscript>
			<link rel="stylesheet" href="css/5grid/core.css" />
			<link rel="stylesheet" href="css/5grid/core-desktop.css" />
			<link rel="stylesheet" href="css/5grid/core-1200px.css" />
			<link rel="stylesheet" href="css/5grid/core-noscript.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-desktop.css" />
		</noscript>
		<!--[if lte IE 9]><link rel="stylesheet" href="css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="css/ie8.css" /><![endif]-->
		<!--[if lte IE 7]><link rel="stylesheet" href="css/ie7.css" /><![endif]-->
	</head>
	<body>
        <form id="form1" runat="server">

        <!-- Nav -->
			<nav id="nav" >
				<ul>
					<li><a href="Default.aspx" >Home</a></li>
                    <li><a href="Registration.aspx" >Registration</a></li>
					<li><a href="Reports.aspx" >Reports</a></li>
					<li><a href="Conferences.aspx" >Conferences</a></li>
                    <li><a href="Documentation.aspx" >Help</a></li>
				</ul>
			</nav>

		<!-- Registration -->
            
            <div class="wrapper wrapper-style2">
                <article id="contact">
                    <header>
                        <h2>Conference Registration</h2>
                        <span>Please fill out the form below to register for a conference.</span>
                    </header>
                    <div class="5grid">
                        <div class="row">
                            <div class="12u">
                                <div class="5grid">
                                    <div class="row">
                                        <div class="6u">
                                            
                                            
                                            <input type="text" name="name" id="name" placeholder="Name" />
                                        </div>
                                        <div class="6u">
                                            <input type="text" name="email" id="email" placeholder="Email" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="12u">
                                            <input type="text" name="subject" id="subject" placeholder="Subject" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="12u">
                                            <textarea name="message" id="message" placeholder="Message"></textarea>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="12u">
                                            <input type="submit" class="button" value="Send Message" />
                                            <input type="reset" class="button button-alt" value="Clear Form" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </article>
            </div>
            





            <div class="wrapper wrapper-style2">
                <article id="registration">
                    <header>
                        <h2>Registration</h2>
                        <span>Use this form to register for a Partners In Business Conference</span>
                    </header>

                    <div class="5grid">

                        <div class="row">
                            <div class="12u">
                                <div class="5grid">
                                    <div class="6u">
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />

                                        <asp:DropDownList ID="ddl_Conference" runat="server">
                                            <asp:ListItem>--Please Select Conference--</asp:ListItem>
                                            <asp:ListItem>Crossroads</asp:ListItem>
                                            <asp:ListItem>Operational Excellence</asp:ListItem>
                                            <asp:ListItem>Accounting</asp:ListItem>
                                            <asp:ListItem>Information Technology</asp:ListItem>
                                            <asp:ListItem>Leadership</asp:ListItem>
                                        </asp:DropDownList>

                                        <%--Validator for ddl_Conference--%>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" InitialValue="--Please Select Conference--" Text="*" ControlToValidate="ddl_Conference" SetFocusOnError="True">*</asp:RequiredFieldValidator>

                                        <asp:DropDownList ID="ddl_RegistrationType" runat="server">
                                            <asp:ListItem>Please Select Registration Type</asp:ListItem>
                                            <asp:ListItem>Professional</asp:ListItem>
                                            <asp:ListItem>Partner</asp:ListItem>
                                            <asp:ListItem>Student</asp:ListItem>
                                        </asp:DropDownList>

                                    </div>
                                </div>

                            </div>
                        </div>
                        
						<div class="row" >
							<div >
                                

                                
                                <br />
                                <br />
                                <br />
                                <h1>Attendee Information</h1>
                                First Name <asp:TextBox ID="fName" runat="server" ></asp:TextBox>
                                Last Name <asp:TextBox ID="lName" runat="server" ></asp:TextBox>
                                Job Title <asp:TextBox ID="title" runat="server" ></asp:TextBox>  
                                Company <asp:TextBox ID="company" runat="server" ></asp:TextBox>
                                Address <asp:TextBox ID="address" runat="server" ></asp:TextBox>
                                City<asp:TextBox ID="city" runat="server"></asp:TextBox>
                                State <asp:DropDownList ID="ddl_state" runat="server"></asp:DropDownList>
                                Zip Code <asp:TextBox ID="zip" runat="server"></asp:TextBox>

                                Phone Number <asp:TextBox ID="phone" runat="server" ></asp:TextBox>
                                Email <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                <br />
                                <br />
                                <asp:CheckBox ID="cb_contact" runat="server" />
                                First Name <asp:TextBox ID="c_fName" runat="server"></asp:TextBox>
                                Last Name <asp:TextBox ID="c_lName" runat="server"></asp:TextBox>
                                Email <asp:TextBox ID="c_email" runat="server"></asp:TextBox>
                                Phone <asp:TextBox ID="c_phone" runat="server"></asp:TextBox>
                                <br />
                                <br />
                                Is this your first time attending? <asp:RadioButtonList ID="rbl_firstTime" runat="server">
                                    <asp:ListItem>Yes</asp:ListItem>
                                    <asp:ListItem>No</asp:ListItem>
                                </asp:RadioButtonList>
                                How did you hear about our conference? <asp:TextBox ID="txt_hear" runat="server"></asp:TextBox>
                                
                                <%--Connect this CBL to the conferences in the DB.--%>
                                Select the conferences you are interested in. <asp:CheckBoxList ID="cbl_confInterest" runat="server">
                                    <asp:ListItem>Crossroads</asp:ListItem>
                                    <asp:ListItem>OE</asp:ListItem>
                                    <asp:ListItem>Accounting</asp:ListItem>
                                    <asp:ListItem>IT</asp:ListItem>
                                    <asp:ListItem>Leadership</asp:ListItem>
                                </asp:CheckBoxList>
                                
                                
                                
                                <h1>Price Information</h1>
                                Promo Code <asp:TextBox ID="promoCode" runat="server"></asp:TextBox>
                                
                                <%--This button should check the promo code entered against the DB and adjust the price--%>
                                <asp:Button ID="applyPromo" runat="server" Text="Button" OnClick="applyPromo_Click" />
                                
                                <%--Price textbox should be calculated by form and set to read only--%>
                                <asp:TextBox ID="price" runat="server" ReadOnly="True"></asp:TextBox>




							</div>
						</div>

                        <div class="row" >
							<div class="4u" >
                                <p> </p>                              
							</div>
						</div>
					</div>
					<footer>
                        <asp:Button ID="submit" runat="server" Text="Submit" CssClass="button-big" OnClick="submit_Click" />
					</footer>
				</article>
			</div>

		<!-- Footer -->
			<div class="wrapper wrapper-style4" >
				<article id="footer" >					
					<footer>
						<p id="copyright" >
							© 2013 Partners In Business | Website: <a href="http://partners.usu.edu" >partners.usu.edu</a> | Contact: <a href="mailto:kgubler@gmail.com">Kaden Gubler</a> & <a href="mailto:deja7777@gmail.com">Claiton Weeks</a> | Documentation: <a href="/Documentation.aspx">Click Here</a>
						
						</p>
					</footer>
				</article>
			</div>
	
</form></body></html>

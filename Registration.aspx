<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">

    <!-- Registration -->
    <div class="wrapper wrapper-style2">
        <article class="5grid-layout" id="contact">
            <header>
                <h2>Conference Registration</h2>
                <span>Please fill out the form below to register for a conference.</span>
            </header>
            <div class="5grid">
                <div class="row">
                    <div class="12u">
                        <div class="5grid">
                            <div class="row">
                                <div class="12u">
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                                    <asp:DropDownList ID="ddl_Conference" runat="server" OnSelectedIndexChanged="ddl_Conference_SelectedIndexChanged" AutoPostBack="True">
                                        <asp:ListItem>--Please Select Conference--</asp:ListItem>
                                        <asp:ListItem>Crossroads</asp:ListItem>
                                        <asp:ListItem>Operational Excellence</asp:ListItem>
                                        <asp:ListItem>Accounting</asp:ListItem>
                                        <asp:ListItem>Information Technology</asp:ListItem>
                                        <asp:ListItem>Leadership</asp:ListItem>
                                    </asp:DropDownList>

                                    <asp:DropDownList ID="ddl_RegistrationType" runat="server" OnSelectedIndexChanged="ddl_RegistrationType_SelectedIndexChanged" Visible="False" AutoPostBack="True">
                                        <asp:ListItem>--Please Select Registration Type--</asp:ListItem>
                                        <asp:ListItem>Professional</asp:ListItem>
                                        <asp:ListItem>Partner</asp:ListItem>
                                        <asp:ListItem>Student</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <p>________________________________________________________________________________________________________________</p>

                            <div class="row">
                                <div class="6u">
                                    <asp:TextBox ID="fName" runat="server" placeholder="First Name" Visible="False" AutoPostBack="True"></asp:TextBox>
                                    <!-- Validator for fName -->
                                    <%--???? change the text color of the ErrorMessage--%>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter the first name" ControlToValidate="fName" BorderColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="6u">
                                    <asp:TextBox ID="lName" runat="server" placeholder="Last Name" Visible="False"></asp:TextBox>
                                    <!-- Validator for lName -->
                                    <%--???? change the text color of the ErrorMessage--%>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter the last name" ControlToValidate="lName"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="row">
                                <div class="6u">
                                    <asp:TextBox ID="title" runat="server" placeholder="Job Title" Visible="False"></asp:TextBox>

                                </div>
                                <div class="6u">
                                    <asp:TextBox ID="company" runat="server" placeholder="Company" Visible="False"></asp:TextBox>

                                </div>
                            </div>

                            <div class="row">
                                <div class="12u">
                                    <asp:TextBox ID="address" runat="server" placeholder="Address" Visible="False"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="6u">
                                    <asp:TextBox ID="city" runat="server" placeholder="City" Visible="False"></asp:TextBox>
                                </div>
                                <div class="2u">
                                    <asp:DropDownList ID="ddl_state" runat="server" Visible="False">
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem Value="AL">Alabama</asp:ListItem>
                                        <asp:ListItem Value="AK">Alaska</asp:ListItem>
                                        <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                                        <asp:ListItem Value="AR">Arkansas</asp:ListItem>
                                        <asp:ListItem Value="CA">California</asp:ListItem>
                                        <asp:ListItem Value="CO">Colorado</asp:ListItem>
                                        <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                                        <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
                                        <asp:ListItem Value="DE">Delaware</asp:ListItem>
                                        <asp:ListItem Value="FL">Florida</asp:ListItem>
                                        <asp:ListItem Value="GA">Georgia</asp:ListItem>
                                        <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                                        <asp:ListItem Value="ID">Idaho</asp:ListItem>
                                        <asp:ListItem Value="IL">Illinois</asp:ListItem>
                                        <asp:ListItem Value="IN">Indiana</asp:ListItem>
                                        <asp:ListItem Value="IA">Iowa</asp:ListItem>
                                        <asp:ListItem Value="KS">Kansas</asp:ListItem>
                                        <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                                        <asp:ListItem Value="LA">Louisiana</asp:ListItem>
                                        <asp:ListItem Value="ME">Maine</asp:ListItem>
                                        <asp:ListItem Value="MD">Maryland</asp:ListItem>
                                        <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                                        <asp:ListItem Value="MI">Michigan</asp:ListItem>
                                        <asp:ListItem Value="MN">Minnesota</asp:ListItem>
                                        <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                                        <asp:ListItem Value="MO">Missouri</asp:ListItem>
                                        <asp:ListItem Value="MT">Montana</asp:ListItem>
                                        <asp:ListItem Value="NE">Nebraska</asp:ListItem>
                                        <asp:ListItem Value="NV">Nevada</asp:ListItem>
                                        <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                                        <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                                        <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                                        <asp:ListItem Value="NY">New York</asp:ListItem>
                                        <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                                        <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                                        <asp:ListItem Value="OH">Ohio</asp:ListItem>
                                        <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
                                        <asp:ListItem Value="OR">Oregon</asp:ListItem>
                                        <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                                        <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                                        <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                                        <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                                        <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                                        <asp:ListItem Value="TX">Texas</asp:ListItem>
                                        <asp:ListItem Value="UT">Utah</asp:ListItem>
                                        <asp:ListItem Value="VT">Vermont</asp:ListItem>
                                        <asp:ListItem Value="VA">Virginia</asp:ListItem>
                                        <asp:ListItem Value="WA">Washington</asp:ListItem>
                                        <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                                        <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
                                        <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="4u">
                                    <asp:TextBox ID="zip" runat="server" placeholder="Zip Code" Visible="False"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="6u">
                                    <asp:TextBox ID="phone" runat="server" placeholder="Phone Number" Visible="False"></asp:TextBox>
                                </div>
                                <div class="6u">
                                    <asp:TextBox ID="email" runat="server" placeholder="Email" Visible="False"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="6u">
                                    How did you hear about our conference? <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </div>
                                <div class="6u">
                                    
                                </div>
                            </div>

                            <div class="row">
                                <div class="6u">

                                </div>
                                <div class="6u">

                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div class="12u">
                                    <asp:Button ID="submit" runat="server" Text="Submit" CssClass="button" Visible="False" OnClick="submit_Click" />
                                    <asp:Button ID="add" runat="server" Text="Submit and add another" CssClass="button" Visible="False" OnClick="add_Click" />
                                    <asp:Button ID="clear" runat="server" Text="Clear Form" CssClass="button button-alt" Visible="False" OnClick="clear_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </article>
    </div>
</asp:Content>



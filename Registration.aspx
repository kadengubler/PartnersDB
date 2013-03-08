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

                                    <%--<%--Validator for ddl_Conference--%>
                                    <%--                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" InitialValue="--Please Select Conference--" ErrorMessage="Please select a conference" ControlToValidate="ddl_Conference" SetFocusOnError="True">*</asp:RequiredFieldValidator>--%>
                                    <%--Validator for ddl_RegistrationType--%>
                                    <%--                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" InitialValue="--Please Select Registration Type--" ErrorMessage="Please select a registration type" ControlToValidate="ddl_RegistrationType" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>

                            <p>________________________________________________________________________________________________________________</p>

                            <div class="row">
                                <div class="6u">
                                    <asp:TextBox ID="fName" runat="server" placeholder="First Name" Visible="False" AutoPostBack="True"></asp:TextBox>
                                    <%--Validator for fName--%>
                                    <%--???? change the text color of the ErrorMessage--%>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter the first name" ControlToValidate="fName" BorderColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="6u">
                                    <asp:TextBox ID="lName" runat="server" placeholder="Last Name" Visible="False"></asp:TextBox>
                                    <%--Validator for lName--%>
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
                                <div class="4u">
                                    <asp:TextBox ID="city" runat="server" placeholder="City" Visible="False"></asp:TextBox>
                                </div>
                                <div class="4u">
                                    <asp:DropDownList ID="ddl_state" runat="server" Visible="False"></asp:DropDownList>
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



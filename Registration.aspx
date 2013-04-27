<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" MaintainScrollPositionOnPostback="true" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">

    <!-- Conference and Registration Type -->
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="wrapper wrapper-style2">
        <article class="5grid-layout" id="contact">
            <header>
                <h2>Conference Registration</h2>
                <span>Select the conference you would like to register for.</span>
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
                                        <asp:ListItem Value="CR">Crossroads</asp:ListItem>
                                        <asp:ListItem Value="OE">Operational Excellence</asp:ListItem>
                                        <asp:ListItem Value="ACCT">Accounting</asp:ListItem>
                                        <asp:ListItem Value="IT">Information Technology</asp:ListItem>
                                        <asp:ListItem Value="LEAD">Leadership</asp:ListItem>
                                    </asp:DropDownList>

                                    <asp:DropDownList ID="ddl_RegistrationType" runat="server" OnSelectedIndexChanged="ddl_RegistrationType_SelectedIndexChanged" Visible="False" AutoPostBack="True">
                                        <asp:ListItem>--Please Select Registration Type--</asp:ListItem>
                                        <asp:ListItem>Professional</asp:ListItem>
                                        <asp:ListItem>Partner</asp:ListItem>
                                        <asp:ListItem>Student/Faculty</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </article>
    </div>


    <!-- Attendee Information -->
    <asp:Panel ID="Panel1" runat="server" CssClass="wrapper wrapper-style3" Visible="false">
        <article class="5grid-layout" id="Article1">
            <header>
                <h2></h2>
                <span>Fill out the information below to register for the conference.</span>
            </header>
            <div class="5grid">
                <div class="row">
                    <div class="12u">
                        <div class="5grid">
                            <div class="row">
                                <div class="12u">
                                    <asp:DropDownList ID="ddl_daysAttending" runat="server" Visible="False" DataSourceID="SqlDataSource2" DataTextField="Days" DataValueField="Days"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" SelectCommand="usp_GetDays" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddl_Conference" Name="ConferenceTitle" PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>

                            <div class="row">
                                <div class="4u">
                                    <asp:TextBox ID="aNumber" runat="server" placeholder="Anumber" Visible="false"></asp:TextBox>
                                </div>
                                <div class="4u">
                                    <asp:CheckBox ID="cb_student" runat="server" Text="Student" Visible="false" ForeColor="Black" Font-Bold="True" AutoPostBack="True" />
                                    <asp:MutuallyExclusiveCheckBoxExtender ID="MutuallyExclusiveCheckBoxExtender3" TargetControlID="cb_student" Key="stu/fac" runat="server"></asp:MutuallyExclusiveCheckBoxExtender>
                                </div>
                                <div class="4u">
                                    <asp:CheckBox ID="cb_faculty" runat="server" Text="Faculty" Visible="false" ForeColor="Black" Font-Bold="True" AutoPostBack="True" />
                                    <asp:MutuallyExclusiveCheckBoxExtender ID="MutuallyExclusiveCheckBoxExtender4" TargetControlID="cb_faculty" Key="stu/fac" runat="server"></asp:MutuallyExclusiveCheckBoxExtender>
                                </div>
                            </div>
                            <div class="row">
                                <div class="4u">
                                    <asp:CheckBox ID="cb_lunch" runat="server" Text="Lunch" Visible="false" ForeColor="Black" Font-Bold="True" EnableTheming="True" />
                                </div>
                                <div class="4u">
                                    <asp:CheckBox ID="cb_daybook" runat="server" Text="Daybook" Visible="false" ForeColor="Black" Font-Bold="True" />
                                </div>
                                <div class="4u">
                                    <asp:CheckBox ID="cb_networkDinner" runat="server" Text="Networking Dinner" Visible="false" ForeColor="Black" Font-Bold="True" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="4u">
                                <asp:TextBox ID="partnership" runat="server" placeholder="Partnership#" Visible="false"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="6u">
                                <asp:TextBox ID="fName" runat="server" placeholder="First Name" Visible="true"></asp:TextBox>
                                <!-- Validator for fName -->
                                <%--???? change the text color of the ErrorMessage--%>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter the first name" ControlToValidate="fName" BorderColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="6u">
                                <asp:TextBox ID="lName" runat="server" placeholder="Last Name" Visible="true"></asp:TextBox>
                                <!-- Validator for lName -->
                                <%--???? change the text color of the ErrorMessage--%>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter the last name" ControlToValidate="lName"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="row">
                            <div class="4u">
                                <asp:TextBox ID="title" runat="server" placeholder="Job Title" Visible="true"></asp:TextBox>

                            </div>
                            <div class="4u">
                                <asp:TextBox ID="company" runat="server" placeholder="Company" Visible="true"></asp:TextBox>
                                <asp:AutoCompleteExtender ID="AutoCompleteExtender1" Enabled="true" runat="server" MinimumPrefixLength="1" TargetControlID="company"
                                    UseContextKey="True" ServiceMethod="GetCompletionList" CompletionSetCount="10" CompletionInterval="1000" EnableCaching="true" ServicePath="AutoExtender.asmx" />
                            </div>
                            <div class="4u">
                                <asp:TextBox ID="department" runat="server" placeholder="Department" Visible="true"></asp:TextBox>

                            </div>
                        </div>

                        <div class="row">
                            <div class="12u">
                                <asp:TextBox ID="address" runat="server" placeholder="Address" Visible="true"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row">
                            <div class="6u">
                                <asp:TextBox ID="city" runat="server" placeholder="City" Visible="true"></asp:TextBox>
                            </div>
                            <div class="2u">
                                <asp:DropDownList ID="ddl_state" runat="server" Visible="true" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="StateName" DataValueField="ST">
                                    <asp:ListItem Value="-state-">-state-</asp:ListItem>
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
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" SelectCommand="SELECT * FROM [States] ORDER BY [StateName]"></asp:SqlDataSource>
                            </div>
                            <div class="4u">
                                <asp:TextBox ID="zip" runat="server" placeholder="Zip Code" Visible="true"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row">
                            <div class="2u">
                                <asp:TextBox ID="areaCode" runat="server" placeholder="(   )" Visible="true"></asp:TextBox>
                            </div>
                            <div class="2u">
                                <asp:TextBox ID="exchange" runat="server" placeholder="Phone -" Visible="true"></asp:TextBox>
                            </div>
                            <div class="2u">
                                <asp:TextBox ID="subscriberNumber" runat="server" placeholder="Number" Visible="true"></asp:TextBox>
                            </div>
                            <div class="6u">
                                <asp:TextBox ID="email" runat="server" placeholder="Email" Visible="true"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row">
                            <div class="6u">
                                <asp:TextBox ID="promocode" runat="server" placeholder="Promo Code" Visible="true"></asp:TextBox>
                            </div>
                        </div>



                        <div align="middle">
                            <div id="notifications" runat="server" visible="false" style="border: solid 3px black; background-color: white; width: 1000px;">
                                <%--<asp:Panel ID="notifications" runat="server" Visible="false" BorderStyle="Solid" BorderColor="#999999" BorderWidth="3px" BackColor="White" Width="1000px" HorizontalAlign="Center">--%>
                                <div class="row">
                                    <div class="12u">
                                        <span>Select the conferences for which you would like to receive notifications</span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="12u">
                                        &nbsp;<asp:CheckBox ID="cb_acct" Text="Accounting" runat="server" ForeColor="Black" Font-Bold="True" />
                                        &nbsp;<asp:CheckBox ID="cb_cr" Text="Human Resources" runat="server" ForeColor="Black" Font-Bold="True" />
                                        &nbsp;<asp:CheckBox ID="cb_it" Text="Information Technology" runat="server" ForeColor="Black" Font-Bold="True" />
                                        &nbsp;<asp:CheckBox ID="cb_lead" Text="Leadership" runat="server" ForeColor="Black" Font-Bold="True" />
                                        &nbsp;<asp:CheckBox ID="cb_oe" Text="Operational Excellence" runat="server" ForeColor="Black" Font-Bold="True" /><br />
                                    </div>
                                </div>
                            </div>

                        </div>
                        <br />
                        <br />


                        <div id="buttons" runat="server" visible="false">
                            <div class="row">
                                <div class="12u">
                                    <asp:Button ID="submit" runat="server" Text="Submit" CssClass="button" Visible="true" OnClick="submit_Click" />
                                    <asp:Button ID="add" runat="server" Text="Submit and add another" CssClass="button" Visible="true" OnClick="add_Click" />
                                    <asp:Button ID="clear" runat="server" Text="Clear Form" CssClass="button button-alt" Visible="true" OnClick="clear_Click" CausesValidation="False" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </article>
    </asp:Panel>


</asp:Content>


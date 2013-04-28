<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="Reports" MaintainScrollPositionOnPostback="true"%>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>


<%@ Register src="Temp/DataFilter.ascx" tagname="DataFilter" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">

    <!-- Page Nav -->
    <nav id="pgnav">
        <ul>
            <li><a href="#top">Top |</a></li>
            <li><a href="Reports.aspx">Reports |</a></li>
            <li><a href="StatusBoard.aspx">Status Board |</a></li>            
            <li><a href="Partnerships.aspx">Partnerships |</a></li>
            <li><a href="AttendeeList.aspx">Attendee List</a></li>
        </ul>
    </nav>

    <br />


    <!-- Reports -->
    <div class="wrapper wrapper-style1">
        <article class="5grid-layout" id="contact">
            <header>
                <h2>Reports</h2>
                <span>Please select the report to run.</span>
            </header>
            <div class="5grid">
                <div class="row">
                    <div class="12u">
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                        <asp:DropDownList ID="ddl_Conference" runat="server" OnSelectedIndexChanged="ddl_Conference_SelectedIndexChanged" AutoPostBack="True">
                            <asp:ListItem>--Please Select Conference--</asp:ListItem>
                            <%--<asp:ListItem value="all">All Conferences</asp:ListItem>--%>
                            <asp:ListItem Value="CR">Crossroads</asp:ListItem>
                            <asp:ListItem Value="OE">Operational Excellence</asp:ListItem>
                            <asp:ListItem Value="Acct">Accounting</asp:ListItem>
                            <asp:ListItem Value="IT">Information Technology</asp:ListItem>
                            <asp:ListItem Value="Lead">Leadership</asp:ListItem>
                        </asp:DropDownList>

                        <!-- This list will be populated with more reports as nessessary -->
                        <asp:DropDownList ID="ddl_Report" runat="server" Visible="False" AutoPostBack="True" OnSelectedIndexChanged="ddl_Report_SelectedIndexChanged">
                            <asp:ListItem>--Please Select Report Type--</asp:ListItem>
                            <asp:ListItem>List of attendees at past conferences</asp:ListItem>                            
                            <%--<asp:ListItem>Current list of registered attendees</asp:ListItem>                           
                            <asp:ListItem>List of current partnerships</asp:ListItem>
                            <asp:ListItem>List of current sponsors</asp:ListItem>
                            <asp:ListItem>List of current co-sponsors</asp:ListItem>
                            <asp:ListItem>Name badges</asp:ListItem>
                            <asp:ListItem>Speaker itineraries</asp:ListItem>
                            <asp:ListItem>List of past years partnerships</asp:ListItem>
                            <asp:ListItem>Email Blast List</asp:ListItem>
                            <asp:ListItem>Custom Report</asp:ListItem>--%>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
           

<<<<<<< HEAD

=======
>>>>>>> kaden
            <%--<p>________________________________________________________________________________________________________________</p>--%>


            <!-- Controls for custom report -->
            <%--??? populate ddl's with column names from the DB ???--%>
            <%--<div class="5grid" id="cr" runat="server" visible="false">
                <div class="row">
                    <div class="12u">
                        <h3></h3>
                        <h3>Select the items to display in the report</h3>

                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" SelectCommand="SELECT column_name,* from information_schema.columns WHERE table_name = 'Contacts' ORDER BY ordinal_position"></asp:SqlDataSource>

                        <div class="row">
                            <div class="2u">
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="column_name" DataValueField="column_name"></asp:DropDownList>
                            </div>
                            <div class="2u">
                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="column_name" DataValueField="column_name"></asp:DropDownList>
                            </div>
                            <div class="2u">
                                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="column_name" DataValueField="column_name"></asp:DropDownList>
                            </div>
                            <div class="2u">
                                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource3" DataTextField="column_name" DataValueField="column_name"></asp:DropDownList>
                            </div>
                            <div class="2u">
                                <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource3" DataTextField="column_name" DataValueField="column_name"></asp:DropDownList>
                            </div>
                            <div class="2u">
                                <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource3" DataTextField="column_name" DataValueField="column_name"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="12u">
                                <asp:Button ID="Button1" runat="server" Text="Run Report" CssClass="button" OnClick="Button1_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>--%>



        </article>
    </div>

    <asp:Panel ID="gvAttendee" runat="server" Visible="false">
                <div class="wrapper wrapper-style3">
                    <article class="5grid-layout">
                        <header>
                            <h2>List of attendees at the <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label> conference</h2>
                            <span></span>
                        </header>

                        <!-- Gridview  -->
                        <%--???  do we need a seperate gridview for each report or can we alter what the GV displays based on the report selected ???--%>
                        <div class="row">
                            <div class="12u">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                    <AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
                                    <Columns>
                                        <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                                        <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                                        <asp:BoundField DataField="OrgName" HeaderText="Organization" SortExpression="OrgName" />
                                    </Columns>

                                    <PagerStyle CssClass="pgr"></PagerStyle>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" SelectCommand="SELECT Contacts.FirstName, Contacts.LastName, Contacts.Title, Contacts.OrgID, Organization.OrgName FROM Contacts INNER JOIN Organization ON Contacts.OrgID = Organization.OrgID INNER JOIN ConferenceAttendees ON Contacts.ContactID = ConferenceAttendees.ContactID INNER JOIN Conference ON ConferenceAttendees.ConferenceID = Conference.ConferenceID WHERE ConferenceTitle = @ConferenceTitle ">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_Conference" Name="ConferenceTitle" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </article>
                </div>
        </asp:Panel>
   
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Partnerships.aspx.cs" Inherits="Partnerships" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">

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


    <div class="wrapper wrapper-style1">
        <article class="5grid-layout" id="Article1">
            <header>
                <h2>Partnerships</h2>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                <span></span>
            </header>
            <div class="5grid">
                <div class="row">
                    <div class="12u">
                        <div class="5grid">
                            <div class="row">
                                <div class="12u">


                                    <asp:GridView ID="gvPartners" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" GridLines="Both" runat="server" AutoGenerateColumns="False" DataKeyNames="PartnershipID" DataSourceID="PartnershipTracking" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                        <Columns>
                                            <asp:CommandField ShowSelectButton="True" SelectText="View" />
                                            <asp:BoundField DataField="PartnershipID" HeaderText="PartnershipID" ReadOnly="True" SortExpression="PartnershipID" />
                                            <asp:BoundField DataField="OrgName" HeaderText="OrgName" SortExpression="OrgName" />
                                            <asp:BoundField DataField="DaysPurchased" HeaderText="DaysPurchased" SortExpression="DaysPurchased" />
                                            <asp:BoundField DataField="DaysUsed" HeaderText="DaysUsed" ReadOnly="True" SortExpression="DaysUsed" />
                                            <asp:BoundField DataField="AvailableDays" HeaderText="AvailableDays" SortExpression="AvailableDays" ReadOnly="True" />
                                            <asp:BoundField DataField="PurchaseDate" HeaderText="PurchaseDate" SortExpression="PurchaseDate" />
                                            <asp:BoundField DataField="ExpirationDate" HeaderText="ExpirationDate" ReadOnly="True" SortExpression="ExpirationDate" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="PartnershipTracking" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" SelectCommand="SELECT * FROM [PartnershipTracking]"></asp:SqlDataSource>

                                </div>
                                <asp:GridView ID="gvDaysUsed" CssClass="gridview" runat="server" AutoGenerateColumns="False" DataSourceID="PartnershipUse" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" Visible="False">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" SelectText="Back" />
                                        <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                                        <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                                        <asp:BoundField DataField="OrgName" HeaderText="OrgName" SortExpression="OrgName" />
                                        <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                                        <asp:BoundField DataField="ConferenceTitle" HeaderText="ConferenceTitle" SortExpression="ConferenceTitle" />
                                        <asp:BoundField DataField="DaysAttending" HeaderText="DaysAttending" SortExpression="DaysAttending" />
                                        <asp:BoundField DataField="TotalPrice" HeaderText="TotalPrice" ReadOnly="True" SortExpression="TotalPrice" />
                                        <asp:BoundField DataField="PartnershipID" HeaderText="PartnershipID" SortExpression="PartnershipID" />
                                        <asp:BoundField DataField="StartingDate" HeaderText="StartingDate" SortExpression="StartingDate" />
                                        <asp:BoundField DataField="TotalDays" HeaderText="TotalDays" SortExpression="TotalDays" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="PartnershipUse" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" SelectCommand="SELECT Contacts.FirstName, Contacts.LastName, Contacts.Title, Organization.OrgName, Contacts.Department, Conference.ConferenceTitle, ConferenceAttendees.DaysAttending, ConferenceAttendees.TotalPrice, ConferenceAttendees.PartnershipID, Conference.StartingDate, Conference.TotalDays FROM ConferenceAttendees INNER JOIN Conference ON ConferenceAttendees.ConferenceID = Conference.ConferenceID INNER JOIN Contacts ON ConferenceAttendees.ContactID = Contacts.ContactID INNER JOIN Organization ON Contacts.OrgID = Organization.OrgID WHERE (ConferenceAttendees.PartnershipID = @PartnershipID)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="gvPartners" Name="PartnershipID" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </article>
    </div>
    
    
</asp:Content>
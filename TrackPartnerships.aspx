<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TrackPartnerships.aspx.cs" Inherits="TrackPartnerships" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PartnershipID" DataSourceID="PartnershipTracking" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
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
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="PartnershipUse" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" Visible="False">
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
                <asp:ControlParameter ControlID="GridView1" Name="PartnershipID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>

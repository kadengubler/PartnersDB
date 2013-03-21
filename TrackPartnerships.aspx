<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TrackPartnerships.aspx.cs" Inherits="TrackPartnerships" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PartnershipID" DataSourceID="PartnershipTracking">
            <Columns>
                <asp:BoundField DataField="PartnershipID" HeaderText="PartnershipID" ReadOnly="True" SortExpression="PartnershipID" />
                <asp:BoundField DataField="DaysPurchased" HeaderText="DaysPurchased" SortExpression="DaysPurchased" />
                <asp:BoundField DataField="DaysUsed" HeaderText="DaysUsed" ReadOnly="True" SortExpression="DaysUsed" />
                <asp:BoundField DataField="AvailableDays" HeaderText="AvailableDays" ReadOnly="True" SortExpression="AvailableDays" />
                <asp:BoundField DataField="PurchaseDate" HeaderText="PurchaseDate" SortExpression="PurchaseDate" />
                <asp:BoundField DataField="ExpirationDate" HeaderText="ExpirationDate" ReadOnly="True" SortExpression="ExpirationDate" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="PartnershipTracking" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [PartnershipTracking]"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

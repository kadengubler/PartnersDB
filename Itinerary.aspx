
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Itinerary.aspx.cs" Inherits="Itinerary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="ConferenceDay" DataValueField="ConferenceDate" AutoPostBack="True">
</asp:DropDownList>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" SelectCommand="usp_Itinerary" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="DropDownList1" DbType="Date" Name="ConferenceDate" PropertyName="SelectedValue" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:gridview runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
    <Columns>
        <asp:BoundField DataField="TimeSlot" HeaderText="TimeSlot" SortExpression="TimeSlot" />
        <asp:BoundField DataField="Speaker" HeaderText="Speaker" ReadOnly="True" SortExpression="Speaker" />
    </Columns>
</asp:gridview>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" SelectCommand="usp_ConferenceByDay" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    </div>
    </form>
</body>
</html>

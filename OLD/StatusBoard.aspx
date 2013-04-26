<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StatusBoard.aspx.cs" Inherits="StatusBoard" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <!-- Nav -->
        <nav id="nav">
            <ul>
                <li><a href="Default.aspx">Home</a></li>
                <li><a href="Registration.aspx">Registration</a></li>
                <li><a href="Reports.aspx">Reports</a></li>
                <li><a href="Conferences.aspx">Conferences</a></li>
                <li><a href="Documentation.aspx">Help</a></li>
            </ul>
        </nav>
        
     <div>
    
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="ConfYear" DataValueField="ConferenceID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" SelectCommand="SELECT [ConferenceID], [ConferenceTitle] + ' ' + DATENAME(yy,[StartingDate]) AS ConfYear FROM [Conference]"></asp:SqlDataSource>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" GridLines="None" AllowPaging="true">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="Conference" HeaderText="Conference" ReadOnly="True" SortExpression="Conference" />
                <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                <asp:BoundField DataField="SpeakerStatus" HeaderText="SpeakerStatus" SortExpression="SpeakerStatus" />
                <asp:CheckBoxField DataField="Picture" HeaderText="Picture" SortExpression="Picture" />
                <asp:CheckBoxField DataField="Bio" HeaderText="Bio" SortExpression="Bio" />
                <asp:CheckBoxField DataField="Summary" HeaderText="Summary" SortExpression="Summary" />
                <asp:CheckBoxField DataField="Slides" HeaderText="Slides" SortExpression="Slides" />
                <asp:CheckBoxField DataField="Travel" HeaderText="Travel" SortExpression="Travel" />
            </Columns>
        </asp:GridView>
        <asp:GridView ID="GridView2" runat="server">
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" SelectCommand="usp_StatusBoard" SelectCommandType="StoredProcedure" UpdateCommand="usp_UpdateSpeaker" UpdateCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="ConferenceID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="SpeakerID" Type="Int32" />
                <asp:Parameter Name="SpeakerStatus" Type="String" />
                <asp:Parameter Name="Picture" Type="Boolean" />
                <asp:Parameter Name="Bio" Type="Boolean" />
                <asp:Parameter Name="Summary" Type="Boolean" />
                <asp:Parameter Name="Slides" Type="Boolean" />
                <asp:Parameter Name="Travel" Type="Boolean" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>

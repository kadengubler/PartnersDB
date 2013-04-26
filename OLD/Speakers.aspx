<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Speakers.aspx.cs" Inherits="AttendeeList" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">

    <div>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="ConfYear" DataValueField="ConferenceID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" SelectCommand="SELECT [ConferenceID], [ConferenceTitle] + ' ' + DATENAME(yy,[StartingDate]) AS ConfYear FROM [Conference]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" 
                    SortExpression="LastName" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <%--<asp:BoundField DataField="Organization" HeaderText="Organization" SortExpression="Organization" />--%>
                <asp:BoundField DataField="SpeakerStatus" HeaderText="SpeakerStatus" SortExpression="SpeakerStatus" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" 
            SelectCommand="usp_SpeakersByConference" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="ConferenceID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

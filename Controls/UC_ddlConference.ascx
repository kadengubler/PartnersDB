<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_ddlConference.ascx.cs" Inherits="Controls_UC_ddlConference" %>
<div>
    <asp:DropDownList ID="ddl_Conference" runat="server" AutoPostBack="True" ViewStateMode="Enabled">
        <asp:ListItem>--Please Select Conference--</asp:ListItem>
        <asp:ListItem Value="CR">Crossroads</asp:ListItem>
        <asp:ListItem Value="OE">Operational Excellence</asp:ListItem>
        <asp:ListItem Value="ACCT">Accounting</asp:ListItem>
        <asp:ListItem Value="IT">Information Technology</asp:ListItem>
        <asp:ListItem Value="LEAD">Leadership</asp:ListItem>
    </asp:DropDownList>
</div>
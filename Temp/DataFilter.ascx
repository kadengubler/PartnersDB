<%@ Control Language="C#" AutoEventWireup="true" Inherits="DataFilterDemo.DataFilter" Codebehind="DataFilter.ascx.cs" %>
<asp:UpdatePanel ID="updatePanel" runat="server">
    <ContentTemplate>
        <asp:Panel ID="pnlTools" runat="server">
        </asp:Panel>
        <asp:Panel ID="pnlNewFilter" runat="server">
        </asp:Panel>
        <asp:Panel ID="pnlToolbar" runat="server">
            <asp:Button ID="btnAddNewFilter" runat="server" Text="Add Filter" CssClass="buttons"
                OnClick="btnAddNewFilter_Click" />
            <asp:Button ID="btnAndNewFilter" runat="server" CssClass="buttons" Text="AND" Visible="False"
                OnClick="btnAndNewFilter_Click" />
            <asp:Button ID="btnOrNewFilter" runat="server" CssClass="buttons" Text="OR" Visible="False"
                OnClick="btnOrNewFilter_Click" /></asp:Panel>
        <asp:Panel ID="pnlInfo" runat="server">
            <asp:Label ID="lblInfo" runat="server" Font-Names="Arial" Font-Size="Larger" ForeColor="Red"></asp:Label>
        </asp:Panel>
    </ContentTemplate>
</asp:UpdatePanel>

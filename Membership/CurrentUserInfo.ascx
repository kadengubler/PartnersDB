<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CurrentUserInfo.ascx.cs" Inherits="Membership_WebUserControl" %>
<style type="text/css">
    .auto-style1 {
        height: 26px;
    }
</style>
<h1>Welcome <asp:LoginName ID="LoginName1" runat="server" />

</h1><p>
    <a href="Welcome.aspx">Go back to Welcome Page</a></p>
<br />
<asp:ChangePassword ID="ChangePassword1" runat="server">
</asp:ChangePassword>
<p>
    <br />
</p>
<table style="width: 36%; height: 172px;">
    <tr>
        <td>First Name</td>
        <td>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style1">Last Name</td>
        <td class="auto-style1">
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>Phone</td>
        <td>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>Street</td>
        <td>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>City</td>
        <td>
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>State</td>
        <td>
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>Zip</td>
        <td>
            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>Country</td>
        <td>
            <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
        </td>
    </tr>
</table>

<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Update Profile" />
<br />


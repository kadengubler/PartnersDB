<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Membership_Login2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">

    <div class="wrapper wrapper-style2">
        <article class="5grid-layout" id="search">
            <header>
                <h2>Login</h2>
                <span>Log in to access the Partners In Business database.</span>
            </header>
            <div class="5grid">
                <div class="row">
                    <div class="12u">
                        <div class="5grid">
                            <div class="row">
                                <div class="12u">
                                    <div align="middle">
                                        <asp:Login ID="Login1" runat="server" CreateUserUrl="~/Membership/CreateUser.aspx" CreateUserText="Create Account" PasswordRecoveryText="Forgot Password?" PasswordRecoveryUrl="RecoverPassword.aspx" DestinationPageUrl="Welcome.aspx">
                                            <LayoutTemplate>
                                                <table cellpadding="15" cellspacing="15" style="border-collapse:collapse;" align="center">
                                                    <tr>
                                                        <td>
                                                            <table cellpadding="15px" cellspacing="15px">
                                                                <tr>
                                                                    <td align="center" colspan="4" style="color:Red;">
                                                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center" colspan="2">
                                                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name: </asp:Label>
                                                                    </td>
                                                                    <td align="middle" colspan="2">
                                                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password: </asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="200px" colspan="2">
                                                                        <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                                    </td>

                                                                    <td width="200px" colspan="2">
                                                                        <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" colspan="2">
                                                                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" />
                                                                    </td>
                                                                    <td colspan="2">
                                                                        <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2" align="right">
                                                                        <asp:HyperLink ID="CreateUserLink" runat="server" NavigateUrl="~/Membership/CreateUser.aspx">Create Account</asp:HyperLink>&nbsp;&nbsp;
                                                                    </td>
                                                                    <td colspan="2">
                                                                        <asp:HyperLink ID="PasswordRecoveryLink" runat="server" NavigateUrl="RecoverPassword.aspx">Forgot Password?</asp:HyperLink>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </LayoutTemplate>
                                        </asp:Login>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </article>
    </div>
</asp:Content>


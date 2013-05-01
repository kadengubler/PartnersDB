<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Welcome.aspx.cs" Inherits="Membership_Welcome" MasterPageFile="~/MasterPage.master"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">

    <div class="wrapper wrapper-style2">
        <article class="5grid-layout" id="search">
            <header>
                <h2>Welcome</h2>
                <span>You can access the your account settings from here.</span>
            </header>
            <div class="5grid">
                <div class="row">
                    <div class="12u">
                        <div class="5grid">
                            <div class="row">
                                <div class="6u">
                                    <div align="middle">
    <div>
        <asp:LoginView ID="LoginView1" runat="server">
            <AnonymousTemplate>
                You are not logged in. Please login <a href="Login.aspx">here</a>.
            </AnonymousTemplate>
            <RoleGroups>
                <asp:RoleGroup Roles="Admin">
                    <ContentTemplate>
                        <a href="Admin.aspx">Admin.aspx</a>&nbsp;
                        <br />
                        <a href="User.aspx">User.aspx</a><br />
                        <asp:LoginStatus ID="LoginStatus2" runat="server" />
                    </ContentTemplate>
                </asp:RoleGroup>
                <asp:RoleGroup Roles="User">
                    <ContentTemplate>
                        <a href="User.aspx">User.aspx</a>
                        <asp:LoginStatus ID="LoginStatus1" runat="server" />
                    </ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>
        </asp:LoginView>
    </div>
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


<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User.aspx.cs" Inherits="Membership_User" MasterPageFile="~/MasterPage.master" %>
<%@ Register src="CurrentUserInfo.ascx" tagname="CurrentUserInfo" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">

    <div class="wrapper wrapper-style2">
        <article class="5grid-layout" id="search">
            <header>
                <h2>User Info</h2>
                <span>Here are the details of your user account.</span>
            </header>
            <div class="5grid">
                <div class="row">
                    <div class="12u">
                        <div class="5grid">
                            <div class="row">
                                <div class="12u">
                                    <div align="middle">
        <uc1:CurrentUserInfo ID="CurrentUserInfo1" runat="server" />
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


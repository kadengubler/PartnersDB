<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateUser.aspx.cs" Inherits="Membership_CreateUser" MasterPageFile="~/MasterPage.master" %>
<%@ Register src="CurrentUserInfo.ascx" tagname="CurrentUserInfo" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">

    <div class="wrapper wrapper-style2">
        <article class="5grid-layout" id="search">
            <header>
                <h2>Create User</h2>
                <span>Please enter your information to create an account.</span>
            </header>
            <div class="5grid">
                <div class="row">
                    <div class="12u">
                        <div class="5grid">
                            <div class="row">
                                <div class="12u">
                                    <div align="middle">
        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" Height="278px" OnCreatedUser="CreateUserWizard1_CreatedUser" Width="289px" LoginCreatedUser="False" ContinueDestinationPageUrl="~/Membership/Login.aspx">
            <WizardSteps>
                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                </asp:CompleteWizardStep>
            </WizardSteps>
        </asp:CreateUserWizard>

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


<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Confirmation.aspx.cs" Inherits="Confirmation" %>
<%@ PreviousPageType VirtualPath="Registration.aspx" %>

<asp:Content ID="Content1" contentplaceholderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 570px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" contentplaceholderID="body" Runat="Server">

    <div class="wrapper wrapper-style1">
        <article class="5grid-layout" id="Article1">
            <header>
                <h2>Registration Confirmation</h2>
                <span>
                    <asp:Label ID="lblHeaderMessage" runat="server" Text=""></asp:Label></span>
                <br />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Return to Home Page</asp:HyperLink>
            </header>
            <asp:Panel ID="Panel1" runat="server" Visible="true" style="display:inline-table;">
                <table style="text-align:left; padding:10px; border-spacing:20px; display:inline">
                                <tr>
                                    <td style="width:120px">
                                        <asp:Label ID="lblName" runat="server" Text="Name: "></asp:Label>
                                    </td>
                                    <td style="width:280px">
                                        <asp:Label ID="fName" runat="server" Text="" Visible="true"></asp:Label>
                                        &nbsp;<asp:Label ID="lName" runat="server" Text="" Visible="true"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPosition" runat="server" Text="Position:"></asp:Label>
                                    </td>
                                    <td class="auto-style1">
                                        <asp:Label ID="title" runat="server" Text="Job Title" Visible="true"></asp:Label>
                                        <asp:Label ID="lblAt" runat="server" Text="&nbsp;at&nbsp;"></asp:Label>                       
                                        <asp:Label ID="company" runat="server" Text="Company" Visible="true"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblDepartment" runat="server" Text="Department:&nbsp;"></asp:Label>
                                    </td>
                                    <td class="auto-style1">
                                        <asp:Label ID="department" runat="server" Text="Department" Visible="true"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblAddress" runat="server" Text="Address: "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="address" runat="server" Text="Address" Visible="true"></asp:Label><br />
                                        <asp:Label ID="city" runat="server" Text="City" Visible="true"></asp:Label>,&nbsp;
                                        <asp:Label ID="ddl_state" runat="server" Text="State" Visible="true" ></asp:Label>&nbsp;
                                        <asp:Label ID="zip" runat="server" Text="Zip Code" Visible="true"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPhone" runat="server" Text="Phone: "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="areaCode" runat="server" Text="(   )" Visible="true"></asp:Label> -
                                        <asp:Label ID="exchange" runat="server" Text="Phone -" Visible="true"></asp:Label> -
                                        <asp:Label ID="subscriberNumber" runat="server" Text="Number" Visible="true"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblEmail" runat="server" Text="E-mail: "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="email" runat="server" Text="Email" Visible="true"></asp:Label>
                                    </td>
                                </tr>
                            </table>
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server" Visible="true" style="display:inline-table;">
                <table style="text-align:left; padding:10px; border-spacing:20px; display:inline">
                    <tr>
                        <td style="width:150px">
                            <asp:Label ID="lbl_partnum" runat="server" Text="Partnership#" Visible="False"></asp:Label>
                            <asp:Label ID="cb_student" runat="server" Text="Student" Visible="false" />
                            <asp:Label ID="cb_faculty" runat="server" Text="Faculty" Visible="false" />
                            <asp:Label ID="lbl_anum" runat="server" Text="&nbsp;A-Number" Visible="false"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="partnership" runat="server" Text="Partnership#" Visible="True"></asp:Label>
                            <asp:Label ID="aNumber" runat="server" Text="A-Number" Visible="True"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblOptions" runat="server" Text="Chosen Options:&nbsp;"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblOptionsChose" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblNotificationsTitle" runat="server" Text="Notifications:&nbsp;"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblNotifications" runat="server" Text=""></asp:Label>
                        </td> 
                    </tr>
                </table>
            </asp:Panel>
        </article>
    </div>
</asp:Content>


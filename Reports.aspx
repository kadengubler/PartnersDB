<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="Reports" %>

<%@ Register src="Temp/DataFilter.ascx" tagname="DataFilter" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">

    <!-- Reports -->
    <div class="wrapper wrapper-style2">
        <article class="5grid-layout" id="contact">
            <header>
                <h2>Reports</h2>
                <span>Please select the report to run.</span>
            </header>
            <div class="5grid">
                <div class="row">
                    <div class="12u">
                        <div class="5grid">
                            <div class="row">
                                <div class="12u">
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                                    <asp:DropDownList ID="ddl_Conference" runat="server" OnSelectedIndexChanged="ddl_Conference_SelectedIndexChanged" AutoPostBack="True">
                                        <asp:ListItem>--Please Select Conference--</asp:ListItem>
                                        <asp:ListItem>Crossroads</asp:ListItem>
                                        <asp:ListItem>Operational Excellence</asp:ListItem>
                                        <asp:ListItem>Accounting</asp:ListItem>
                                        <asp:ListItem>Information Technology</asp:ListItem>
                                        <asp:ListItem>Leadership</asp:ListItem>
                                    </asp:DropDownList>

                                    <asp:DropDownList ID="ddl_Report" runat="server" Visible="False" AutoPostBack="True" OnSelectedIndexChanged="ddl_Report_SelectedIndexChanged">
                                        <asp:ListItem>--Please Select Report Type--</asp:ListItem>
                                        <asp:ListItem>Custom Report</asp:ListItem>
                                        <asp:ListItem>Current list of registered attendees</asp:ListItem>
                                        <asp:ListItem>List of attendees at past conferences</asp:ListItem>
                                        <asp:ListItem>List of current partnerships</asp:ListItem>
                                        <asp:ListItem>List of current sponsors</asp:ListItem>
                                        <asp:ListItem>List of current co-sponsors</asp:ListItem>
                                        <asp:ListItem>Name badges</asp:ListItem>
                                        <asp:ListItem>Speaker itineraries</asp:ListItem>
                                        <asp:ListItem>List of past years partnerships</asp:ListItem>
                                        <asp:ListItem>Email Blast List</asp:ListItem>
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <p>________________________________________________________________________________________________________________</p>

                            <!-- Controls for custom report -->
                            <%--??? populate ddl's with columns from the DB ???--%>
                            
                            <div id="cr" runat="server" visible="false">
                                <h3>Select the items to display in the report</h3>
                                <div class="row">
                                    <div class="2u">
                                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="LastName" DataValueField="LastName"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersDBConnectionString %>" SelectCommand="SELECT [LastName], [FirstName], [Title], [Organization], [Email], [Street], [City], [Student], [Faculty], [Zip], [ST] FROM [Contacts]"></asp:SqlDataSource>
                                    </div>
                                    <div class="2u">
                                        <asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList>
                                    </div>
                                    <div class="2u">
                                        <asp:DropDownList ID="DropDownList3" runat="server"></asp:DropDownList>
                                    </div>
                                    <div class="2u">
                                        <asp:DropDownList ID="DropDownList4" runat="server"></asp:DropDownList>
                                    </div>
                                    <div class="2u">
                                        <asp:DropDownList ID="DropDownList5" runat="server"></asp:DropDownList>
                                    </div>
                                    <div class="2u">
                                        <asp:DropDownList ID="DropDownList6" runat="server"></asp:DropDownList>                                        
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="12u">
                                        <asp:Button ID="Button1" runat="server" Text="Run Report" CssClass="button" />
                                    </div>
                                </div>
                            </div>

                            <!-- Gridview  -->
                            <%--???  do we need a seperate gridview for each report or can we alter what the GV displays based on the report selected ???--%>

                            <div class="row">
                                <asp:GridView ID="GridView1" runat="server" Visible="False" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                                        <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                                        <asp:BoundField DataField="Organization" HeaderText="Organization" SortExpression="Organization" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersDBConnectionString %>" SelectCommand="SELECT [FirstName], [LastName], [Title], [Organization] FROM [Contacts]"></asp:SqlDataSource>
                            </div>
                            
                            <div class="row">
                                <div class="6u">
                                    
                                </div>
                                <div class="6u">
                                    
                                </div>
                            </div>

                            <div class="row">
                                <div class="6u">

                                </div>
                                <div class="6u">

                                </div>
                            </div>
                           
                        </div>
                    </div>
                </div>
            </div>
        </article>
    </div>
</asp:Content>


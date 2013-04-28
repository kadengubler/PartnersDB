<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" maintainScrollPositionOnPostBack="true"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">

    <!-- Page Nav -->
    <nav id="pgnav">
        <ul>
            <li><a href="#top">Top |</a></li>            
            <li><a href="#search">Search</a></li>
        </ul>
    </nav>

    <!-- Home -->
    <div class="wrapper wrapper-style1 wrapper-first">
        <article class="5grid-layout" id="top">
            <div class="row">
                <div class="4u">
                    <span class="me image image-full">
                        <img src="images/logo.jpg" alt="logo" /></span>
                </div>
                <div class="8u">
                    <header>
                        <h1>Welcome to
                            <br />
                            <br />
                            <strong>Partners In Business</strong>.</h1>
                    </header>
                    <p>This site provides access to the Partners database</p>
                    <a href="Documentation.aspx" class="button button-big">Need Help?</a>
                </div>
            </div>
        </article>
    </div>

    <!-- SqlDataSource -->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" SelectCommand="usp_QuickSearch" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="searchTerm" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" SelectCommand="SELECT [LastName], [FirstName], [Organization] FROM [Contacts]"></asp:SqlDataSource>



    <!-- Search -->
    <!-- The following controls will allow the user to quickly perform a search of the database and return the results -->
    <div class="wrapper wrapper-style2">
        <article class="5grid-layout" id="search">
            <header>
                <h2>Search</h2>
                <span>Search the Partners In Business Database</span>
            </header>
            <div class="5grid">
                <div class="row">
                    <div class="12u">
                        <div class="5grid">
                            <div class="row">
                                <div class="12u">
                                    <asp:TextBox ID="TextBox1" placeholder="Search" runat="server"></asp:TextBox>
                                </div>
                                <div class="12u">
                                    <asp:Button ID="btn_search" CssClass="button" runat="server" Text="Search" OnClick="btn_search_Click" />
                                </div>

                                <asp:GridView ID="gv_search" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Visible="False">
                                    <Columns>
                                        <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                                        <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                                        <asp:BoundField DataField="Organization" HeaderText="Organization" SortExpression="Organization" />
                                    </Columns>
                                    <HeaderStyle Font-Underline="true" Font-Size="Larger" HorizontalAlign="Center" VerticalAlign="Middle" />
                                    </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </article>
    </div>


<%--  
      

    <div class="wrapper wrapper-style2">
        <article class="5grid-layout" id="Article1">
            <header>
                <h2></h2>
                <span></span>
            </header>
            <div class="5grid">
                <div class="row">
                    <div class="12u">
                        <div class="5grid">
                            <div class="row">
                                <div class="12u">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </article>
    </div>


--%>

</asp:Content>
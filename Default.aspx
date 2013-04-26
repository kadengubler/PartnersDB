<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" maintainScrollPositionOnPostBack="true"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">

    <!-- Page Nav -->
    <nav id="pgnav">
        <ul>
            <li><a href="#top">Top |</a></li>            
            <li><a href="#search">Search</a></li>
            <%--<li><a href="#quickreports">Quick Reports |</a></li>
            <li><a href="#regsearch">Regular Search</a></li>--%>
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
        <article id="search">
            <header>
                <h2>Search</h2>
                <span>Search the Partners In Business Database</span>
            </header>
            <div class="5grid">
                <div class="row">
                    <div class="12u">
                        <div class="5grid">
                            <div class="row">
                                <div class="3u"></div>
                                <div class="6u">
                                    <asp:TextBox ID="TextBox1" placeholder="Search" runat="server"></asp:TextBox>
                                </div>                                
                                <div class="3u"></div>
                            </div>
                            <div class="row">
                                <div class="12u">
                                    <asp:Button ID="btn_search" CssClass="button" runat="server" Text="Search" OnClick="btn_search_Click"  />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:GridView ID="gv_search" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Visible="False">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="Organization" HeaderText="Organization" SortExpression="Organization" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            
            <asp:GridView ID="gv_detail" runat="server" Visible="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            </article>
        </div>

    <!-- Reports -->
    <%--<div class="wrapper wrapper-style2">
        <article id="quickreports">
            <header>
                <h2>Quick Reports</h2>
                <span>Choose a category to run report</span>
            </header>
            <div class="5grid-layout">
                <div class="row">
                    <div class="3u"></div>
                    <div class="6u">
                        <!-- ***connect source to conferences DB*** -->
                        <asp:DropDownList ID="conference" runat="server">
                            <asp:ListItem>--Please select a conference--</asp:ListItem>
                            <asp:ListItem>Crossroads</asp:ListItem>
                            <asp:ListItem>Operational Excellence</asp:ListItem>
                            <asp:ListItem>Accounting</asp:ListItem>
                            <asp:ListItem>Information Technology</asp:ListItem>
                            <asp:ListItem>Leadership</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="3u"></div>
                </div>
                <div class="row">
                    <div class="4u">
                        <section class="box box-style1">
                            <span class="image image-centered">
                                <img src="images/work01.png" alt="" /></span>
                            <h3>Conference Feedback</h3>
                            <p>This report is used to display the feedback from past conferences.</p>
                        </section>
                    </div>
                    <div class="4u">
                        <section class="box box-style1">
                            <span class="image image-centered">
                                <img src="images/work02.png" alt="" /></span>
                            <h3>Attendee Demographics</h3>
                            <p>This report is used to display the demographics from past conferences.</p>
                        </section>
                    </div>
                    <div class="4u">
                        <section class="box box-style1">
                            <span class="image image-centered">
                                <img src="images/work03.png" alt="" /></span>
                            <h3>Attendee List</h3>
                            <p>This report is used to display current attendee list for the selected conference.</p>
                        </section>
                    </div>
                </div>
            </div>
            <footer>
                <p>Can't find the report you need?</p>
                <a href="#custom_report" class="button button-big">Run a custom report</a>
            </footer>
        </article>
    </div>--%>


    <!-- Search -->
    <!-- The following controls will allow the user to perform a regular search of the database and return the results -->
    <%--<div class="wrapper wrapper-style2">
        <article id="regsearch">
            <header>
                <h2>Search</h2>
                <span>Run a search of the Partners In Business Database</span>
            </header>
            <div class="5grid">
                <div class="row">
                    <div class="12u">
                        <div class="5grid">
                            <div class="row">
                                <div class="2u"></div>
                                <div class="2u">
                                    <asp:TextBox ID="txt_fName" placeholder="First Name" runat="server"></asp:TextBox>
                                </div>
                                <div class="2u">
                                    <asp:TextBox ID="txt_lName" runat="server" placeholder="Last Name"></asp:TextBox>
                                </div>
                                <div class="2u">
                                    <asp:TextBox ID="txt_org" runat="server" placeholder="Organization"></asp:TextBox>
                                </div>
                                <div class="2u">
                                    <asp:TextBox ID="txt_partNum" runat="server" placeholder="Partner Number"></asp:TextBox>
                                </div>
                                <div class="2u"></div>
                            </div>
                            <div class="row">
                                <div class="12u">
                                    <asp:Button ID="search" CssClass="button" runat="server" Text="Search" OnClick="search_Click"  />
                                    <asp:Button ID="clear" CssClass="button button-alt" runat="server" Text="Clear" OnClick="clear_Click"  />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <asp:GridView ID="gv_search" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Visible="False">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="Organization" HeaderText="Organization" SortExpression="Organization" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>            
            
            <asp:GridView ID="gv_detail" runat="server" Visible="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </article>
    </div>--%>


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
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Conferences.aspx.cs" Inherits="Conferences" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">

    <!-- Page Nav -->
    <nav id="pgnav">
        <ul>
            <li><a href="#top">Top |</a></li>
            <li><a href="#dates">Conference Dates |</a></li>
            <li><a href="#sponsors">Conference Sponsors</a></li>
        </ul>
    </nav>

    <!-- Home -->
    <div class="wrapper wrapper-style1 wrapper-first">
        <article class="5grid-layout" id="top">
            <div class="row">
                <div class="4u">
                    <span class="me image image-full">
                        <img src="images/logo.jpg" alt="logo"></span>
                </div>
                <div class="8u">
                    <header>
                        <h1><strong>Conferences</strong>.</h1>
                    </header>
                    <p>Information for each Partners In Business conference.</p>
                    <a href="Documentation.aspx" class="button button-big">Need Help?</a>
                </div>
            </div>
        </article>
    </div>

    <!-- Conference Dates -->
    <div class="wrapper wrapper-style2">
        <article id="dates">
            <header>
                <h2>Conference Dates</h2>
                <span>Select a conference to display the date of the conference</span>
            </header>
            <div class="5grid-layout">
                <div class="row">
                    <div class="12u">

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>"
                            SelectCommand="SELECT [ConferenceName] + ' ' + [StartingDate] + '-' + [EndingDate] FROM [Conference] WHERE ConferenceTitle = @ConferenceTitle">


                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddl_Conference" Name="ConferenceTitle" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>"
                            SelectCommand="SELECT DISTINCT [ConferenceName] + ' ' + [StartingDate] + '-' + [EndingDate] AS ConfNameDate FROM [Conference] WHERE Datepart(YY,StartingDate) >= Datepart(YY,GETDATE())"></asp:SqlDataSource>
                        <br />

                        <asp:DropDownList ID="ddl_Conference" runat="server" OnSelectedIndexChanged="ddl_Conference_SelectedIndexChanged" AutoPostBack="True"
                            DataSourceID="SqlDataSource1" DataTextField="ConferenceName" DataValueField="ConferenceName">
                        </asp:DropDownList>
                        <br />
                        <br />
                        <asp:Label ID="conferenceDate" runat="server" Visible="false" Font-Size="X-Large" Font-Bold="True"></asp:Label>

                    </div>
                </div>

            </div>
        </article>
    </div>


    <!-- Conference Sponsors -->
    <div class="wrapper wrapper-style3">
        <article id="sponsors">
            <header>
                <h2>Conference Sponsors</h2>
                <span></span>
            </header>
            <div class="5grid-layout">
                <div class="row">
                    <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem Value="false">Sponsors</asp:ListItem>
                        <asp:ListItem Value="true">CoSponsors</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>


            <asp:SqlDataSource ID="SqlDataSourceSponsors" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" SelectCommand="SELECT Sponsor.Cosponsor, Sponsor.Ranking, Contacts.FirstName, Contacts.LastName, Contacts.Email, Contacts.Title, Organization.OrgName FROM Sponsor INNER JOIN Contacts ON Sponsor.ContactID = Contacts.ContactID INNER JOIN Organization ON Contacts.OrgID = Organization.OrgID WHERE Sponsor.Cosponsor = @CoSponsor" DeleteCommand="DELETE FROM Sponsor" InsertCommand="INSERT INTO Sponsor(SponsorID, ContactID, Cosponsor, Ranking) VALUES (,,,)" UpdateCommand="UPDATE Sponsor SET FROM Sponsor INNER JOIN Contacts ON Sponsor.ContactID = Contacts.ContactID INNER JOIN Phone ON Contacts.ContactID = Phone.ContactID INNER JOIN Organization ON Contacts.OrgID = Organization.OrgID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="CoSponsor" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>


            <br />

            <div align="middle">
                <div id="gvSponsors" runat="server" visible="false" style="border: solid 3px black; background-color: white; width: 1200px;">
                    <div class="5grid-layout">
                        <div class="row">
                            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSourceSponsors" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                    <asp:CheckBoxField DataField="Cosponsor" HeaderText="Cosponsor" SortExpression="Cosponsor" />
                                    <asp:BoundField DataField="Ranking" HeaderText="Ranking" SortExpression="Ranking" />
                                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                                    <asp:BoundField DataField="OrgName" HeaderText="Organization" SortExpression="OrgName" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>





            <footer>
                <asp:Button ID="btnAddSponsor" runat="server" class="button button-big" Text="Add a new (Co)Sponsor" OnClick="btnAddSponsor_Click" />
            </footer>

        </article>
    </div>

    <asp:DetailsView ID="dtvAddSponsor" runat="server" Height="50px" Width="125px" AutoGenerateRows="false" DataKeyNames="SponsorID" DefaultMode="Insert" OnItemInserted="dtvAddSponsor_ItemInserted" OnItemCommand="dtvAddSponsor_ItemCommand" DataSourceID="SqlDataSourceSponsors">
        <Fields>
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>








    <!-- Other -->
    <%--<div class="wrapper wrapper-style4">
        <article id="other">
            <header>
                <h2>Other</h2>
                <span>Choose a category to run report</span>
            </header>
            <div class="5grid-layout">
                <div class="row">
                    <div class="4u">
                        <section class="box box-style1">
                            <span class="image image-centered">
                                <img src="images/work01.png" alt=""></span>
                            <h3>Conference Feedback</h3>
                            <p>This report is used to display the feedback from past conferences.</p>
                        </section>
                    </div>
                    <div class="4u">
                        <section class="box box-style1">
                            <span class="image image-centered">
                                <img src="images/work02.png" alt=""></span>
                            <h3>Attendee Demographics</h3>
                            <p>This report is used to display the demographics from past conferences.</p>
                        </section>
                    </div>
                    <div class="4u">
                        <section class="box box-style1">
                            <span class="image image-centered">
                                <img src="images/work03.png" alt=""></span>
                            <h3>Attendee List</h3>
                            <p>This report is used to display the attendee lists from past conferences.</p>
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
</asp:Content>


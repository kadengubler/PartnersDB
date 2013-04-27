<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Conferences.aspx.cs" Inherits="Conferences" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">

    <!-- Page Nav -->
    <nav id="pgnav">
        <ul>
            <li><a href="#top">Top |</a></li>
            <li><a href="#dates">Conference Dates |</a></li>
            <li><a href="#sponsors">Conference Sponsors |</a></li>
            <%--<li><a href="#acct">Accounting |</a></li>
            <li><a href="#it">Information Technology |</a></li>
            <li><a href="#lead">Leadership |</a></li>
            <li><a href="#other">Other</a></li>--%>
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

                        <asp:SqlDataSource ID="SqlDataSourceDates" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" SelectCommand="SELECT [StartingDate], [EndingDate], [ConferenceTitle] FROM [Conference] WHERE ConferenceTitle = @ConferenceTitle">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddl_Conference" Name="ConferenceTitle" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <asp:SqlDataSource ID="SqlDataSourceDdlConference" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" SelectCommand="SELECT DISTINCT [ConferenceTitle] FROM [Conference]"></asp:SqlDataSource>

                        <asp:DropDownList ID="ddl_Conference" runat="server" OnSelectedIndexChanged="ddl_Conference_SelectedIndexChanged" AutoPostBack="True" DataSourceID="SqlDataSourceDdlConference" DataTextField="ConferenceTitle" DataValueField="ConferenceTitle">
                        </asp:DropDownList>
                        <h2>
                            <asp:Label ID="lblConferenceDate" runat="server" Text="Label" Visible="false"></asp:Label></h2>
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
                <%--<span>Choose a category to run report</span>--%>
            </header>
            <div class="5grid-layout">
                <div class="row">
                    <div class="6u">
                        <asp:LinkButton ID="btnSponsor" runat="server" OnClick="btnSponsor_Click">                    
                        <section class="box box-style1">
                            <span class="image image-centered">
                                <img src="images/work03.png" alt="" /></span>
                            <h3>Sponsors</h3>
                            <p></p>
                        </section>
                        </asp:LinkButton> 
                    </div>
                    <div class="6u">
                        <asp:LinkButton ID="btnCoSponsor" runat="server" OnClick="btnCoSponsor_Click">
                        <section class="box box-style1">
                            <span class="image image-centered">
                                <img src="images/work02.png" alt="" /></span>
                            <h3>Co-Sponsors</h3>
                            <p></p>
                        </section>
                        </asp:LinkButton>
                    </div>                    
                </div>
            </div>
            <div class="5grid-layout">
                <div class="row">
                    <div class="12u">
                        <asp:SqlDataSource ID="SqlDataSourceSponsors" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" DeleteCommand="DELETE FROM Sponsor FROM Sponsor INNER JOIN Contacts ON Sponsor.ContactID = Contacts.ContactID INNER JOIN Organization ON Contacts.OrgID = Organization.OrgID INNER JOIN Phone ON Contacts.ContactID = Phone.ContactID INNER JOIN Phone AS Phone_1 ON Contacts.ContactID = Phone_1.ContactID WHERE (Sponsor.SponsorID = @SponsorID)" InsertCommand="INSERT INTO [Sponsor] ([ContactID], [Cosponsor], [Ranking]) VALUES (@ContactID, @Cosponsor, @Ranking)" SelectCommand="SELECT Sponsor.Cosponsor, Contacts.LastName, Contacts.FirstName, Contacts.Title, Contacts.OrgID, Contacts.Email, Phone.AreaCode, Phone.Exchange, Phone.SubscriberNumber, Organization.OrgName FROM Sponsor INNER JOIN Contacts ON Sponsor.ContactID = Contacts.ContactID INNER JOIN Phone ON Contacts.ContactID = Phone.ContactID INNER JOIN Organization ON Contacts.OrgID = Organization.OrgID" UpdateCommand="UPDATE Sponsor SET ContactID = @ContactID, Cosponsor = @Cosponsor, Ranking = @Ranking FROM Sponsor INNER JOIN Contacts ON Sponsor.ContactID = Contacts.ContactID INNER JOIN Organization ON Contacts.OrgID = Organization.OrgID INNER JOIN Phone ON Contacts.ContactID = Phone.ContactID WHERE (Sponsor.SponsorID = @SponsorID)">
                    <DeleteParameters>
                        <asp:Parameter Name="SponsorID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ContactID" Type="Int32" />
                        <asp:Parameter Name="Cosponsor" Type="Boolean" />
                        <asp:Parameter Name="Ranking" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ContactID" Type="Int32" />
                        <asp:Parameter Name="Cosponsor" Type="Boolean" />
                        <asp:Parameter Name="Ranking" Type="String" />
                        <asp:Parameter Name="SponsorID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>  
                                            
                        <asp:GridView ID="gvSponsor" runat="server" DataSourceID="SqlDataSourceSponsors" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False">
                            <Columns>
                                <asp:CheckBoxField DataField="Cosponsor" HeaderText="Cosponsor" SortExpression="Cosponsor" />                              
                                
                                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                                <asp:BoundField DataField="OrgID" HeaderText="OrgID" SortExpression="OrgID" />
                                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                <asp:BoundField DataField="AreaCode" HeaderText="AreaCode" SortExpression="AreaCode" />
                                <asp:BoundField DataField="Exchange" HeaderText="Exchange" SortExpression="Exchange" />
                                <asp:BoundField DataField="SubscriberNumber" HeaderText="SubscriberNumber" SortExpression="SubscriberNumber" />
                                <asp:BoundField DataField="OrgName" HeaderText="OrgName" SortExpression="OrgName" />
                            </Columns>
                        </asp:GridView>
                        </div>
                    </div>
                </div>
            <footer>
                <%--<p>Can't find the report you need?</p>--%>
                <asp:Button ID="Button1" class="button button-big" runat="server" Text="Add a new Sponsor or CoSponsor" OnClick="Button1_Click" />                
                
                <asp:DetailsView ID="dtvSponsors" runat="server" Height="50px" Width="125px" Visible="False" AutoGenerateRows="False" DataSourceID="SqlDataSourceSponsors">
                    <Fields>
                        <asp:CheckBoxField DataField="Cosponsor" HeaderText="Cosponsor" SortExpression="Cosponsor" />
                        <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                        <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                        <asp:BoundField DataField="OrgID" HeaderText="OrgID" SortExpression="OrgID" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        <asp:BoundField DataField="AreaCode" HeaderText="AreaCode" SortExpression="AreaCode" />
                        <asp:BoundField DataField="Exchange" HeaderText="Exchange" SortExpression="Exchange" />
                        <asp:BoundField DataField="SubscriberNumber" HeaderText="SubscriberNumber" SortExpression="SubscriberNumber" />
                        <asp:BoundField DataField="OrgName" HeaderText="OrgName" SortExpression="OrgName" />
                    </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
            </footer>
        </article>
    </div>

    <!-- Accounting -->
    <%--<div class="wrapper wrapper-style1">
        <article id="acct">
            <header>
                <h2>Accounting</h2>
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

    <!-- Information Technology -->
    <%--<div class="wrapper wrapper-style2">
        <article id="it">
            <header>
                <h2>Information Technology</h2>
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

    <!-- Leadership -->
    <%--<div class="wrapper wrapper-style3">
        <article id="lead">
            <header>
                <h2>Leadership</h2>
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


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
                        <img src="images/logo.jpg" alt="logo" /></span>
                </div>
                <div class="8u">
                    <header>
                        <h1><strong>Conferences</strong></h1>
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
                <%--<span>Select a conference to display the date of the conference</span>--%>
            </header>
            <div class="5grid-layout">
                <div class="row">
                    <div class="12u">
                        <asp:SqlDataSource ID="SqlConferenceDates" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" SelectCommand="SELECT ConferenceName, StartingDate, TotalDays FROM Conference WHERE (StartingDate &lt; GETDATE())"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSourceDdlConference" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" SelectCommand="SELECT DISTINCT [ConferenceTitle] FROM [Conference]"></asp:SqlDataSource>
                        <%--<asp:DropDownList ID="ddl_Conference" runat="server" OnSelectedIndexChanged="ddl_Conference_SelectedIndexChanged" AutoPostBack="True" DataSourceID="SqlDataSourceDdlConference" DataTextField="ConferenceTitle" DataValueField="ConferenceTitle"></asp:DropDownList>--%>
                        <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" SelectCommand="SELECT ConferenceID, [ConferenceName] + ' ' + replace(CONVERT(varchar(10),[StartingDate],102),'.','/') + '-' + replace(CONVERT(varchar(10),[EndingDate],102),'.','/') AS ConfNameDate FROM [Conference] WHERE Datepart(YY,StartingDate) >= Datepart(YY,GETDATE())"></asp:SqlDataSource>--%>
                        
                        <asp:GridView ID="gvConferenceDates" runat="server" DataSourceID="SqlConferenceDates" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="ConferenceName" HeaderText="Conference Name" SortExpression="ConferenceName" />
                                <asp:BoundField DataField="StartingDate" HeaderText="Starting Date" SortExpression="StartingDate" />
                                <asp:BoundField DataField="TotalDays" HeaderText="Total Days" SortExpression="TotalDays" />
                            </Columns>
                        </asp:GridView>

                        <%--<asp:DropDownList ID="ddl_Conference" runat="server" OnSelectedIndexChanged="ddl_Conference_SelectedIndexChanged" AutoPostBack="True"
                            DataSourceID="SqlDataSource1" DataTextField="ConfNameDate" DataValueField="ConferenceID">
                        </asp:DropDownList>--%>
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
                <span>Choose between Sponsor or CoSponsor.</span>
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

            <!-- SQLDataSources -->
            <asp:SqlDataSource ID="SqlDataSourceSponsors" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" SelectCommand="SELECT Sponsor.Cosponsor, Sponsor.Ranking, Organization.OrgName, Contacts.LastName, Contacts.FirstName, Contacts.Title, Contacts.Email FROM Sponsor INNER JOIN Contacts ON Sponsor.ContactID = Contacts.ContactID INNER JOIN Organization ON Contacts.OrgID = Organization.OrgID WHERE (Sponsor.Cosponsor = 'False')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceCoSponsors" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" SelectCommand="SELECT Sponsor.Cosponsor, Sponsor.Ranking, Organization.OrgName, Contacts.LastName, Contacts.FirstName, Contacts.Title, Contacts.Email FROM Sponsor INNER JOIN Contacts ON Sponsor.ContactID = Contacts.ContactID INNER JOIN Organization ON Contacts.OrgID = Organization.OrgID WHERE (Sponsor.Cosponsor = 'True')"></asp:SqlDataSource>


            <div class="5grid-layout">
                <div class="row">
                    <div class="12u">
                        <asp:GridView ID="gvSponsors" runat="server" Visible="False" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSourceSponsors">
                            <Columns>
                                <asp:CheckBoxField DataField="Cosponsor" HeaderText="Cosponsor" SortExpression="Cosponsor" />
                                <asp:BoundField DataField="Ranking" HeaderText="Ranking" SortExpression="Ranking" />
                                <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                                <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                                <asp:BoundField DataField="OrgName" HeaderText="Organization" SortExpression="OrgName" />
                                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            </Columns>
                        </asp:GridView>

                        <asp:GridView ID="gvCoSponsors" runat="server" Visible="false" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSourceCoSponsors">
                            <Columns>
                                <asp:CheckBoxField DataField="Cosponsor" HeaderText="Cosponsor" SortExpression="Cosponsor" />
                                <asp:BoundField DataField="Ranking" HeaderText="Ranking" SortExpression="Ranking" />
                                <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                                <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                                <asp:BoundField DataField="OrgName" HeaderText="Organization" SortExpression="OrgName" />
                                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </article>
    </div>
</asp:Content>


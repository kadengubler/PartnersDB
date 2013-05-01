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

<%--<<<<<<< HEAD
                        <asp:SqlDataSource ID="SqlDataSourceDates" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" SelectCommand="SELECT [StartingDate], [EndingDate], [ConferenceTitle] FROM [Conference] WHERE ConferenceTitle = @ConferenceTitle">
=======--%>
<%--                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>"
                            SelectCommand="SELECT [ConferenceName] + ' ' + [StartingDate] + '-' + [EndingDate] FROM [Conference] WHERE ConferenceTitle = @ConferenceTitle">


<%-->>>>>>> kaden--%>
<%--                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddl_Conference" Name="ConferenceTitle" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>--%>

<%--<<<<<<< HEAD
                        <asp:SqlDataSource ID="SqlDataSourceDdlConference" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" SelectCommand="SELECT DISTINCT [ConferenceTitle] FROM [Conference]"></asp:SqlDataSource>

                        <asp:DropDownList ID="ddl_Conference" runat="server" OnSelectedIndexChanged="ddl_Conference_SelectedIndexChanged" AutoPostBack="True" DataSourceID="SqlDataSourceDdlConference" DataTextField="ConferenceTitle" DataValueField="ConferenceTitle">
                        </asp:DropDownList>
                        <h2>
                            <asp:Label ID="lblConferenceDate" runat="server" Text="Label" Visible="false"></asp:Label></h2>
=======--%>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>"
                            SelectCommand="SELECT ConferenceID, [ConferenceName] + ' ' + replace(CONVERT(varchar(10),[StartingDate],102),'.','/') + '-' + replace(CONVERT(varchar(10),[EndingDate],102),'.','/') AS ConfNameDate FROM [Conference] WHERE Datepart(YY,StartingDate) >= Datepart(YY,GETDATE())"></asp:SqlDataSource>
                        <br />

                        <asp:DropDownList ID="ddl_Conference" runat="server" OnSelectedIndexChanged="ddl_Conference_SelectedIndexChanged" AutoPostBack="True"
                            DataSourceID="SqlDataSource1" DataTextField="ConfNameDate" DataValueField="ConferenceID">
                        </asp:DropDownList>
                        <br />
                        <br />
                        <asp:Label ID="conferenceDate" runat="server" Visible="false" Font-Size="X-Large" Font-Bold="True"></asp:Label>

<%-->>>>>>> kaden--%>
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
            </footer>
        </article>
    </div>


            <%--<asp:SqlDataSource ID="SqlDataSourceSponsors" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" SelectCommand="SELECT Contacts.ContactID, Sponsor.SponsorID, Sponsor.Cosponsor, Sponsor.Ranking, Contacts.FirstName, Contacts.LastName, Contacts.Email, Contacts.Title, Organization.OrgName FROM Sponsor INNER JOIN Contacts ON Sponsor.ContactID = Contacts.ContactID INNER JOIN Organization ON Contacts.OrgID = Organization.OrgID WHERE Sponsor.Cosponsor = @CoSponsor" DeleteCommand="DELETE FROM Sponsor" InsertCommand="INSERT INTO Sponsor(SponsorID, ContactID, Cosponsor, Ranking) VALUES (,,,)" UpdateCommand="usp_UpdateSponsors" UpdateCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="CoSponsor" PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Ranking" Type="String" />
                	<asp:Parameter Name="CoSponsor" Type="Boolean" />
    	            <asp:Parameter Name="FirstName" Type="String" />
	                <asp:Parameter Name="LastName" Type="String" />
                	<asp:Parameter Name="Email" Type="String" />
    	            <asp:Parameter Name="Title" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>--%>


            <br />

            <div align="middle">
                <div id="gvSponsors" runat="server" visible="true" style="border: solid 3px black; background-color: white; width: 1200px;">
                    <div class="5grid-layout">
                        <div class="row">
                            <asp:GridView ID="GridView1" runat="server" DataKeyNames="ContactID" DataSourceID="SqlDataSourceSponsors" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                    <asp:BoundField DataField="ContactID" HeaderText="ContactID" InsertVisible="False" ReadOnly="True" SortExpression="ContactID" Visible="False" />
                                    <asp:BoundField DataField="SponsorID" HeaderText="SponsorID" InsertVisible="False" ReadOnly="True" SortExpression="SponsorID" Visible="False" />
                                    <asp:CheckBoxField DataField="Cosponsor" HeaderText="Cosponsor" SortExpression="Cosponsor" ReadOnly="false"/>
                                    <asp:BoundField DataField="Ranking" HeaderText="Ranking" SortExpression="Ranking" ReadOnly="false"/>
                                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" ReadOnly="false" />
                                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" ReadOnly="false"/>
                                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" ReadOnly="false"/>
                                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" ReadOnly="false"/>
                                    <asp:BoundField DataField="OrgName" HeaderText="OrgName" SortExpression="OrgName" ReadOnly="false"/>                                    
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>





            <footer>
                <asp:Button ID="btnAddSponsor" runat="server" class="button button-big" Text="Add a new (Co)Sponsor" OnClick="btnAddSponsor_Click" />
            </footer>


    <asp:DetailsView ID="dtvAddSponsor" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="SponsorID" DefaultMode="Insert" OnItemInserted="dtvAddSponsor_ItemInserted" OnItemCommand="dtvAddSponsor_ItemCommand" DataSourceID="SqlDataSourceSponsors">
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


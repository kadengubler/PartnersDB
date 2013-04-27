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
            <li><a href="#acct">Accounting |</a></li>
            <li><a href="#it">Information Technology |</a></li>
            <li><a href="#lead">Leadership |</a></li>
            <li><a href="#other">Other</a></li>
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
                        
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" SelectCommand="SELECT [StartingDate], [EndingDate], [ConferenceTitle] FROM [Conference] WHERE ConferenceTitle = @ConferenceTitle">
                        
                            
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddl_Conference" Name="ConferenceTitle" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" SelectCommand="SELECT DISTINCT [ConferenceTitle] FROM [Conference]"></asp:SqlDataSource>
                        <br />

                        <asp:DropDownList ID="ddl_Conference" runat="server" OnSelectedIndexChanged="ddl_Conference_SelectedIndexChanged" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="ConferenceTitle" DataValueField="ConferenceTitle">                            
                        </asp:DropDownList>
                        <br />
                        <br />
                        <h2><asp:Label ID="conferenceDate" runat="server" Text="Label" Visible="false"></asp:Label></h2>
                            
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
                    <div class="6u">
                        <asp:LinkButton ID="LinkButton1" runat="server">
                        <section class="box box-style1">
                            <span class="image image-centered">
                                <img src="images/work03.png" alt="" /></span>
                            <h3>Sponsors</h3>                            
                        </section>
                        </asp:LinkButton>
                    </div>
                    
                    <div class="6u">
                        <asp:LinkButton ID="LinkButton2" runat="server">
                        <section class="box box-style1">
                            <span class="image image-centered">
                                <img src="images/work02.png" alt="" /></span>
                            <h3>CoSponsors</h3>
                        </section>
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
            <footer>
                <asp:Button ID="Button1" runat="server" class="button button-big" Text="Add a new (Co)Sponsor" />                
            </footer>

            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" DeleteCommand="DELETE FROM [Sponsor] WHERE [SponsorID] = @SponsorID" InsertCommand="INSERT INTO [Sponsor] ([ContactID], [Cosponsor], [Ranking]) VALUES (@ContactID, @Cosponsor, @Ranking)" SelectCommand="SELECT [SponsorID], [ContactID], [Cosponsor], [Ranking] FROM [Sponsor]" UpdateCommand="UPDATE [Sponsor] SET [ContactID] = @ContactID, [Cosponsor] = @Cosponsor, [Ranking] = @Ranking WHERE [SponsorID] = @SponsorID">
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
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1"></asp:GridView>

        </article>
    </div>



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


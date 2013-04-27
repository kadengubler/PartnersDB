<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StatusBoard.aspx.cs" Inherits="StatusBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">

    <!-- Page Nav -->
    <nav id="pgnav">
        <ul>
            <li><a href="Reports.aspx">Reports Main |</a></li>
            <li><a href="StatusBoard.aspx">Status Board |</a></li>            
            <li><a href="Partnerships.aspx">Partnerships |</a></li>
            <li><a href="AttendeeList.aspx">Attendee List |</a></li>
            <li><a href="Itinerary.aspx">Itinerary</a></li>
        </ul>
    </nav>

    <br />

    <div class="wrapper wrapper-style2">
        <article class="5grid-layout" id="statusBoard">
            <header>
                <h2>Status Board</h2>
                <span>Use this board to track communication with speakers.</span>
            </header>
            <div class="5grid">
                <div class="row">
                    <div class="12u">
                        <div class="5grid">
                            <div class="row">
                                <div class="12u">
                                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="ConfYear" DataValueField="ConferenceID">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" SelectCommand="SELECT [ConferenceID], [ConferenceTitle] + ' ' + DATENAME(yy,[StartingDate]) AS ConfYear FROM [Conference]" DeleteCommand="DELETE FROM [Speakers] WHERE [SpeakerID] = @SpeakerID" InsertCommand="INSERT INTO [Speakers] ([SpeakerID], [ContactID], [ConferenceID], [SpeakerStatus], [Picture], [Bio], [Summary], [Slides], [Travel], [Hotel]) VALUES (@SpeakerID, @ContactID, @ConferenceID, @SpeakerStatus, @Picture, @Bio, @Summary, @Slides, @Travel, @Hotel)">
                                            <DeleteParameters>
                                                <asp:Parameter Name="SpeakerID" Type="Int32" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="SpeakerID" Type="Int32" />
                                                <asp:Parameter Name="ContactID" Type="Int32" />
                                                <asp:Parameter Name="ConferenceID" Type="Int32" />
                                                <asp:Parameter Name="SpeakerStatus" Type="String" />
                                                <asp:Parameter Name="Picture" Type="Boolean" />
                                                <asp:Parameter Name="Bio" Type="Boolean" />
                                                <asp:Parameter Name="Summary" Type="Boolean" />
                                                <asp:Parameter Name="Slides" Type="Boolean" />
                                                <asp:Parameter Name="Travel" Type="Boolean" />
                                                <asp:Parameter Name="Hotel" Type="Boolean" />
                                            </InsertParameters>
                                        </asp:SqlDataSource>

                                    </div>
                                    <asp:GridView ID="GridView1" runat="server" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
                                        <Columns>
                                            <asp:CommandField ShowEditButton="True" />
                                            <asp:BoundField DataField="Conference" HeaderText="Conference" ReadOnly="True" SortExpression="Conference" />
                                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ReadOnly="True" />
                                            <asp:BoundField DataField="SpeakerStatus" HeaderText="SpeakerStatus" SortExpression="SpeakerStatus" />
                                            <asp:CheckBoxField DataField="Picture" HeaderText="Picture" SortExpression="Picture" />
                                            <asp:CheckBoxField DataField="Bio" HeaderText="Bio" SortExpression="Bio" />
                                            <asp:CheckBoxField DataField="Summary" HeaderText="Summary" SortExpression="Summary" />
                                            <asp:CheckBoxField DataField="Slides" HeaderText="Slides" SortExpression="Slides" />
                                            <asp:CheckBoxField DataField="Travel" HeaderText="Travel" SortExpression="Travel" />
                                        </Columns>

<PagerStyle CssClass="pgr"></PagerStyle>
                                    </asp:GridView>
                                    <asp:GridView ID="GridView2" runat="server">
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" SelectCommandType="StoredProcedure" SelectCommand="usp_StatusBoard" UpdateCommand="UPDATE [Speakers] SET [ContactID] = @ContactID, [ConferenceID] = @ConferenceID, [SpeakerStatus] = @SpeakerStatus, [Picture] = @Picture, [Bio] = @Bio, [Summary] = @Summary, [Slides] = @Slides, [Travel] = @Travel, [Hotel] = @Hotel WHERE [SpeakerID] = @SpeakerID" DeleteCommand="DELETE FROM [Speakers] WHERE [SpeakerID] = @SpeakerID" InsertCommand="INSERT INTO [Speakers] ([SpeakerID], [ContactID], [ConferenceID], [SpeakerStatus], [Picture], [Bio], [Summary], [Slides], [Travel], [Hotel]) VALUES (@SpeakerID, @ContactID, @ConferenceID, @SpeakerStatus, @Picture, @Bio, @Summary, @Slides, @Travel, @Hotel)">
                                        <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList1" Name="ConferenceID" PropertyName="SelectedValue" Type="Int32" />
                                        </SelectParameters>
                                        <DeleteParameters>
                                            <asp:Parameter Name="SpeakerID" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="SpeakerID" Type="Int32" />
                                            <asp:Parameter Name="ContactID" Type="Int32" />
                                            <asp:Parameter Name="ConferenceID" Type="Int32" />
                                            <asp:Parameter Name="SpeakerStatus" Type="String" />
                                            <asp:Parameter Name="Picture" Type="Boolean" />
                                            <asp:Parameter Name="Bio" Type="Boolean" />
                                            <asp:Parameter Name="Summary" Type="Boolean" />
                                            <asp:Parameter Name="Slides" Type="Boolean" />
                                            <asp:Parameter Name="Travel" Type="Boolean" />
                                            <asp:Parameter Name="Hotel" Type="Boolean" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="ContactID" Type="Int32" />
                                            <asp:Parameter Name="ConferenceID" Type="Int32" />
                                            <asp:Parameter Name="SpeakerStatus" Type="String" />
                                            <asp:Parameter Name="Picture" Type="Boolean" />
                                            <asp:Parameter Name="Bio" Type="Boolean" />
                                            <asp:Parameter Name="Summary" Type="Boolean" />
                                            <asp:Parameter Name="Slides" Type="Boolean" />
                                            <asp:Parameter Name="Travel" Type="Boolean" />
                                            <asp:Parameter Name="Hotel" Type="Boolean" />
                                            <asp:Parameter Name="SpeakerID" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" SelectCommand="usp_StatusBoard" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList1" Name="ConferenceID" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </article>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Itinerary.aspx.cs" Inherits="Itenerary" %>

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


    <div class="wrapper wrapper-style2">
        <article class="5grid-layout" id="Article1">
            <header>
                <h2>Itenerary</h2>
                <span>This is the itenerary page.</span>
            </header>
            <div class="5grid">
                <div class="row">
                    <div class="12u">
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="ConferenceDay" DataValueField="ConferenceDate" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" SelectCommand="usp_Itinerary" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" DbType="Date" Name="ConferenceDate" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:GridView ID="Gridview1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                            <Columns>
                                <asp:BoundField DataField="TimeSlot" HeaderText="TimeSlot" SortExpression="TimeSlot" />
                                <asp:BoundField DataField="Speaker" HeaderText="Speaker" ReadOnly="True" SortExpression="Speaker" />
                            </Columns>
                        </asp:GridView>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PartnersConnectionString %>" SelectCommand="usp_ConferenceByDay" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </article>
    </div>
</asp:Content>


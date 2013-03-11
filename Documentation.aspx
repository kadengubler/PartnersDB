<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Documentation.aspx.cs" Inherits="Documentation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">

    <!-- Page Nav -->
    <nav id="pgnav">
        <ul>
            <li><a href="#top">Top |</a></li>
            <li><a href="#search">Search |</a></li>
            <li><a href="#asp_doc">ASP.net |</a></li>
            <li><a href="#partners">Partners |</a></li>
            <li><a href="#wiki">Wiki</a></li>
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
                        <h1>Documentation</h1>
                    </header>
                    <p>Below you will find all the documenation associated with the database</p>
                </div>
            </div>
        </article>
    </div>



    <!-- Search -->
    <div class="wrapper wrapper-style2">
        <article id="search">
            <header>
                <h2>Search</h2>
                <span>Search the help documents</span>
            </header>
            <div class="5grid">
                <div class="row">
                    <div class="12u">
                        <div class="5grid">
                            <div class="row">
                                <div class="4u"></div>
                                <div class="4u">
                                    <asp:TextBox ID="TextBox1" placeholder="Search" runat="server"></asp:TextBox>
                                </div>                                
                                <div class="4u"></div>
                            </div>
                            <div class="row">
                                <div class="12u">
                                    <asp:Button ID="btn_search" CssClass="button" runat="server" Text="Search" OnClick="btn_search_Click"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </article>
        </div>



    <!-- Asp.net Documentation -->
    <div class="wrapper wrapper-style2">
        <article class="do-5grid" id="asp_doc">
            <header>
                <h3>Asp.net course info</h3>
                <br />
            </header>
            <h5>Project Requirements</h5>
            <div class="row">
                <a href="Documentation/Project%20Description.txt">Requirements</a>
            </div>
            <br />
            <h5>Project Milestones</h5>
            <div class="row">
                <a href="Documentation/FirstMilestone.htm" target="_blank">First Milestone</a><br />
                <a href="Documentation/SecondMilestone.htm" target="_blank">Second Milestone</a>
            </div>
            <br />


        </article>
    </div>

    <!-- Partners Documentation -->
    <div class="wrapper wrapper-style2">
        <article class="5grid-layout" id="partners">
            <header>
                <h3>Partners Info</h3>
                <br />
            </header>
            <div class="row">
                <a href="Documentation/PartnersRequirements.txt">Partners Requirements</a>
            </div>
        </article>
    </div>

    <!-- Partners Wiki -->
    <div class="wrapper wrapper-style2">
        <article class="5grid-layout" id="wiki">
            <header>
                <h3>Conferenes Wiki</h3>
            </header>
            <div class="row">
                <a href="Documentation/Wiki/FrontPage.html">Documentation/Wiki/FrontPage.html</a><br />
                <a href="Documentation/Wiki/">Documentation/Wiki/</a>
            </div>
        </article>
    </div>

</asp:Content>

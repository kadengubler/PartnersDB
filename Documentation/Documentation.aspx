<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Documentation.aspx.cs" Inherits="Documentation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">

    <!-- Page Nav -->
    <nav id="pgnav">
        <ul>
            <li><a href="#top">Top |</a></li>
            <%--<li><a href="#search">Search |</a></li>--%>
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
                        <img src="../images/logo.jpg" alt="logo" /></span>
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

    <!-- Asp.net Documentation -->
    <div class="wrapper wrapper-style2">
        <article class="do-5grid" id="asp_doc">
            <header>
                <h3>Asp.net course info</h3>
                <br />
            </header>
            <h5>Project Requirements</h5>
            <div class="row">
                <a href="ProjectRequirements.html" target="_blank">Project Requirements</a>
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

</asp:Content>
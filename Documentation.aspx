<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Documentation.aspx.cs" Inherits="Documentation_Documentation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title>Partners In Business</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,600,700" rel="stylesheet" />
		<script src="js/jquery-1.8.3.min.js" ></script>
		<script src="css/5grid/init.js?use=mobile,desktop,1000px" ></script>
		<script src="js/init.js" ></script>
        <noscript>
			<link rel="stylesheet" href="css/5grid/core.css" />
			<link rel="stylesheet" href="css/5grid/core-desktop.css" />
			<link rel="stylesheet" href="css/5grid/core-1200px.css" />
			<link rel="stylesheet" href="css/5grid/core-noscript.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-desktop.css" />
		</noscript>
		<!--[if lte IE 9]><link rel="stylesheet" href="css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="css/ie8.css" /><![endif]-->
		<!--[if lte IE 7]><link rel="stylesheet" href="css/ie7.css" /><![endif]-->
	</head>


        <!-- Nav -->
			<nav id="nav" >
				<ul>
					<li><a href="Default.aspx" >Home</a></li>
                    <li><a href="Registration.aspx" target="_blank">Registration</a></li>
					<li><a href="Reports.aspx" >Reports</a></li>
					<li><a href="Conferences.aspx" >Conferences</a></li>
                    <li><a href="Documentation.aspx" >Help</a></li>
				</ul>
			</nav>

        <!-- Page Nav -->
			<nav id="pgnav" >
				<ul>
					<li><a href="#top" > Top |</a></li>
					<li><a href="#search" > Search |</a></li>
                    <li><a href="#asp_doc" > ASP.net |</a></li>
					<li><a href="#partners" > Partners |</a></li>
					<li><a href="#wiki" > Wiki</a></li>
				</ul>
			</nav>

		<!-- Home -->
			<div class="wrapper wrapper-style1 wrapper-first" >
				<article class="5grid-layout" id="top" >
					<div class="row" >
						<div class="4u" >
							<span class="me image image-full" ><img src="images/logo.jpg" alt="logo" ></span>
						</div>
						<div class="8u" >
							<header>
								<h1>Documentation</h1>
							</header>
							<p>Below you will find all the documenation associated with the database</p>							
						</div>
					</div>
				</article>
			</div>


         <!-- Asp.net Documentation -->
			<div class="wrapper wrapper-style2" >
				<article class="do-5grid" id="asp_doc" >
                    <header>
                        <h3>Asp.net course info</h3><br />
                    </header>   
                        <h5>Project Milestones</h5>                    
                    <div class="row">
                        <a href="Documentation/FirstMilestone.htm" target="_blank" >First Milestone</a><br />
                        <a href="Documentation/SecondMilestone.htm" target="_blank" >Second Milestone</a>
                    </div><br />
                    
                    
				</article>
			</div>

         <!-- Partners Documentation -->
			<div class="wrapper wrapper-style2" >
				<article class="5grid-layout" id="partners" >
                    <header>Partners info</header>
                    <div class="row">
                        
                    </div>
				</article>
			</div>

        <!-- Conference Wiki -->
			<div class="wrapper wrapper-style2" >
				<article class="5grid-layout" id="wiki" >
                    <header>Conference Wiki</header>
                    <div class="row">
                        
                    </div>
				</article>
			</div>


          <!-- Footer -->
			<div class="wrapper wrapper-style4" >
				<article id="footer" >					
					<footer>
						<p id="copyright" >
							© 2013 Partners In Business | Website: <a href="http://partners.usu.edu" >partners.usu.edu</a> | Contact: <a href="mailto:kgubler@gmail.com">Kaden Gubler</a> & <a href="mailto:deja7777@gmail.com">Claiton Weeks</a> | Documentation: <a href="/Documentation.aspx">Click Here</a>
						</p>
					</footer>
				</article>
			</div>



</body>
</html>

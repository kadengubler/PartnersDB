<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_OLD.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
	<body>

		<!-- Nav -->
			<nav id="nav" >
				<ul>
					<li><a href="Default.aspx" >Home</a></li>
                    <li><a href="Registration.aspx" target="_blank" >Registration</a></li>
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
                    <li><a href="#registration" > Quick Registration |</a></li>
					<li><a href="#reports" > Quick Reports |</a></li>
					<li><a href="#conferences" > Conferences</a></li>
				</ul>
			</nav>

		<!-- Home -->
			<div class="wrapper wrapper-style1 wrapper-first" >
				<article class="5grid-layout" id="top" >
					<div class="row" >
						<div class="4u" >
							<span class="me image image-full" ><img src="images/logo.jpg" alt="logo" /></span>
						</div>
						<div class="8u" >
							<header>
								<h1>Welcome to <br /><br /><strong>Partners In Business</strong>.</h1>
							</header>
							<p>This site provides access to the Partners database</p>
							<a href="Documentation.aspx" class="button button-big" >Need Help?</a>
						</div>
					</div>
				</article>
			</div>

        <!-- Search -->
        <!-- The following controls will allow the user to quickly perform a search of the database and return the results -->
			<div class="wrapper wrapper-style2" >
				<article id="search" >
					<header>
						<h2>Quick Search</h2>
						<span>Run a quick search of the Partners In Business Database</span>
					</header>
					<input id="Text1" type="text" placeholder="First Name"/>
                    <input id="Text2" type="text" placeholder="Last Name"/>	
                    <input id="Text3" type="text" placeholder="Organization"/>
                    <input id="Text4" type="text" placeholder="Partner Number"/>
                    <div class="row" >
					    <div class="12u" >
						    <input type="submit" class="button" value="Search" />
							<input type="reset" class="button button-alt" value="Clear" />
						</div>
					</div>		
				</article>
			</div>

        <!-- Quick Registration -->
        <!-- The following controls will allow the user to quickly register an attendee for the conference with minimal information -->
			<div class="wrapper wrapper-style2" >
				<article id="registration" >					
                    <header>
						<h2>Quick Registration</h2>
						<span>Quickly register someone for a Partners In Business Conference</span>
					</header>
					<input id="Text5" type="text" placeholder="First Name"/>
                    <input id="Text6" type="text" placeholder="Last Name"/>	
                    <input id="Text7" type="text" placeholder="Organization"/>
                    <input id="Text8" type="text" placeholder="Title"/>
                    <input id="Text9" type="text" placeholder="Partner Number"/>
                    <div class="row" >
					    <div class="12u" >
						    <input type="submit" class="button" value="Submit" />
							<input type="reset" class="button button-alt" value="Clear" />                            
						</div><br /><br />
                        <div class="row-special" >
                        <a href="Registration.aspx" class="button" >Full Registration</a>
                    </div> 
                                           
					</div>		
				</article>
			</div>

		<!-- Reports -->
			<div class="wrapper wrapper-style2" >
				<article id="reports" >
					<header>
						<h2>Reports</h2>
						<span>Choose a category to run report</span>
					</header>
					<div class="5grid-layout" >
						<div class="row" >
							<div class="4u" >
								<section class="box box-style1" >
									<span class="image image-centered" ><img src="images/work01.png" alt="" /></span>
									<h3>Conference Feedback</h3>
									<p>This report is used to display the feedback from past conferences.</p>
								</section>
							</div>
							<div class="4u" >
								<section class="box box-style1" >
									<span class="image image-centered" ><img src="images/work02.png" alt="" /></span>
									<h3>Attendee Demographics</h3>
									<p>This report is used to display the demographics from past conferences.</p>
								</section>
							</div>
							<div class="4u" >
								<section class="box box-style1" >
									<span class="image image-centered" ><img src="images/work03.png" alt="" /></span>
									<h3>Attendee List</h3>
									<p>This report is used to display the attendee lists from past conferences.</p>
								</section>
							</div>
						</div>
					</div>
					<footer>
						<p>Can't find the report you need?</p>
						<a href="#custom_report" class="button button-big" >Run a custom report</a>
					</footer>
				</article>
			</div>

		<!-- Conferences -->
        <!-- The following will link the user to the conferences page where they can run reports -->
			<div class="wrapper wrapper-style3" >
				<article id="conferences" >
					<header>
						<h2>Conferences</h2>
						<span>Conferences put on by Partners In Business</span>
					</header>
					<div class="5grid-layout" >
						<div class="row" >
							<div class="12u" >
							</div>
						</div>
						<div class="row" >
							<div class="4u" >
								<article class="box box-style2" >
									<a href="Conferences.aspx#crossroads" class="image image-full" ><img src="images/portfolio01.jpg" alt="" /></a>
									<h3><a href="Conferences.aspx#crossroads" >Crossroads</a></h3>
								</article>
							</div>
							<div class="4u" >
								<article class="box box-style2" >
									<a href="Conferences.aspx#oe" class="image image-full" ><img src="images/oe_logo.jpg" alt="" /></a>
									<h3><a href="Conferences.aspx#oe" >Operational Excellence</a></h3>
								</article>
							</div>
							<div class="4u" >
								<article class="box box-style2" >
									<a href="Conferences.aspx#acct" class="image image-full" ><img src="images/acct_logo.jpg" alt="" /></a>
									<h3><a href="Conferences.aspx#acct" >Accounting</a></h3>
								</article>
							</div>
						</div>
						<div class="row" >
							<div class="4u" >
								<article class="box box-style2" >
									<a href="Conferences.aspx#it" class="image image-full" ><img src="images/portfolio04.jpg" alt="" /></a>
									<h3><a href="Conferences.aspx#it" >Information Technology</a></h3>
								</article>
							</div>
							<div class="4u" >
								<article class="box box-style2" >
									<a href="Conferences.aspx#lead" class="image image-full" ><img src="images/portfolio05.jpg" alt="" /></a>
									<h3><a href="Conferences.aspx#lead" >Leadership</a></h3>
								</article>
							</div>
							<div class="4u" >
								<article class="box box-style2" >
									<a href="Conferences.aspx#other" class="image image-full" ><img src="images/portfolio06.jpg" alt="" /></a>
									<h3><a href="Conferences.aspx#other" >Other</a></h3>									
								</article>
							</div>
						</div>
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


	
</body></html>

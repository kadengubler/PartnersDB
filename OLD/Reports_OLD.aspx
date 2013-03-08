<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Reports_OLD.aspx.cs" Inherits="Conferences" %>

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
	<body>

        <!-- Nav -->
			<nav id="nav" >
				<ul>
					<li><a href="Default.aspx" >Home</a></li>
                    <li><a href="Registration.aspx" >Registration</a></li>
					<li><a href="Reports.aspx" >Reports</a></li>
					<li><a href="Conferences.aspx" >Conferences</a></li>
                    <li><a href="Documentation.aspx" >Help</a></li>
				</ul>
			</nav>
		
        <!-- Page Nav -->
			<nav id="pgnav" >
				<ul>
                    <li><a href="#top" >Top |</a></li>
					<li><a href="#crossroads" > Crossroads |</a></li>
					<li><a href="#oe" > Operational Excellence |</a></li>
					<li><a href="#acct" > Accounting |</a></li>
                    <li><a href="#it" > Information Technology |</a></li>
                    <li><a href="#lead" > Leadership |</a></li>
                    <li><a href="#other" > Other</a></li>
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
								<h1><strong>Reports</strong>.</h1>
							</header>
							<p>Partners In Business Reports</p>
							<a href="Documentation.aspx" class="button button-big" >Need Help?</a>
						</div>
					</div>
				</article>
			</div>

		<!-- Crossroads -->
			<div class="wrapper wrapper-style2" >
				<article id="crossroads" >
					<header>
						<h2>Crossroads</h2>
						<span>Choose a category to run report</span>
					</header>
					<div class="5grid-layout" >
						<div class="row" >
							<div class="4u" >
								<section class="box box-style1" >
									<span class="image image-centered" ><img src="images/work01.png" alt="" ></span>
									<h3>Conference Feedback</h3>
									<p>This report is used to display the feedback from past conferences.</p>
								</section>
							</div>
							<div class="4u" >
								<section class="box box-style1" >
									<span class="image image-centered" ><img src="images/work02.png" alt="" ></span>
									<h3>Attendee Demographics</h3>
									<p>This report is used to display the demographics from past conferences.</p>
								</section>
							</div>
							<div class="4u" >
								<section class="box box-style1" >
									<span class="image image-centered" ><img src="images/work03.png" alt="" ></span>
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

        <!-- Operational Excellence -->
			<div class="wrapper wrapper-style3" >
				<article id="oe" >
					<header>
						<h2>Operational Excellence</h2>
						<span>Choose a category to run report</span>
					</header>
					<div class="5grid-layout" >
						<div class="row" >
							<div class="4u" >
								<section class="box box-style1" >
									<span class="image image-centered" ><img src="images/work01.png" alt="" ></span>
									<h3>Conference Feedback</h3>
									<p>This report is used to display the feedback from past conferences.</p>
								</section>
							</div>
							<div class="4u" >
								<section class="box box-style1" >
									<span class="image image-centered" ><img src="images/work02.png" alt="" ></span>
									<h3>Attendee Demographics</h3>
									<p>This report is used to display the demographics from past conferences.</p>
								</section>
							</div>
							<div class="4u" >
								<section class="box box-style1" >
									<span class="image image-centered" ><img src="images/work03.png" alt="" ></span>
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

        <!-- Accounting -->
			<div class="wrapper wrapper-style1" >
				<article id="acct" >
					<header>
						<h2>Accounting</h2>
						<span>Choose a category to run report</span>
					</header>
					<div class="5grid-layout" >
						<div class="row" >
							<div class="4u" >
								<section class="box box-style1" >
									<span class="image image-centered" ><img src="images/work01.png" alt="" ></span>
									<h3>Conference Feedback</h3>
									<p>This report is used to display the feedback from past conferences.</p>
								</section>
							</div>
							<div class="4u" >
								<section class="box box-style1" >
									<span class="image image-centered" ><img src="images/work02.png" alt="" ></span>
									<h3>Attendee Demographics</h3>
									<p>This report is used to display the demographics from past conferences.</p>
								</section>
							</div>
							<div class="4u" >
								<section class="box box-style1" >
									<span class="image image-centered" ><img src="images/work03.png" alt="" ></span>
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

        <!-- Information Technology -->
			<div class="wrapper wrapper-style2" >
				<article id="it" >
					<header>
						<h2>Information Technology</h2>
						<span>Choose a category to run report</span>
					</header>
					<div class="5grid-layout" >
						<div class="row" >
							<div class="4u" >
								<section class="box box-style1" >
									<span class="image image-centered" ><img src="images/work01.png" alt="" ></span>
									<h3>Conference Feedback</h3>
									<p>This report is used to display the feedback from past conferences.</p>
								</section>
							</div>
							<div class="4u" >
								<section class="box box-style1" >
									<span class="image image-centered" ><img src="images/work02.png" alt="" ></span>
									<h3>Attendee Demographics</h3>
									<p>This report is used to display the demographics from past conferences.</p>
								</section>
							</div>
							<div class="4u" >
								<section class="box box-style1" >
									<span class="image image-centered" ><img src="images/work03.png" alt="" ></span>
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

        <!-- Leadership -->
			<div class="wrapper wrapper-style3" >
				<article id="lead" >
					<header>
						<h2>Leadership</h2>
						<span>Choose a category to run report</span>
					</header>
					<div class="5grid-layout" >
						<div class="row" >
							<div class="4u" >
								<section class="box box-style1" >
									<span class="image image-centered" ><img src="images/work01.png" alt="" ></span>
									<h3>Conference Feedback</h3>
									<p>This report is used to display the feedback from past conferences.</p>
								</section>
							</div>
							<div class="4u" >
								<section class="box box-style1" >
									<span class="image image-centered" ><img src="images/work02.png" alt="" ></span>
									<h3>Attendee Demographics</h3>
									<p>This report is used to display the demographics from past conferences.</p>
								</section>
							</div>
							<div class="4u" >
								<section class="box box-style1" >
									<span class="image image-centered" ><img src="images/work03.png" alt="" ></span>
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

        <!-- Other -->
			<div class="wrapper wrapper-style4" >
				<article id="other" >
					<header>
						<h2>Other</h2>
						<span>Choose a category to run report</span>
					</header>
					<div class="5grid-layout" >
						<div class="row" >
							<div class="4u" >
								<section class="box box-style1" >
									<span class="image image-centered" ><img src="images/work01.png" alt="" ></span>
									<h3>Conference Feedback</h3>
									<p>This report is used to display the feedback from past conferences.</p>
								</section>
							</div>
							<div class="4u" >
								<section class="box box-style1" >
									<span class="image image-centered" ><img src="images/work02.png" alt="" ></span>
									<h3>Attendee Demographics</h3>
									<p>This report is used to display the demographics from past conferences.</p>
								</section>
							</div>
							<div class="4u" >
								<section class="box box-style1" >
									<span class="image image-centered" ><img src="images/work03.png" alt="" ></span>
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

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title>Registration | Partners In Business</title>
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
        <form method="post" id="form1" runat="server">

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
            
            
            <div class="wrapper wrapper-style2">
				<article id="contact">
					<header>
						<h2>Conference Registration</h2>
						<span>Ornare nulla proin odio consequat  sapien vestibulum ipsum sed lorem.</span>
					</header>
            <div class="5grid">
						<div class="row">
							<div class="12u">
									<div class="5grid">
										<div class="row">
											<div class="6u">
												<input type="text" name="name" id="name" placeholder="Name" />
											</div>
											<div class="6u">
												<input type="text" name="email" id="email" placeholder="Email" />
											</div>
										</div>
										<div class="row">
											<div class="12u">
												<input type="text" name="subject" id="subject" placeholder="Subject" />
											</div>
										</div>
										<div class="row">
											<div class="12u">
												<textarea name="message" id="message" placeholder="Message"></textarea>
											</div>
										</div>
										<div class="row">
											<div class="12u">
												<input type="submit" class="button" value="Send Message" />
												<input type="reset" class="button button-alt" value="Clear Form" />
											</div>
										</div>
									</div>
								
							</div>
						</div>
                </div>
                    </article>
                </div>

        </form>

	</body>

</html>
<%@ page import="java.sql.Connection" %>
<%@ page import="org.BruceGallery.DB.ConnectionSource" %>
<%--
  Created by IntelliJ IDEA.
  User: Bruce
  Date: 6/12/13
  Time: 12:41 AM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Bootstrap, from Twitter</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">

	<!-- Le styles -->
	<link href="css/bootstrap.css" rel="stylesheet">
	<style type="text/css">
		body {
		padding-top: 60px;
		padding-bottom: 40px;
		}
	</style>
	<link href="css/bootstrap-responsive.css" rel="stylesheet">

	<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  <script src="js/html5shiv.js"></script>
	<![endif]-->

	<!-- Fav and touch icons -->
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png">
	<link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png">
	<link rel="shortcut icon" href="ico/favicon.png">
</head>

<body>

	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="brand" href="#">QueStack</a>
				<div class="nav-collapse collapse">
					<ul class="nav">
						<li class="active"><a href="/">主页</a></li>
						<li><a href="#about">我的提问</a></li>
						<li><a href="#contact">我的回答</a></li>

<!-- 						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li class="divider"></li>
								<li class="nav-header">Nav header</li>
								<li><a href="#">Separated link</a></li>
								<li><a href="#">One more separated link</a></li>
							</ul>
						</li> -->
					</ul>
					<form class="navbar-form pull-right">
						<input class="span2" type="text" placeholder="Email">
						<input class="span2" type="password" placeholder="Password">
						<button type="submit" class="btn">Sign in</button>
					</form>
				</div><!--/.nav-collapse -->
			</div>
		</div>
	</div>

	<div class="container">
		<div class="masthead">
			<ul class="nav nav-pills pull-right">
				<li class="active"><a href="#">提出问题</a></li>
				<li><a href="#">待回答的问题</a></li>
				<li><a href="#">高级搜索</a></li>
			</ul>
			<h3 class="muted">QueStack</h3>
		</div>
		<!-- Main hero unit for a primary marketing message or call to action -->
		<div class="hero-unit">
			<h1>Hello, world!</h1>
			<hr>
            <%
                Connection conn  = ConnectionSource.getConnection();
            %>


			<p>This is a template for a simple marketing or informational website. It includes a large callout called the hero unit and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
            <p><a href="#" class="btn btn-primary btn-large">Learn more &raquo;</a></p>
		</div>

		<!-- Example row of columns -->
<!-- 	  <div class="row">
		<div class="span4">
		  <h2>Heading</h2>
		  <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
		  <p><a class="btn" href="#">View details &raquo;</a></p>
		</div>
		<div class="span4">
		  <h2>Heading</h2>
		  <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
		  <p><a class="btn" href="#">View details &raquo;</a></p>
	   </div>
		<div class="span4">
		  <h2>Heading</h2>
		  <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
		  <p><a class="btn" href="#">View details &raquo;</a></p>
		</div>
	  </div> -->

	  <hr>

		<footer>
		<p>&copy; BruceGallery 2013</p>
		</footer>

	</div> <!-- /container -->

	<!-- Le javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/jquery-1.10.1.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>

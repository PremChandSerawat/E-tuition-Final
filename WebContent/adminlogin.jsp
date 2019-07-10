<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>loginpage</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="bootstrap.css" />
<link rel="stylesheet" type="text/css" href="bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="bootstrap.grid.css" />
<style>
body {
	margin: 0px;
}

form {
	background-color: white;
}

.head1 {
	text-align: center;
	margin-top: 7%;
	font-size: 400%;
}

.nav {
	margin-top: 8%;
	margin-left: 2%;
	text-align: center;
}

.head2 {
	text-align: center;
	margin-top: 3%;
}

.one {
	margin-top: 3%;
}

.two {
	margin-top: 2%;
}

.three {
	margin-top: 3%;
	text-align: center;
}

.three1 {
	margin-top: 2%;
}

.f {
	text-align: center;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>





	<div class="mid"
		style="z-index: -1; display: inline-block;height: 400px;">
		<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<h1 class="head1">
					<b>E-TUTIONS</b>
				</h1>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row middle">

			<div class="col-sm-12">
				<h2 class="head2">
					<b>Welcome to E-TUTIONS</b>
				</h2>
			</div>
		</div>
	</div>
		<div id="myCarousel" class="carousel slide" data-ride="carousel" style="opacity: 0.5;position: relative;bottom: 220px;">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item">
					<img src="e15.jpg" alt="e15" style="width: 1800px;height:760px;">
				</div>
				<div class="item">
					<img src="e7.jpg" alt="e7" style="width: 1800px;height:760px;">
				</div>
				<div class="item active">
					<img src="e17.jpg" alt="e17" style="width: 1800px;height:760px;">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<div style="display: inline-block; position: relative; left: 10px;bottom: 95px;">
		<form action="adminlogin" method="post">
			<div class="col-sm-5"></div>
			<div class="col-sm-7 one">
				<span style="font-weight: bold;font-size: 14pt;box-shadow: 5px 5px 10px grey;padding: 5px;border-radius: 8px;background-color:black ;color: white;margin-bottom:10px">User Name:</span> <input type="text" name="uemail" class="form-control">
			</div>
			<div class="col-sm-5"></div>
			<div class="col-sm-7 two">
								<span style="font-weight: bold;font-size: 14pt;box-shadow: 5px 5px 10px grey;padding: 5px;border-radius: 8px;background-color: black;color: white;margin-bottom:2px">Password:</span><input type="password" name="password" class="form-control">
			</div>
			
			<div class="col-sm-5 "></div>
			<div class="col-sm-1 three1">
				<input type="submit" value="Sign in" class=" btn btn-success" />
			</div>
			</form>
			</div>		

</body>
</html>
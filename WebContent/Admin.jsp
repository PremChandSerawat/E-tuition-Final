<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.nav1 {
	text-align: center;
	margin-bottom: 10px;
	margin-top: 10px;
	background-color: #00e6e6;
}

.header {
	height: 170px;
	width: 101%;
	background-color: powderblue;
}

.head1 {
	text-align: center;
	margin-top: 7%;
	font-size: 400%;
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

.footer {
	background-color: powderblue;
	margin-top: 5%;
	height: 120px;
}

.l {
	margin-top: 1%;
	text-align: right;
	margin-left: 45%;
}
</style>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<%
session=request.getSession(false);
String root=(String)session.getAttribute("root");
if(session.getAttribute("root")==null)
{
	response.sendRedirect("adminlogin.jsp");
	
}
%>


	<div class="container">
		<div class="row">

			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<h1 class="head1">
					<b>E-TUITIONS</b>
				</h1>
			</div>
			<div class="col-sm-5"></div>
		</div>
	</div>
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="etution.jsp"> E-TUTIONS </a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="facultyInfo.jsp"> Faculty </a></li>
			<li><a href="studentInfo.jsp"> Student </a></li>
			<li><a href="courseinfo.jsp"> Courses </a></li>
			<li><a href="mails.jsp"> Mails </a></li>

		</ul>
		<div class="col-sm-2 l">
			<a href="logOut"> logout <span
				class="glyphicon glyphicon-off"></span>
			</a>
		</div>
	</div>
	</nav>	
	<div class="container">
	<img src="admin.jpg" alt="e17" style="width: 1100px;height:515px;">
	</div>
	
</body>
</html>
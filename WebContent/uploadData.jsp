<%@ page language="java" import="org.hibernate.cfg.Configuration,org.hibernate.Query,org.hibernate.SessionFactory,org.hibernate.Transaction,com.modal.*,java.util.List" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>faculty</title>
<style>
body, html {
	background-image: url("t4.jpg");
	background-repeat: no repeat;
	background-size: cover;
}

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
.l{
margin-top: 1%;
text-align: right;
margin-left: 45%;
}
</style>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>


<%
session=request.getSession(false);
if(session.getAttribute("Umail")==null)
{
	
	response.sendRedirect("etution.jsp");
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
		<li><a href="faculty.jsp"> Home </a></li>
		<li><a href="uploadData.jsp">UploadDocuments </a></li>
		<li><a href="addQuestion.jsp"> AddQuestion </a></li>
		<li><a href="fUpdate.jsp"> UpdateDetails</a></li>
		<li>
		<li style="position:relative; left:0px"><a href="logOut">logout
          <span class="glyphicon glyphicon-off "></span>
        </a></li>
		
	</ul>
   
  </div>
	</nav>
	<div class="container">
   <div class="row">	
	
	<%
	ServletContext context=request.getServletContext();
	
Configuration cfg=new Configuration();
cfg.configure("hibernate.cfg.xml");
SessionFactory sf=cfg.buildSessionFactory();
org.hibernate.Session se=sf.openSession();
Transaction txn=se.beginTransaction();
String hql ="FROM Study where faculty=:faculty";
Query<Study> query = se.createQuery(hql);
query.setString("faculty",(String)session.getAttribute("Umail"));
List<Study> list=query.list();
for(Study rs:list)
{
%>

<div class="col-sm-4">
 <video width="320" height="240" controls preload="metadata" style="margin-bottom:40px;margin-top:30px;">
  <source src="<%=rs.getPath()%>" type="video/mp4">
  <source src="<%=rs.getPath()  %>" type="video/ogg">
  <source src="<%=rs.getPath()  %>" type="video/webm">
  Your browser does not support the video tag.
</video> 
<a href="/home/prem/eclipse-workspace/e-tutionFinal2/E-tutuion1(1)/WebContent/Bandook.mp4"></a>
</div>
<%
}
%>
</div>
</div>
	
	
	
	
	<div class="container">
	<div class="jumbotron">
	<h5>Please select a video lecture to upload</h5>
	<form action="fileupload" method="post" enctype="multipart/form-data"/>
	<input type="file" name="file" class="form-control" accept="video/*" style="margin-bottom:10px"/>
	
	<input type="submit" value="submit" class="btn btn-primary">
	</form>
	</div>
	</div>
	
</body>
</html>
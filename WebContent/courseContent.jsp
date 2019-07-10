<%@ page language="java" import="org.hibernate.cfg.Configuration,org.hibernate.Query,org.hibernate.SessionFactory,org.hibernate.Transaction,com.modal.*,java.util.*,java.io.File" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
    <%@page import="org.hibernate.cfg.Configuration"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>e-tution</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="bootstrap.css" />
<link rel="stylesheet" type="text/css" href="bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="bootstrap.grid.css" />
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
  <script src="http://vjs.zencdn.net/c/video.js"></script>
<script src="js/jquery-videojs-playlist.js" type="text/javascript"></script>
<style type="text/css">
#playlist {
    display:table;
}
body {
    background-color: lightblue;
}
#playlist li{
    cursor:pointer;
    padding:8px;
}

#playlist li:hover{
    color:blue;                        
}
#videoarea {
    float:left;
    width:900px;
    height:500px;
    margin:1px;    
}
.head1 {
	text-align: center;
	margin-top: 7%;
	font-size: 400%;
}

.head2 {
	text-align: center;
}

.nav {
	margin-top: 8%;
	margin-left: 2%;
	text-align: center;
}

.item {
	height: 30%;
}

.l {
	margin-top: 1%;
	text-align: right;
	margin-left: 45%;
}

</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
    $("#playlist li").on("click", function() {
        $("#videoarea").attr({
            "src": $(this).attr("movieurl"),
            "poster": "",
            "autoplay": "autoplay"
        })
    })
    $("#videoarea").attr({
        "src": $("#playlist li").eq(0).attr("movieurl"),
        "poster": $("#playlist li").eq(0).attr("moviesposter")
    })
})


</script>


</head>
<body>


<%
session=request.getSession(false);
if(session.getAttribute("Umail")==null)
{
	
	response.sendRedirect("etution.jsp");
}
else if(session.getAttribute("faculty_subject")==null)
{
	response.sendRedirect("mytopic.jsp");
	}




%>




	<div class="container-fluid">
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
			<a class="navbar-brand" href="etution.jsp">E-Tutions</a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="mytopic.jsp">My Topics</a></li>
			<li><a href="student1.jsp">View Courses</a></li>
			<li><a href="quizSelect.jsp">Quiz</a></li>

		</ul>
		<div class="col-sm-2 l">
			<a href="logOut"> logout <span
				class="glyphicon glyphicon-off"></span>
			</a>
		</div>
	</div>

	</nav>
<div class="container">
<div class="row">
<div class="col-sm-9">
<% 
Configuration cfg=new Configuration();
cfg.configure("hibernate.cfg.xml");
SessionFactory sf=cfg.buildSessionFactory();
org.hibernate.Session se=sf.openSession();
Transaction txn=se.beginTransaction();
String hql ="FROM Study where faculty=:faculty and state=:state and subject=:subject";
Query query = se.createQuery(hql);
query.setInteger("state", 0);
query.setString("subject",request.getParameter("subject") );
query.setString("faculty",(String)request.getParameter("faculty"));
List<Study> list=query.list();
if(!list.isEmpty())
{
%>
<video id="videoarea" controls="controls" poster="" src=""></video>
</div>
<div class="col-sm-3">
<ul id="playlist">

<% 



for(Study stu:list)
{
%>
<li movieurl="<%=stu.getPath()%>"><%=stu.getPath()%></li>

<%}
%>



</ul>
</div>
<% }
else{%>

<h2>No Video for you</h2>
<%} %>



</div>
</div>
<div class="container" style="margin-top: 15px;">
<div class="row">
<div class="col-sm-9">
<%
query = se.createQuery("from Query1 where subject=:subject");
query.setString("subject",request.getParameter("subject"));
List<Query1> q=query.list();
for(Query1 quer:q)
{
%>
<div class="jumbotron" style="margin-top: 1px;">
<span style="font-size: 20px;">Question:-</span><%=quer.getQuery() %><br>
<span style="font-size: 20px;">Answer:-</span><%=quer.getAnswer() %><br>
</div>
<%} %>

</div>
</div>
</div>





<div class="container" style="margin-top: 15px;">
<div class="row">
<div class="col-sm-6">
<form class="form-group" action="query" method="post">
<input type="hidden" name="subject" value="<%=request.getParameter("subject")%>"/>
<input type="hidden" name="sender" value="<%=(String)session.getAttribute("Umail")%>"/>
<input type="hidden" name="receiver" value="<%=(String)request.getParameter("faculty")%>"/> 
<textarea rows="8" cols="6" name="massage" class="form-control" placeholder="if any query type here">
</textarea>
<input type="submit" class="btn btn-success" value="Submit Query" style="margin-top: 10px;"/>
</form>
</div>
</div>
</div>


</body>






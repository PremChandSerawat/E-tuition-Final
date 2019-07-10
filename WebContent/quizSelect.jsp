<%@  page language="java" import="org.hibernate.cfg.Configuration,org.hibernate.Query,org.hibernate.SessionFactory,org.hibernate.Transaction,com.modal.*,java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="bootstrap.css" />
<link rel="stylesheet" type="text/css" href="bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="bootstrap.grid.css" />
<style>
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

</head>
<body>

<%
try
{
session=request.getSession(false);
if(session.getAttribute("Umail")==null)
{
	
	response.sendRedirect("etution.jsp");
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
			<li><a href="quizSelect.jsp">My Topics</a></li>
			<li><a href="student1.jsp">View Courses</a></li>
			<li><a href="#">Quiz</a></li>

		</ul>
		<div class="col-sm-2 l">
			<a href="logOut"> logout <span
				class="glyphicon glyphicon-off"></span>
			</a>
		</div>
	</div>

	</nav>
	

<div class="container" style="margin-left:2px;">
<div class="row"> <caption> <h2>List of Quiz Subject</h2></caption>
 </div>
 </div>
 <div class="container"  style="margin-left:1px;">
<div class="row">
<%
Configuration cfg = new Configuration();
cfg.configure("hibernate.cfg.xml");
SessionFactory sf = cfg.buildSessionFactory();
org.hibernate.Session ses = sf.openSession();
	Query q;
	q=ses.createQuery("From Course where sUmail=:student");
	q.setString("student",(String)session.getAttribute("Umail"));
	List<Course> list=q.list();
	int count = ((Long)ses.createQuery("select count(*) from Course").uniqueResult()).intValue();
	System.out.println("the number in row are="+count);
	Set<String> set =new HashSet<String>();
if(!list.isEmpty())
	for(Course c:list)
		set.add(c.getCourse());
    Iterator itr=set.iterator();
		while(itr.hasNext())
		{
			String subject=(String)itr.next();


	
%>
<div class="col-sm-3"">
<form action="quizSubjectSet" style="margin-top: 10px" method="post">
<input type="hidden" name="subject" value="<%=subject%>"/>
<input type="submit" class="btn btn-info btn-block btn-lg" value="<%=subject%>"/>
</form>
</div>
<% 
     
}
}catch(Exception e)
{
	response.sendRedirect("quizSelect.jsp");
}
	
%>
</div>
</div>
</body>
</html>
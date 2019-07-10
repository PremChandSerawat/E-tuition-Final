<%@ page language="java"  import="org.hibernate.cfg.Configuration,org.hibernate.Query,org.hibernate.SessionFactory,org.hibernate.Transaction,com.modal.*,java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quiz result</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
session=request.getSession(false);
if(session.getAttribute("Umail")==null)
{
	
	response.sendRedirect("etution.jsp");
}else if(session.getAttribute("subject")!=null)
{
	response.sendRedirect("quizOnline.jsp");
	}
else if(session.getAttribute("set")==null)
{
   	response.sendRedirect("quizSelect.jsp");
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
			<li><a href="mytopic.jsp">My Topics</a></li>
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
<table class="table table-bordered table-striped" style="width: 1190px;margin-left: 10px">
<tbody>

<% 
Configuration cfg = new Configuration();
cfg.configure("hibernate.cfg.xml");
SessionFactory sf = cfg.buildSessionFactory();
org.hibernate.Session ses = sf.openSession();

int totalNo=0;
List<Integer> set=(List)session.getAttribute("set");
session.removeAttribute("set");
Iterator<Integer> id=set.iterator();
while(id.hasNext())
{    
	if(totalNo==5)
	  break;
	Query q=ses.createQuery("From Question e where e.id=:id");
	q.setInteger("id",id.next());
	totalNo++;
	List<Question> list =q.list();
	for(Question que:list)
	{   
		
%>



<td><%=totalNo+". " %><%=que.getQuestion()%></td>
</tr>
<tr><td><div class="col-sm-3">a.
<%=que.getOptionA()%></div><div class="col-sm-3">b.
<%=que.getOptionB()%></div><div class="col-sm-3">c.
<%=que.getOptionC()%></div><div class="col-sm-3">d.
<%=que.getOptionD()%></div><div class="col-sm-3">Right Answer=
<%=que.getRightAnswer()%></div>
</td>
</tr>

<% }
	 
}
	%>
</tbody>
</table>
</body>
</html>
<%@ page language="java" import="org.hibernate.cfg.Configuration,org.hibernate.Query,org.hibernate.SessionFactory,org.hibernate.Transaction,com.modal.*,java.util.List" contentType="text/html; charset=ISO-8859-1"
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
<div align="center">
        <table  class="table table-bordered table-striped">
            <caption><h2>List of Courses</h2></caption>
            <tr>
                
                <th>FNAME</th>
                <th>Subject</th>
                <th>Email</th>
                <th></th>
            </tr>
            <tbody>



<%
Configuration cfg=new Configuration();
cfg.configure("hibernate.cfg.xml");
SessionFactory sf=cfg.buildSessionFactory();
org.hibernate.Session se=sf.openSession();
Transaction txn=se.beginTransaction();
Query query =se.createQuery("from Course where sUmail=:student");
query.setString("student", (String)session.getAttribute("Umail"));
List<Course> course=query.list();
for(Course fac:course)
{

	%>

<tr>
<td><%=fac.getFaculty()%></td>
<td><%=fac.getCourse() %></td>
<td><%=fac.getfUmail() %></td>
<td><form action="course">
<input type="hidden" name="faculty" value="<%=fac.getfUmail()  %>"/>
<input type="hidden" name="subject" value="<%=fac.getCourse()  %>"/>
<input type="submit" value="Start" class="btn btn-primary"/>
</form>     </td>
</tr>

	<%
}	

	%>




</tbody>
</table>
</div>
</body>
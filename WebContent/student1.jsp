<%@ page language="java" import="org.hibernate.cfg.Configuration,org.hibernate.Query,org.hibernate.SessionFactory,org.hibernate.Transaction,com.modal.*,java.util.List" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
    <%@page import="org.hibernate.cfg.Configuration"%>
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
			<li><a href="mytopic.jsp">My Topics</a></li>
			<li class="active"><a href="#">View Courses</a></li>
			<li><a href="quizSelect.jsp">Quiz</a></li>

		</ul>
		<div class="col-sm-2 l">
			<a href="logOut"> logout <span
				class="glyphicon glyphicon-off"></span>
			</a>
		</div>
	</div>

	</nav>
	






<div align="center" style="margin-left: 2px;margin-right: 2px">
        <table  class="table table-bordered table-striped">
            <caption><h2>List of Faculties</h2></caption>
            <tr>
                <th>ID</th>
                <th>FNAME</th>
                <th>Qualification</th>
                <th>Experience</th>
                
                <th>Mobile-No</th>
                <th>Subject</th>
                <th></th>
            </tr>
            <tbody>
<%
Configuration cfg=new Configuration();
cfg.configure("hibernate.cfg.xml");
SessionFactory sf=cfg.buildSessionFactory();
org.hibernate.Session se=sf.openSession();
Transaction txn=se.beginTransaction();
String hql ="FROM Faculty where state=0";

Query query = se.createQuery(hql);
List<Faculty> list=query.list();
for(Faculty rs:list)
{
%>

                          <tr>
                    <td><%=rs.getId()%></td>
                    <td><%=rs.getName()%></td>
                    <td><%=rs.getQualification()%></td>
                   <td><%=rs.getExperience()%></td>
                   <td><%=rs.getNumber() %></td>
                   <td><%=rs.getSubject()%></td>
                   <td>
                   
                   <%
                   String hql1="from Course e where e.sUmail=:student and e.fUmail=:faculty and e.course=:course";
                   Query q1=se.createQuery(hql1);
                   q1.setString("course", rs.getSubject());
                   q1.setString("faculty",rs.getUmail());
                   q1.setString("student",(String)session.getAttribute("Umail"));
                   List<Course> list1=q1.list();
                   if(list1.isEmpty())
                   {
                	   %>
                	   <form action="faculyAssign" method="post">
                	   <input type="hidden" name="sName" value="<%=(String)session.getAttribute("Student") %>"/>
                	   <input type="hidden" name="fUmail" value="<%=rs.getUmail()%>"/>
                   <input type="hidden" name="course" value="<%=rs.getSubject()%>"/>
                   <input type="hidden" name="faculty" value="<%=rs.getName()%>"/>
                   <input type="submit" value="FacultAllot" class="btn btn-info"/>
                   </form></td>
                </tr>
                	   
                	   <% 
                   }else
                   {           	   
                	   %>
                	   <button class="btn btn-active">Alocated</button>
                   
       <%}} %>
           </tbody>
         </table>
         </div>   
</body>
</html>
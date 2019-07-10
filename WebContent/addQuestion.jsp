<%@ page language="java" import="org.hibernate.cfg.Configuration,org.hibernate.Query,org.hibernate.SessionFactory,org.hibernate.Transaction,com.modal.*,java.util.*,java.io.PrintWriter" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addQuestion</title>

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
if(session.getAttribute("type")==null)
{
	
	response.sendRedirect("etution.jsp");
}
else if(session.getAttribute("subject")==null)
{
	PrintWriter p=response.getWriter();
	p.print("<script>alert('plese update your profile and mention subject')</script>");
	RequestDispatcher rd=request.getRequestDispatcher("faculty.jsp");
	rd.include(request, response);
	
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
		<li class="active"><a href="addQuestion.jsp"> AddQuestion </a></li>
		<li><a href="fUpdate.jsp"> UpdateDetails</a></li>
		<li><a href="fInbox.jsp"> Inbox</a></li>
		<li>
		<li style="position:relative; left:0px"><a href="logOut">logout
          <span class="glyphicon glyphicon-off "></span>
        </a></li>
		
	</ul>
   
  </div>
	</nav>
	<div class="container" style="opacity: 0.8;background-color: #e6e6e6;border-radius: 5px;">
	<table class="table table-bordered table-striped" style="margin-top:18px;">
<tbody>
	
	
	
	
<%
	Configuration cfg=new Configuration();
	cfg.configure("hibernate.cfg.xml");
	SessionFactory sf=cfg.buildSessionFactory();
	org.hibernate.Session se=sf.openSession();
	Transaction txn=se.beginTransaction();
	int totalNo=0;
	String hql ="FROM Question e where e.faculty=:faculty ORDER BY id";
	Query query = se.createQuery(hql);
	query.setString("faculty", (String)session.getAttribute("Umail"));
	List<Question> list=query.list();
	if(!list.isEmpty())
	for(Question rs:list)
	{
	%>
<td><%=rs.getId()+". " %><%=rs.getQuestion()%></td>
</tr>
<tr><td><div class="col-sm-3">a.
<%=rs.getOptionA()%></div><div class="col-sm-3">b.
<%=rs.getOptionB()%></div><div class="col-sm-3">c.
<%=rs.getOptionC()%></div><div class="col-sm-3">d.
<%=rs.getOptionD()%></div><div class="col-sm-3">Right Answer=
<%=rs.getRightAnswer()%></div>
</td>
</tr>

<% }
	 

	%>
</tbody>
</table>
</div>

<div class="container">
<div class="row">
<div class="col-sm-4">

<form action="addQuestion" class="form-group" style="margin-left: 10px">Question<br>
<input type="text"name="question"  class="form-control" required placeholder="enter Question"/><br>optionA
<input type="text" name="optionA" class="form-control" required placeholder="optionA" />optionB<br>
<input type="text" name="optionB"  class="form-control" required placeholder="optionB" />optionC<br>
<input type="text" name="optionC"  class="form-control" required placeholder="optionC" />optionD<br>
<input type="text" name="optionD" class="form-control" required placeholder="optionD"/>Right Answer<br>
<input type="text" name="rightAnswer"  class="form-control" required pattern="[a-d]" placeholder="rightAnswer in small a,b,c,d"/><br>
<input type="submit" class="btn btn-success"/>
</form>

</div>
</div>
</div>
</body>
</html>
<%@  page language="java" import="org.hibernate.cfg.Configuration,org.hibernate.Query,org.hibernate.SessionFactory,org.hibernate.Transaction,com.modal.*,java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
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
}else if(session.getAttribute("subject")==null)
{
	response.sendRedirect("quizSelect.jsp");
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
			<a class="navbar-brand" href="etution.jsp">E-Tutions</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="courseContent.jsp">My Topics</a></li>
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
	<%
	String subject=(String)session.getAttribute("subject");
	session.removeAttribute("subject");
int marks=0;
Configuration cfg = new Configuration();
cfg.configure("hibernate.cfg.xml");
SessionFactory sf = cfg.buildSessionFactory();
org.hibernate.Session ses = sf.openSession();
List<Integer> solution = new ArrayList<>();
	%>	
	<tr>
<form action="result" class="form form-cntrol" method="post">
<table class="table table-bordered table-striped" style="width: 1190px;margin-left: 10px">
<tbody>
	<%
Query q=ses.createQuery("From Question e where e.subject=:subject");
	q.setString("subject", subject);
	List<Question> list1=q.list();
	int count = ((Long)ses.createQuery("select count(*) from Course").uniqueResult()).intValue();
	System.out.println("the number in row are="+count);
	
	
if(!list1.isEmpty()&&count>=5)
{       
	   Question question;
	for(int i=0;i<6;i++)
	{  
	   question=list1.get(i);
		solution.add(question.getId());    
	}
	    
	 Collections.shuffle(solution);	
for(int totalNo=1;totalNo<6;totalNo++)
{         
		  q=ses.createQuery("From Question e where e.id=:id and e.subject=:subject");
		  q.setString("subject", subject);
		  q.setInteger("id",solution.get((totalNo-1)));
	List<Question> list =q.list();
	  for(Question que:list)
	  {
%>
<td><%=totalNo+". " %><%=que.getQuestion()%></td>
</tr>
<tr><td><div class="col-sm-3">a.
<input type="radio" name="answer<%=totalNo%>" id="answer<%=totalNo%>" value="a"/><%=que.getOptionA()%></div><div class="col-sm-3">b.
<input type="radio" name="answer<%=totalNo%>" id="answer<%=totalNo%>" value="b"/><%=que.getOptionB()%></div><div class="col-sm-3">c.
<input type="radio" name="answer<%=totalNo%>" id="answer<%=totalNo%>" value="c"/><%=que.getOptionC()%></div><div class="col-sm-3">d.
<input type="radio" name="answer<%=totalNo%>" id="answer<%=totalNo%>" value="d"/><%=que.getOptionD()%></div>
<input type="hidden" name="rightAnswer<%=totalNo%>" id="rightAnswer<%=totalNo%>" value="<%=que.getRightAnswer()%>"/>
</td>
</tr>
<%
	
	}
}

%>
</tbody>
</table>
<input type="submit" value="Get result" class="btn btn-success" style="margin-left: 10px">

</form>
<%
session.setAttribute("set",solution);
}else{
	%>
	
<h2>No Quiz</h2>	
<% 
}	
%>
</body>
</html>
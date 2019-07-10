<%@ page language="java" import="org.hibernate.cfg.Configuration,org.hibernate.Query,org.hibernate.SessionFactory,org.hibernate.Transaction,com.modal.*,java.util.List" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
if(session.getAttribute("root")==null)
{
	response.sendRedirect("Admin.jsp");
	
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
			<li ><a href="studentInfo.jsp"> Student </a></li>
            <li><a href="courseinfo.jsp"> Courses </a></li>
            <li class="active"><a href="mails.jsp"> Mails </a></li>
            
		</ul>
		<div class="col-sm-2 l">
			<a href="logOut"> logout <span
				class="glyphicon glyphicon-off"></span>
			</a>
		</div>
	</div>
	</nav>





<table  class="table table-bordered table-striped">
            <caption><h2>Mails</h2></caption>
            <tr>
                <th>ID</th>
                <th>From</th>
                <th>Subject</th>
                <th>Massage</th>
                <th>Date</th>
                <th><form action="replay" id="replay" class="form-group"> <input type="hidden" name="massage" id="massage" value="" /></th>
                
            </tr>
            <tbody>
	
	<%
	Configuration cfg=new Configuration();
	cfg.configure("hibernate.cfg.xml");
	SessionFactory sf=cfg.buildSessionFactory();
	org.hibernate.Session se=sf.openSession();
	Transaction txn=se.beginTransaction();
	String hql ="FROM Mail where receiver=:receiver ORDER BY id";
	Query query = se.createQuery(hql);
	query.setString("receiver", "admin.contect@mail.com");
	List<Mail> list=query.list();
	for(Mail rs:list)
	{
	%>
	       <tr>
                    <td><%=rs.getId()%></td>
                    <td><%=rs.getSender()%></td>
                    <td><%=rs.getSubject()%></td>
                    <td><%=rs.getMessage()%></td>
                    <td><%=rs.getDate()%></td>
                    
                    <input type="hidden" name="Umail" value="<%=rs.getSender() %>"/>
                   
                    <input type="hidden" name="subject" id="subject" value=""/>
                     
                    <td><button class="btn btn-primary" onclick="replay()">Reply</button>
                      </form>
                      
                      <script>
                      function replay()
                      {   
                      var massage=prompt("please type message to send:", "type here");                      
                               
                      document.getElementById("massage").value=massage;
                      confirm("the message are :"+document.getElementById("massage").value);
                      if(document.getElementById("massage").value!=null)
                      document.getElementById("replay").submit();

                        }
                      </script>
                       </td>
                      </tr> 
                      
                     
                       
            	  
            	  
             <%  }%>
               
       
           </tbody>
         </table>
         
        
       



</body>
</html>
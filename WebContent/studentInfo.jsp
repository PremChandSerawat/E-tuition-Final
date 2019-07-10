<%@ page language="java" import="org.hibernate.cfg.Configuration,org.hibernate.Query,org.hibernate.SessionFactory,org.hibernate.Transaction,com.modal.*,java.util.List" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>

input.prompt {border:1 solid transparent; background-color:#99ccff;width:70;font-family:arial;font-size:12; color:black;
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
	
	<script type="text/javascript">
	
	
	
	
	
	
function mailSend(mailAddresh)
  {
	
	document.getElementById('fUmail').value=mailAddresh;
	var massage=prompt('enter massage');
	if(confirm(massage))
	if(massage.length>0)
		{
		confirm(massage);
		
		document.getElementById('massage').value=massage;
		
	document.forms['replay'].submit();
		}
  }




</script>
	
	
	
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
			<li  class="active"><a href="studentInfo.jsp"> Student </a></li>
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
<form action="replay1" name="replay" method="post">
	<input type="hidden" id="fUmail" name="Umail" required/>
	<input type="hidden" id="massage" name="massage" required />
	<input type="hidden" name="page" value="studentInfo.jsp"/>
	</form>




<table  class="table table-bordered table-striped">
            <caption><h2>List of Students</h2></caption>
            <tr>
                <th>ID</th>
                <th>FNAME</th>
                <th>Mail Address</th>
                <th>Contect</th>
                <th>DOB</th>
                <th>Action</th>
            </tr>
            <tbody>
	
	<%
	Configuration cfg=new Configuration();
	cfg.configure("hibernate.cfg.xml");
	SessionFactory sf=cfg.buildSessionFactory();
	org.hibernate.Session se=sf.openSession();
	Transaction txn=se.beginTransaction();
	String hql ="FROM Student ORDER BY id";               
	Query query = se.createQuery(hql);
	List<Student> list=query.list();
	for(Student rs:list)
	{
	%>
	       <tr>
                    <td><%=rs.getId()%></td>
                    <td><%=rs.getName()%></td>
                    <td><a href="#" onclick="mailSend(this.id)" id="<%=rs.getUmail() %>"><%=rs.getUmail()%></a></td>
                    <td><%=rs.getNumber()%></td>
                    <td><%=rs.getDOB()%></td>
                  
                   <td><form action="adminControl" method="post">
                   <input type="hidden" name="type" value="Student"/>
                   <input type="hidden" name="page" value="studentInfo.jsp"/>
             <% 
             if(rs.getState()==0)
             {
             %>   
                    
                   <input type="hidden" name="state" value="0"/>
                   <input type="hidden" name="Umail" value="<%=rs.getUmail()%>"/>
                   <input type="submit" value="Deactive" class="btn btn-active"/>
                   </form></td>
                </tr>
              <%} else{%>
              
              
            	  <input type="hidden" name="state" value="1"/>
                   <input type="hidden" name="Umail" value="<%=rs.getUmail()%>"/>
                   <input type="submit" value="_Active_" class="btn btn-info"/>
                   </form></td>
                </tr> 
            	  
            	  
             <%  }%>
               
       <%} %>
           </tbody>
         </table>
       



</body>
</html>
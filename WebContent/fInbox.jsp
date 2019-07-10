<%@ page language="java" import="org.hibernate.cfg.Configuration,org.hibernate.Query,org.hibernate.SessionFactory,org.hibernate.Transaction,com.modal.*,java.util.List" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>faculty</title>
<style>

input.prompt {border:1 solid transparent; background-color:#99ccff;height:50; width:70;font-family:arial;font-size:12; color:black;} 


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

           <script>
                      function replay(clicked_id)
                      {   
                    	  var val=prompt("please type message to send:"); 
                    	  if(val.length > 0 )
                    	 document.getElementById("answer").value=val;
                    	
                    	   var a=confirm("the message are :"+val);
                      if(val.length > 0&&a==true )
                    	  {
                    	  document.getElementById("questionId").value=clicked_id;
                    	  document.getElementById("replay").submit();
                    	  }
                      
                        }
                      </script>
           



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
		<li><a href="#"> Inbox</a></li>
		<li>
		<li style="position:relative; left:0px"><a href="logOut">logout
          <span class="glyphicon glyphicon-off "></span>
        </a></li>
		
	</ul>
   
  </div>
	</nav>
	
	
	<table  class="table table-bordered table-condensed" style="width: 1150px;margin-left: 20px;">
            <caption class="active"><h2 style="color: blue;">Mails</h2></caption>
            <tr class="active">
                <th>From</th>
                <th>Query</th>
                <th>Answer</th>
                <th>Date</th>
                <th></th>
                  <form action="query12" id="replay"> 
                    <input type="hidden" name="answer" id="answer"  />
                    <input type="hidden" name="questionId" id="questionId" />
                  </form>
            
            </tr>  
            <tbody>
	
	<%
	Configuration cfg=new Configuration();
	cfg.configure("hibernate.cfg.xml");
	SessionFactory sf=cfg.buildSessionFactory();
	org.hibernate.Session se=sf.openSession();
	Transaction txn=se.beginTransaction();
	String hql ="FROM Query1 where faculty=:receiver";
	Query query = se.createQuery(hql);
	query.setString("receiver", (String)session.getAttribute("Umail"));
	List<Query1> list=query.list();
	for(Query1 rs:list)
	{
	
			%>
	               <tr class="active">
                    <td><%=rs.getStudent()%></td>
                    <td><%=rs.getQuery()%></td>
                    <td><%=rs.getAnswer() %></td>
                    <td><%=rs.getDate()%></td>
                    
                    
                  <%if(rs.getAnswer()==null)
                	  {%>
                    <td>
                    
                     <button class="btn btn-primary" onclick="replay(this.id)" id="<%=rs.getId()%>">Answer</button>
                    
                    </td>
                    <%}else{ %>
                    <td>
                    <button class="btn btn-active" onclick="replay(this.id)" id="<%=rs.getId()%>">Answered</button>
                    </td>
                    <% }%>
                    
                    
                    
                    
                   
                    
 
                      </tr> 
                      
               
            	  
             <%  }%>
               
       
           </tbody>
         </table>
         
        
       
	
</body>
</html>
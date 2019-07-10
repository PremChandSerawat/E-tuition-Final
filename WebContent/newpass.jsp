<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
body {
	margin-top: 0px;
	margin-left: 0px;
}

.h {
	margin-top: 10%;
	text-align: center;
}

.h1 {
	margin-top: 4%;
	text-align: center;
}
</style>
</head>
<body>
	<%
session=request.getSession(false);
if(session.getAttribute("type")==null)
{
response.sendRedirect("forgot.jsp");	
}

%>
	<div class="container-fluid">

		<img alt="otp" src="password-lock.jpg"
			style="width: 1200px; height: 720px;">
			
			<form action="new" action="NewPassword" name="myForm" method="post"
				class="form-group"
				style="position: relative; left: 50px; bottom: 500px;">
			<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-4">
            <h2><b>Enter New Password</b></h2>
		   </div>
		   </div>
                 <div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-4">
					Password:<input type="password" name="Password" id="Password"
						class="form-control" onkeyup='check();' required
						class="form-control">
				</div>
		        </div>
		<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-4">
			Conform Password:<input type="password" name="ConformPassword"
				class="form-control" id="ConformPassword" onkeyup='check();'
				required class="form-control">
		</div>
		<div class="col-sm-2">
			<span id='message'></span>
		</div>
		</div>
		<script type="text/javascript">
					function check() {
					    if(document.getElementById("Password").value===document.getElementById("ConformPassword").value) 
					    {   document.getElementById('message').style.color = 'green';
					        document.getElementById('message').innerHTML = "match";
					    } else {
					    	document.getElementById('message').style.color = 'red';
					        document.getElementById('message').innerHTML = "no match";
					    }
					}</script>
			<div class="row" style="margin-top:8px">
				<div class="col-sm-2"></div>
				<div class="col-sm-2">

					<input type="button" value="Reset Password" class=" btn btn-success"
						onclick="submit_form()" />
				</div>
				</div>
					<script type="text/javascript">
					function submit_form() {
					    if (document.getElementById("Password").value==document.getElementById("ConformPassword").value) 
					    {
					       document.forms["myForm"].submit();
					    }
					    else {
					    	
					        returnToPreviousPage();
					    }
					}
					
					
					</script>
		</form>

    </div>
	
</body>
</html>
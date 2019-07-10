<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Insert title here</title>
<style>
.head1 {
	text-align: center;
	margin-top: 7%;
	font-size: 400%;
}
.s{
margin-top: 4%;
text-align: center;
}
.u{
margin-top: 2%;
text-align: center;
}
.e{
margin-top: 10%;
text-align: center;
}
.o{
margin-top: 4%;
text-align: center;
}
</style>
</head>
<body style="max-height: 670px">
<%
session=request.getSession(false);
if(session.getAttribute("type")==null)
{
response.sendRedirect("register.jsp");	
}

%>
<div class="jumbotron" style="height:700px">
<div class="container">	
<div class="row">
<div class="col-sm-6">
<img alt="otp" src="otpImage.png" style="width:600px;height:620px;">
</div>
<div class="col-sm-1"></div>
<div class="col-sm-5">

<form action="register1" class="form-group" style="position:relative;top:150px;" method="post">

<div class="container"> 
<div class="row">
<div class="col-sm-4"></div>
<div class="col-sm-12">
<h2>Enter OTP</h2>

<h3> OTP has been sent to your register Email ID</h3>
</div>
</div>
</div>
<div class="col-sm-8">
 <input type="text" name="userOtp" class="form-control" placeholder="enter otp"/>
 </div>
<input type="submit" value="Verify OTP" class="btn btn-success"/>
</form>


</div>

</div>
</div>
</div>
</body>
</html>
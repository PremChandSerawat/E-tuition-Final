<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<title>Insert title here</title>
<style>
.h{
margin-top: 10%;
text-align: center;
}
.h1{
margin-top: 4%;
text-align: center;
}
.h2{
margin-top: 2%;
}
.s{
text-align: center;
margin-top: 4%;
}
</style>

</head>
<body>
<div class="jumbotron">
<div class="container">
<div class="row">
<div class="col-sm-6">
<img alt="otp" src="Circle-icons-mail.svg.png" style="width:650px;height:650px;position: relative;bottom:30px;right:20px;">
</div>
<div class="col-sm-1"></div>
<div class="col-sm-5">


<form action="forgot" class="form-group" style="position:relative;top:150px;">
<div class="container"> 
 <div class="row">
<div class="col-sm-3"></div>
<div class="col-sm-12"><h2><b> Please enter the Email Id </b></h2>

	<h3>RegisterEmail</h3>
	</div>
</div>
</div>
<div class="col-sm-10">
 <input type="email" name="Uemail" class="form-control" placeholder="enter email"/>&nbsp Student
 <input type="radio" name="type" value="Student" style="margin-top:15px" />&nbsp Faculty
 <input type="radio" name="type" value="Faculty" style="margin-top:15px"/>
 <input type="submit" value="Get Otp" class="btn btn-success"  style="margin-top:1px;margin-left:40px"/>
 </div>
 <div class="row">

</div>
</form>


</div>
</div>
</div>
</div>
</body>
</body>
</html>
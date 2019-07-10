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

<div class="jumbotron" style="height:700px">
<div class="container">	
<div class="row">
<div class="col-sm-6">
<img alt="otp" src="emailus.png" style="width:600px;height:620px;">
</div>
<div class="col-sm-1"></div>
<div class="col-sm-5">

<form action="contectUs" class="form-group" style="position:relative;top:50px;" method="post">

<div class="container"> 
<div class="row">
<div class="col-sm-4"></div>
<div class="col-sm-12">
<h3>User Mail</h3>
</div>
</div>
<div class="row">

<div class="col-sm-8">
<input type="text" name="Umail" class="form-control" placeholder="enter umail"/>
</div>
</div>
<div class="row">
<div class="col-sm-3">Student
<input type="radio"  name="type" value="Student"/>
</div>
<div class="col-sm-3">
Faculty
<input type="radio" name="type" value="Faculty"/>
</div>

<div class="col-sm-3">
Other
<input type="radio" name="type" value="Other"/>
</div>

</div>




<div class="row">
<div class="col-sm-4"></div>
<div class="col-sm-12">
<h3>Subject</h3>
</div>
</div>

<div class="row">
<div class="col-sm-10">
<input type="text" name="Subject" class="form-control" placeholder="Subject"/>
</div>
</div>




<div class="row">
<div class="col-sm-4"></div>
<div class="col-sm-12">
<h3>Message</h3>
</div>
</div>


<div class="row">
<div class="col-sm-10">
<textarea rows="5" cols="100" name="Message" class="form-control"></textarea>
</div>
</div>

<div class="row" style="margin-top: 10px">
<div class="col-sm-4">
<input type="submit" value="Send Message" class="btn btn-success"/>
</div>
</form>
<div class="col-sm-6">
<a href="etution.jsp"> <button type="button" class="btn btn-primary">click here for Homepage</button></a>
</div>
</div>
</div>

</div>
</div>

</div>
</div>
</body>
</html>
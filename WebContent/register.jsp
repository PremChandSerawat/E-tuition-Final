<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Myproject</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
body, html {
	background-image: url("r2.jpg");
	background-repeat: no repeat;
	background-size: cover;
	height: 500px;
}

.head1 {
	text-align: center;
	margin-top: 7%;
	font-size: 400%;
}

.nav {
	text-align: center;
	margin-top: 6%;
	margin-left: 2%;
}

.head2 {
	text-align: center;
	margin-top: 3%;
}

.footer {
	background-color: powderblue;
	margin-top: 3%;
	height: 120px;
	width: 101%;
}

.one {
	margin-top: 1%;
}

.two {
	margin-top: 1%;
	margin-right: 1%;
}

.three1 {
	margin-top: 2%;
}

.b {
	margin-top: 1%
}

.f {
	margin-top: 2%;
}

.t {
	text-align: center;
}

.w {
	text-align: center;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script type="text/javascript">
					function Checkform() {
						var pss=document.getElementById("Password").value;
						var pss1=document.getElementById("ConformPassword").value;
						var pa2=(pss===pss1);
						
					    if (pss===pss1) 
					    {  
					    return true;
					    }
					    else {
					    	
					    	alert('password not match');
					    	return false;;
					    }
					}
					
					function check() {
					    if(document.getElementById("Password").value===document.getElementById("ConformPassword").value) 
					    {   document.getElementById('message').style.color = 'green';
					        document.getElementById('message').innerHTML = "Password match";
					    } else {
					    	document.getElementById('message').style.color = 'red';
					        document.getElementById('message').innerHTML = "Password Not match";
					    }
					}
					
					</script>





</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6 t">
				<h1 class="head1">
					<b>E-TUITIONS</b>
				</h1>
			</div>

		</div>
	</div>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6 w">
				<h2>
					<b>Welcome To Registration</b>
				</h2>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<form action="register" id="myForm" method="get" name="myForm" onsubmit="return Checkform()">
			<div class="row">
				<div class="col-sm-5"></div>
				<div class="col-sm-3 one">
					Name: <input type="text" name="Name" required
						class="form-control">
				</div>

				<div class="col-sm-5"></div>
				<div class="col-sm-3 one2">
					DOB:<input type="date" name="DOB" required
						class="form-control">
				</div>
				<div class="col-sm-5"></div>
				<div class="col-sm-3 one3">
					Email: <input type="email" name="Uemail" required
						class="form-control">
				</div>
				<div class="col-sm-5"></div>

				<div class="col-sm-3">
					Contact: <input type="number" name="number"  required class="form-control" length="10"/>
				</div>
				<div class="col-sm-5"></div>
				<div class="col-sm-3">
					Password:<input type="password" name="Password" id="Password"  required
						class="form-control">
				</div></div>

                	<div class="col-sm-5"></div>
				<div class="col-sm-3">
				Re-Enter Password:<input type="password" name="ConformPassword" id="ConformPassword" onkeyup='check();' required
						class="form-control">
                </div>
                       <div>
						<span id='message'></span>
						</div>
						
				</div>

				<div class="col-sm-5"></div>
				<div class="col-sm-6">
					<input type="radio" name="type" value="Student"
						class="btn btn-default" required/>Student <input type="radio" name="type"
						value="Faculty" class="btn btn-default" required/>Faculty
				</div>
				<div class="col-sm-5"></div>
				<div class="col-sm-3 three1">
					<input type="submit" class=" btn btn-success" value="Register"/>
					
				</div>
				</form>
				<div class="col-sm-5"></div>
				<div class="col-sm-3">
					<ul class="list-inline" style="margin-top: 10px">
						<li><a class="f" href="etution.jsp">Already Register?
								SignUp Here</a></li>
					</ul>
				</div>

			</div>
		
	</div>
</body>
</html>
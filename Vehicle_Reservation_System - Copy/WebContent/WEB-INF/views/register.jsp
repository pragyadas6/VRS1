<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Register user</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css"
	href="${request.contextPath }/static/styles/logostyle.css"></link>
<link rel="stylesheet" type="text/css"
	href="${request.contextPath }/static/styles/bootstrap.min.css">
<link
	href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"
	integrity="sha256-0YPKAwZP7Mp3ALMRVB2i8GXeEndvCq3eSl/WsAl1Ryk="
	crossorigin="anonymous"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
<style type="text/css">
.errors {
	color: red;
}

.has-error {
	color: red;
	border: 1px solid red;
}

.no-error {
	color: green;
	border: 1px solid green;
}

.row-style {
	background-color: #e9ecef;
	color: black;
	padding: 50px 10px 40px 10px;
	border-radius: 5px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		window.x = false;
	})
</script>
<script type="text/javascript">
	$(document).ready(function() {
		window.z = false;
	})
</script>
<script type="text/javascript">
	$(document)
			.ready(

					function() { // <-- enclose your code in a DOM ready handler

						jQuery.validator.addMethod("lettersonly", function(
								value, element) {
							return this.optional(element)
									|| /^[a-z\s]+$/i.test(value);
						});
						jQuery.validator.addMethod("alp", function(value,
								element) {
							return this.optional(element)
									|| /^[A-Za-z0-9\s]+$/i.test(value);
						});
						jQuery.validator
								.addMethod(
										"datesonly",
										function(value, element) {
											return this.optional(element)
													|| /^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$/i
															.test(value);
										});
						jQuery.validator.addMethod("pwcheck", function(value) {
							return /^[A-Za-z0-9\d=!\-@._*]*$/.test(value)
									&& /[a-z]/.test(value) && /\d/.test(value)
						});
						jQuery.validator.addMethod("notEqual", function(value) {
							var altcntct = value;
							var cntct = $("#contactNumber").val();
							if (cntct == altcntct)
								return false;
							else
								return true;
						});

						jQuery.validator.addMethod("availAdminId", function() {
							$.ajax({
								url : "checkAdminId",
								async : false,
								data : {
									adminId : $("#adminId").val()
								},
								success : function(data) {
									var m = data;
									if (m == "Admin id is Available") {
										window.x = true;
									}
									if (m == "Admin id is Taken") {
										window.x = false;
									}
								}

							});
							return window.x;
							;
						})
						
						jQuery.validator.addMethod("availEmailId", function() {
							$.ajax({
								url : "checkEmailId",
								async : false,
								data : {
									emailId : $("#emailId").val()
								},
								success : function(data) {
									var m = data;
									if (m == "Email id is Available") {
										window.z = true;
									}
									if (m == "Email id is Taken") {
										window.z = false;
									}
								}

							});
							return window.z;
							;
						})

						jQuery.validator.addMethod("noSpace", function(value,
								element) {
							return value.indexOf(" ") < 0 && value != "";
						})

						$("#registerForm")
								.validate(
										{
											rules : {
												"firstName" : {
													required : true,
													minlength : 3,
													maxlength : 15,
													lettersonly : true,
												},
												"lastName" : {
													required : true,
													minlength : 3,
													maxlength : 15,
													lettersonly : true,
													noSpace : true
												},
												"age" : {
													required : true,
													digits : true,
													min : 18,
													max : 60
												},
												"gender" : {
													required : true
												},
												"contactNumber" : {
													required : true,
													digits : true,
													minlength : 10,
													maxlength : 10
												},
												"adminId" : {
													required : true,
													alp : true,
													minlength : 10,
													maxlength : 10,
													availAdminId : true,
													noSpace : true
												},
												"emailId" : {
													required : true,
													email : true,
													availEmailId : true
												},
												"password" : {
													required : true,
													minlength : 8,
													maxlength : 15,
													pwcheck : true
												},
												"branch" : {
													required : true,
													minlength : 5,
													maxlength : 5,
													alp : true,
													noSpace : true
												}

											},
											messages : {
												"firstName" : {
													required : "First name is required!",
													minlength : "First name must be at least 3 characters long",
													maxlength : "First name must be at most 15 characters long",
													lettersonly : "Enter valid name"
												},
												"lastName" : {
													required : "Last name is required!",
													minlength : "Lase name must be at least 3 characters long",
													maxlength : "First name must be at most 15 characters long",
													lettersonly : "Enter valid name",
													noSpace : "Spaces are not allowed"
												},
												"age" : {
													required : "Age is required",
													min : "You are too young to join.",
													max : "Age should be within 60 years.",
													digits : "Only digits are allowed"
												},
												"gender" : {
													required : "Select your gender"
												},
												"contactNumber" : {
													required : "Contact no is required",
													digits : "Only digits are allowed",
													minlength : "Enter a valid no",
													maxlength : "Enter a valid no"
												},
												"emailId" : {
													required : "mandatory",
													availEmailId : "Your account already exists",
													email : "Invalid"
												},
												"adminId" : {
													reqired : "Enter your Employee Id",
													minlength : "Employee id must be 10 characters long",
													maxlength : "Employee id must be 10 characters long",
													alp : "Special characters are not allowed",
													noSpace : "Spaces are not allowed",
													availAdminId : "Your account already exists"
												},
												"password" : {
													required : "Enter a password",
													minlength : "Password should be at least 8 characters long",
													maxlength : "password cant be longer than 15 characters",
													pwcheck : "password must contain a digit,special character and a lowercase letter"
												},
												"branch" : {
													reuired : "Enter a branch",
													minlength : "Branch must be 5 characters",
													maxlength : "Branch must be 5 characters",
													alp : "Special characters are not allowed",
													noSpace : "Spaces are not allowed"
												}

											},
											highlight : function(element) {
												$(element).parent().find(
														'input').removeClass(
														'no-error');
												$(element).parent().find(
														'input').addClass(
														'has-error');
											},
											unhighlight : function(element) {
												$(element).parent().find(
														'input').removeClass(
														'has-error');
												$(element).parent().find(
														'input').addClass(
														'no-error');
											},
											errorClass : "errors"

										});

					});
</script>
<link rel="shortcut icon"
	href="http://www.brianshim.com/webtricks/wp-content/uploads/2012/11/stars_favicon.png"
	type="image/x-icon" />
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body class="hero-bkg-animated" background="/static/images/bluepatt.jpg">
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary"
		style="box-shadow: 14px 10px 4px 5px rgba(0,0,0,0.27);"> 
		
		 <div id="nav" class="navbar-header">
      				 <a class="navbar-brand" href="#"><img class="picture" src="${request.contextPath}/static/images/logo1.png"/></a>
				</div>
		
		
		<a class="navbar-brand" href="#"><b>Vehicle
		Reservation System</b></a>
	<div class="collapse navbar-collapse" id="navbarColor01"></div>
	<a href="/Vehicle_Reservation_System/login">
		<button type="submit" class="btn btn-secondary my-2 my-sm-0" style=" color: #000000;box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);">
		<i class="fa fa-times-circle-o" style="font-size: 20px;">&nbsp;<b>Cancel</b></i></button>
	</a>
	</nav>
	<div class="container">
		<div class="jumbotron col-sm-12"
			style="margin-top: 2%; margin-left: 0%; padding-top: 1%; padding-bottom: 0%;box-shadow: 14px 10px 4px 5px rgba(0,0,0,0.27);">
		<center>
			<h2>
				<ins>
					<b>Register</b>
				</ins>
			</h2>
		</center>
		<br>
					<form:form id="registerForm" autocomplete="off"
						action="/Vehicle_Reservation_System/addAdmin"
						class="needs-validation" commandName="admin" method="post">

						<div class="form-group">
							<form:label path="adminId">
								<b>Admin Id:</b>
								<span class="required" style="color: red">*</span>
							</form:label>
							<form:input type="text" class="form-control" path="adminId"
								placeholder="Enter Admin Id" />
						</div>

						<div class="form-group">
							<form:label path="firstName">
								<b>First Name:</b>
								<span class="required" style="color: red">*</span>
							</form:label>
							<form:input type="text" class="form-control" path="firstName"
								placeholder="Enter Firstname" />
						</div>

						<div class="form-group">
							<form:label path="lastName">
								<b>Last Name:</b>
								<span class="required" style="color: red">*</span>
							</form:label>
							<form:input type="text" class="form-control" path="lastName"
								placeholder="Enter Lastname" />
						</div>

						<div class="form-group">
							<form:label path="age">
								<b>Age:</b>
								<span class="required" style="color: red">*</span>
							</form:label>
							<form:input type="text" class="form-control" path="age"
								placeholder="Enter Age" />
						</div>

						<div class="form-group">
							<form:label path="gender">
								<b>Gender:</b>
								<span class="required" style="color: red">*</span>
							</form:label>
							&nbsp;&nbsp;&nbsp;&nbsp;<br>
							<form:select path="gender" class="form-control">
								<form:option value=" "></form:option>
								<form:option value="Male">Male</form:option>&nbsp;&nbsp;&nbsp;&nbsp;
					<form:option value="Female">Female</form:option>&nbsp;&nbsp;&nbsp;&nbsp;
				</form:select>
				</div>
					<div class="form-group">
						<form:label path="contactNumber">
							<b>Contact no:</b>
							<span class="required" style="color: red">*</span>
						</form:label>
						<form:input type="text" class="form-control" path="contactNumber"
							placeholder="Enter contact no" />
					</div>

					<div class="form-group">
						<form:label path="emailId">
							<b>Email:</b>
							<span class="required" style="color: red">*</span>
						</form:label>
						<form:input type="text" class="form-control" path="emailId"
							placeholder="Enter email" />
					</div>

					<div class="form-group">
						<form:label path="password">
							<b>Password:</b>
							<span class="required" style="color: red">*</span>
						</form:label>
						<form:input type="password" class="form-control" path="password"
							placeholder="Enter Password" />
					</div>
					<div class="form-group">
						<form:label path="branch">
							<b>Branch:</b>
							<span class="required" style="color: red">*</span>
						</form:label>
						<form:input type="text" class="form-control" path="branch"
							placeholder="Enter branch" />
					</div>
					<br>
								 <div class="form-group"> 
								<!-- <br><br> -->
								<center>
								<button type="submit" class="btn btn-primary"
									style="margin-left: 17%;">
									<i style="font-size: 20px" class="fa">&#xf00c;&nbsp;&nbsp;<b>Submit</b></i>
								</button>
							</center>
						</div>
							<center>
								<button type="reset" class="btn btn-primary">
									<i style="font-size: 20px" class="fa">&#xf021;&nbsp;&nbsp;<b>Reset</b></i>

								</button>
							</center>
						</form:form>
					</div>
				
				</div>
</body>
</html>
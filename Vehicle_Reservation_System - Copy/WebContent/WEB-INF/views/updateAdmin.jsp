<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Update Your Details</title>
<link rel="stylesheet" type="text/css"
	href="${request.contextPath }/static/styles/logostyle.css"></link>
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
						jQuery.validator.addMethod("noSpace", function(value,
								element) {
							return value.indexOf(" ") < 0 && value != "";
						})
						jQuery.validator.addMethod("pwcheck", function(value) {
							return /^[A-Za-z0-9\d=!\-@._*]*$/.test(value)
									&& /[a-z]/.test(value) && /\d/.test(value)
						});
						$("#updateAdminForm")
								.validate(
										{
											rules : {
												"age" : {
													required : true,
													digits : true,
													min : 18,
													max : 60
												},
												"contactNumber" : {
													required : true,
													digits : true,
													minlength : 10,
													maxlength : 10
												},
												"emailId" : {
													required : true,
													//avail:true,
													email : true
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
												"age" : {
													required : "Age is required",
													min : "You are too young to join.",
													max : "Age should be within 60 years.",
													digits : "Only digits are allowed"
												},
												"contactNumber" : {
													required : "Contact no is required",
													digits : "Only digits are allowed",
													minlength : "Enter a valid no",
													maxlength : "Enter a valid no"
												},
												"emailId" : {
													required : "mandatory",
													//avail:"Present",
													email : "Invalid"
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body class="hero-bkg-animated" background="/static/images/bluepatt.jpg">
	<%
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
	%>
	<c:if test="${sessionScope.currentAdmin.adminId==null}">
		<%
			response.sendRedirect("/Vehicle_Reservation_System/");
		%>
	</c:if>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary"
		style="margin-bottom:1%;box-shadow: 14px 10px 4px 5px rgba(0,0,0,0.27);">
	<div id="nav" class="navbar-header">
		<a class="navbar-brand" href="#"><img class="picture"
			src="${request.contextPath}/static/images/logo1.png" /></a>
	</div>
	<a class="navbar-brand" href="#"><b>Vehicle Reservation System</b></a>
	<div class="collapse navbar-collapse" id="navbarColor01">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link"
				href="/Vehicle_Reservation_System/homeAgain"><b>Home</b></a></li>
			<li class="nav-item"><a class="nav-link"
				href="/Vehicle_Reservation_System/create"><b>Create</b></a></li>
			<li class="nav-item"><a class="nav-link"
				href="/Vehicle_Reservation_System/search"><b>Search</b></a></li>
			<li class="nav-item"><a class="nav-link"
				href="/Vehicle_Reservation_System/list"><b>List</b></a></li>
		</ul>
	</div>
	<form action="/Vehicle_Reservation_System/logout" method="get">
		<button type="submit" class="btn btn-secondary my-2 my-sm-0"
			style="color: #000000; box-shadow: 10px 10px 5px 0px rgba(0, 0, 0, 0.75);">
			<i style="font-size: 20px;" class="fa">&#xf08b;<b>Logout</b></i>
		</button>
	</form>
	</nav>
	<div class="container">

		<div class="jumbotron col-sm-9"
			style="margin-top: 0%; margin-left: 12%; padding-top: 1%; padding-bottom: 0%; box-shadow: 14px 10px 4px 5px rgba(0, 0, 0, 0.27);">
			<center>
				<h2>
					<b><ins>Update Your Details</ins></b>
				</h2>
			</center>
			<br>

			<form:form method="post" id="updateAdminForm" autocomplete="off"
				action="/Vehicle_Reservation_System/editCurrentAdmin"
				class="needs-validation" commandName="currentAdmin1">

				<div class="form-group">
					<form:label path="adminId">
						<b>Admin Id:</b>
					</form:label>
					<form:input type="text" class="form-control" path="adminId"
						value="${ currentAdmin1.adminId }" readonly="true" />
				</div>

				<div class="form-group">
					<form:label path="firstName">
						<b>First Name:</b>
					</form:label>
					<form:input type="text" class="form-control" path="firstName"
						value="${ currentAdmin1.firstName }" readonly="true" />
				</div>

				<div class="form-group">
					<form:label path="lastName">
						<b>Last Name:</b>
					</form:label>
					<form:input type="text" class="form-control" path="lastName"
						value="${ currentAdmin1.lastName }" readonly="true" />
				</div>

				<div class="form-group">
					<form:label path="age">
						<b>Age:</b>
					</form:label>
					<form:input type="text" class="form-control" path="age"
						value="${ currentAdmin1.age }" />
				</div>

				<div class="form-group">
					<form:label path="gender">
						<b>Gender:</b>
					</form:label>
					<form:input type="text" class="form-control" path="gender"
						value="${ currentAdmin1.gender }" readonly="true" />
				</div>

				<div class="form-group">
					<form:label path="contactNumber">
						<b>Contact Number:</b>
					</form:label>
					<form:input type="text" class="form-control" path="contactNumber"
						value="${ currentAdmin1.contactNumber }" />
				</div>

				<div class="form-group">
					<form:label path="emailId">
						<b>Email Id:</b>
					</form:label>
					<form:input type="text" class="form-control" path="emailId"
						value="${ currentAdmin1.emailId }" readonly="true" />
				</div>

				<div class="form-group">
					<form:label path="password">
						<b>Password:</b>
					</form:label>
					<form:input type="password" class="form-control" path="password"
						value="${ currentAdmin1.password }" />
				</div>

				<div class="form-group">
					<form:label path="branch">
						<b>Branch:</b>
					</form:label>
					<form:input type="text" class="form-control" path="branch"
						value="${ currentAdmin1.branch }" />
				</div>

				<center>
					<button type="submit" class="btn btn-primary" value="Update"
						style="font-size: 20px;">
						<i class="fa fa-address-book-o">&nbsp;&nbsp;<b>Update</b></i>
					</button>
				</center>
				<br>
			</form:form>
			<a href="/Vehicle_Reservation_System/homeAgain">
				<button class="btn btn-primary" style="margin-left: 42.9%;">
					<i class="fa fa-times-circle-o" style="font-size: 20px;">&nbsp;
						<b>Cancel</b>
					</i>
				</button>
			</a><br> <br>
		</div>
	</div>
</body>
</html>
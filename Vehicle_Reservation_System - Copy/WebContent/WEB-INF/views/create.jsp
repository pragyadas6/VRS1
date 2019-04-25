<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Add Details</title>
<link rel="stylesheet" type="text/css"
	href="${request.contextPath }/static/styles/logostyle.css"></link>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css"
	href="${request.contextPath }/static/styles/bootstrap.min.css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"
	integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
	crossorigin="anonymous"></script>
<!-- <script>
	$(document).ready(function() {
		$("form").submit(function() {
			alert("Vehicle Details Added Successfully");
		});
	});
</script> -->
<link rel="shortcut icon"
	href="http://www.brianshim.com/webtricks/wp-content/uploads/2012/11/stars_favicon.png"
	type="image/x-icon" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"
	integrity="sha256-0YPKAwZP7Mp3ALMRVB2i8GXeEndvCq3eSl/WsAl1Ryk="
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
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
		window.y = false;
	})
</script>
<script type="text/javascript">
	$(document)
			.ready(
					function() { // <-- enclose your code in a DOM ready handle
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
						jQuery.validator
								.addMethod(
										"availVehicleNo",
										function() {
											$
													.ajax({
														url : "checkVehicleNo",
														async : false,
														data : {
															vehicleNo : $(
																	"#vehicleNo")
																	.val()
														},
														success : function(data) {
															var m = data;
															if (m == "Vehicle No is Available") {
																window.y = true;
															}
															if (m == "Vehicle No is Taken") {
																window.y = false;
															}
														}

													});
											return window.y;
											;
										})
						jQuery.validator.addMethod("noSpace", function(value,
								element) {
							return value.indexOf(" ") < 0 && value != "";
						})
						$("#createForm")
								.validate(
										{
											rules : {
												"vehicleNo" : {
													required : true,
													alp : true,
													noSpace : true,
													minlength : 10,
													maxlength : 10,
													availVehicleNo : true
												},
												"vehicleType" : {
													required : true,
													minlength : 3,
													maxlength : 15,
													lettersonly : true,
													noSpace : true
												},
												"insuranceExpiryDate" : {
													required : true,
													datesonly : true
												},
												"lastServiceDate" : {
													required : true,
													datesonly : true
												},
												"serviceDueDate" : {
													required : true,
													datesonly : true
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
												"vehicleNo" : {
													required : "Enter a Vehicle Number",
													minlength : "Vehicle Id is 10 characters",
													maxlength : "Vehicle Id is 10 characters",
													alp : "Special characters are not allowed",
													noSpace : "Spaces are not allowed",
													availVehicleNo : "This Vehicle is already Present in the Database"
												},
												"vehicleType" : {
													required : "Enter a Vehicle Type",
													minlength : "Vehicle Type must be 3 characters at least",
													maxlength : "Vehicle Type must be 15 characters at max",
													lettersonly : "Enter Alphabets only",
													noSpace : "Spaces are not allowed"
												},
												"insuranceExpiryDate" : {
													required : "Enter an Insurance Expiry Date",
													datesonly : "Enter a valid date"
												},
												"lastServiceDate" : {
													required : "Enter a Last Service Date",
													datesonly : "Enter a valid date"
												},
												"serviceDueDate" : {
													required : "Enter a Service Due Date",
													datesonly : "Enter a valid date"
												},
												"branch" : {
													required : "Enter a branch",
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
	$(document).ready(function() {
		$('#datepicker-1').datepicker({
			maxDate : -1
		});
	});
	$(function() {
		$("#datepicker-2").datepicker({
			minDate : +1
		});
	});
	$(function() {
		$("#datepicker-3").datepicker({
			minDate : +1
		});
	});
</script>
</head>
<body class="hero-bkg-animated" background="/static/images/bluepatt.jpg">
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary"
		style="margin-bottom:3%;box-shadow: 14px 10px 4px 5px rgba(0,0,0,0.27);">
	<div id="nav" class="navbar-header">
		<a class="navbar-brand" href="#"><img class="picture"
			src="${request.contextPath}/static/images/logo1.png" /></a>
	</div>
	<a class="navbar-brand" href="#"><b>Vehicle Reservation System</b></a>
	<div class="collapse navbar-collapse" id="navbarColor01">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link"
				href="/Vehicle_Reservation_System/homeAgain"><b>Home</b></a></li>
			<li class="nav-item active"><a class="nav-link" href="#"><b>Create</b><span
					class="sr-only">(current)</span></a></li>
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
			style="margin-top: -45px; margin-left: 12%; padding-bottom: 2%; box-shadow: 14px 10px 4px 5px rgba(0, 0, 0, 0.27);">
			<center>
				<h2>
					<b> &nbsp;&nbsp; <ins>Add Vehicle</ins>
					</b>
				</h2>
			</center>
			<br>
			<div class="row">
				<div class="col-md-3"></div>
				<div class=" col-md-7">
					<form:form id="createForm" method="post"
						action="/Vehicle_Reservation_System/addVehicle"
						class="needs-validation" commandName="create" autocomplete="off">

						<div class="form-group">
							<form:label path="vehicleNo">
								<b>Vehicle No.:</b>
								<span class="required" style="color: red">*</span>
							</form:label>
							<form:input type="text" class="form-control" path="vehicleNo"
								placeholder="Enter Vehicle Number" />
						</div>

						<div class="form-group">
							<form:label path="branch">
								<b>Branch:</b>
								<span class="required" style="color: red">*</span>
							</form:label>
							<form:input type="text" class="form-control" path="branch"
								placeholder="Enter Branch" />
						</div>

						<div class="form-group">
							<form:label path="vehicleType">
								<b>Vehicle Type:</b>
								<span class="required" style="color: red">*</span>
							</form:label>
							<form:input type="text" class="form-control" path="vehicleType"
								placeholder="Enter Vehicle Type" />
						</div>

						<div class="form-group">
							<form:label path="insuranceExpiryDate">
								<b>Insurance Expiry date:</b>
								<span class="required" style="color: red">*</span>
							</form:label>
							<form:input type="text" id="datepicker-2" class="form-control"
								path="insuranceExpiryDate"
								placeholder="Enter Insurance Expiry date" />
						</div>

						<div class="form-group">
							<form:label path="lastServiceDate">
								<b>Last Service Date:</b>
								<span class="required" style="color: red">*</span>
							</form:label>
							<form:input type="text" id="datepicker-1" class="form-control"
								path="lastServiceDate" placeholder="Enter Last Service Date" />
						</div>

						<div class="form-group">
							<form:label path="serviceDueDate">
								<b>Service Due date:</b>
								<span class="required" style="color: red">*</span>
							</form:label>
							<form:input type="text" id="datepicker-3" class="form-control"
								path="serviceDueDate" placeholder="Enter Service Due date" />
						</div>
						<br>
						<button type="submit" class="btn btn-primary"
							style="margin-left: 40%;">
							<i style="font-size: 20px" class="fa">&#xf196;&nbsp;<b>Add</b></i>
						</button>
					</form:form>
				</div>
			</div>
			<br> <a href="/Vehicle_Reservation_System/homeAgain"><button
					class="btn btn-primary" style="margin-left: 47.55%;">
					<i class="fa fa-times-circle-o" style="font-size: 20px;">&nbsp;<b>Cancel</b></i>
				</button></a>
		</div>
	</div>
</body>
</html>
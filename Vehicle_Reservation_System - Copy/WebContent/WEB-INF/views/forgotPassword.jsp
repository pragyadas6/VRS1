<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css"
	href="${request.contextPath }/static/styles/logostyle.css"></link>
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>Forgot Password</title>
<link rel="stylesheet" type="text/css"
	href="${request.contextPath }/static/styles/bootstrap.min.css">
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
		window.a = false;
	})
</script>
<script type="text/javascript">
	$(document)
			.ready(

					function() {
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
										window.a = false;
									}
									if (m == "Email id is Taken") {
										window.a = true;
									}
								}
							});
							return window.a;
							;
						})
						
						$("#forgotPasswordForm")
								.validate(
										{
											rules : {
												"emailId" : {
													required : true,
													email : true,
													availEmailId : true
												}
											},
											messages : {
												"emailId" : {
													required : "mandatory",
													availEmailId : "Your account doesn't exist",
													email : "Invalid"
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
<body style="background-image: linear-gradient(to right, white, cyan);">
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<div class="main">
		<section class="signup">
			<div class="container">
				<div class="col-md-6 col-md-offset-3" style="padding-top: 10%">
					<div class="signup-content">
						<form:form action="/Vehicle_Reservation_System/submitEmail" method="POST"
							id="forgotPasswordForm" class="needs-validation" commandName="login" autocomplete="off">
							<h5 class="form-title"><b>Forgot Password</b></h5>
							<div class="form-group">
								<form:input type="text" class="form-control"
									path="emailId" id="emailId" placeholder="Email Id"
									required="required" />
							</div>
							<button type="submit" class="btn btn-primary" id="submit"
								value="Submit"><b>Submit</b></button>
						</form:form>
						<p class="loginHere">
							<b>Don't have an account ? <a href="/Vehicle_Reservation_System/register">Register
								Here</a></b>
						</p>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>
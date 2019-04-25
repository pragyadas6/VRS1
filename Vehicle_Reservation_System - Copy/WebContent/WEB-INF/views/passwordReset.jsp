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
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link href='<spring:url value="/css/registration.css"/>'
	rel="stylesheet" />
<script type="text/javascript"
	src='<spring:url value="/Script/registration.js"/>'></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>Reset Password</title>
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
						<form:form method="POST" action="/Vehicle_Reservation_System/resetCommit?token=${token}"
							id="signup-form" class="signup-form" commandName="reset" autocomplete="off">
							<h2 class="form-title"><b>Reset Password</b></h2>
							<div class="form-group">
								<form:input type="password" class="form-control input-lg"
									path="password" id="loginId" placeholder="Password"
									required="required" />
							</div>
							<div class="form-group">
								<input id="password" type="password"
									class="form-control input-lg" name='j_password'
									placeholder="Confirm Password" required> <span id="eye"
									toggle="#password"
									class="fa fa-fw fa-eye-slash fa-lg field-icon toggle-password"></span>
								<div class="pwstrength_viewport_progress"></div>
							</div>
							<button type="submit" class="form-input" name="" id="submit"
								value="Reset" ><b>Submit</b></button>
						</form:form>
						<p class="loginHere">
							<b>Don't have an account ? <a href="/Vehicle_Reservation_System/register" class="Registerhere-link">Register
								Here</a></b>
						</p>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>
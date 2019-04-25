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
<link rel="stylesheet" type="text/css"
	href="${request.contextPath }/static/styles/bootstrap.min.css">
<title>Reset Password Message</title>
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
						<form action="/Vehicle_Reservation_System/login" id="signup-form" class="needs-validation">
							<h2 class="form-title">CHECK EMAIL</h2>
							<div class="form-group">
								<h3>Password Reset Link has been send to your Mail, please
									Check your mail.</h3>
							</div>
							<button type="submit" class="btn btn-primary" name="" id="submit"
								value="Login" ><b>Login</b></button>
						</form>
						<p class="loginHere">
							Don't have an account ? <a href="/Vehicle_Reservation_System/register" class="Registerhere-link"><b>Register
								Here</b></a>
						</p>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>
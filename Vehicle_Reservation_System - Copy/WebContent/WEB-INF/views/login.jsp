<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Login page</title>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${request.contextPath }/static/styles/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css"
	href="${request.contextPath }/static/styles/logostyle.css"></link>
	<link rel="shortcut icon" href="http://www.brianshim.com/webtricks/wp-content/uploads/2012/11/stars_favicon.png" type="image/x-icon" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body class="loginbg" background="/static/images/login1.jpg">
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary"
		style="margin-bottom:90px; line-height:100px;"> <a class="navbar-brand" href="#"><b><span style="font-size: 32px;">Vehicle
		Reservation System</span></b></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarColor01" aria-controls="navbarColor01"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarColor01"></div>
	</nav>
	<center>
		<h2>
			<ins>
				<b><span style="font-size: 35px;">Welcome</span></b>
			</ins>
		</h2>
	</center>
	<br>
	<br>
	<form:form action="/Vehicle_Reservation_System/home" commandName="login" autocomplete="off">
		<center>
			<div class="form-group">
				<table>
					<tr>
						<td><form:label path="adminId"><b><span style=" color: #029be2; font-size: 25px;">Employee ID:</span></b></form:label></td>
						<td><form:input type="text" maxlength="10"
								class="form-control" path="adminId"
								placeholder="Enter Employee ID" required="true" /></td>
					</tr>
				</table>
			</div>
			<br>
			<div class="form-group">
				<table>
					<tr>
						<td><form:label path="password"><b><span style=" color: #029be2; font-size: 25px;">Password:</span></b></form:label></td>
						<td><form:input type="password" class="form-control"
								path="password" placeholder="Enter Password" required="true" /></td>
					</tr>
				</table>
			</div>
			<br>
			<div class="form-group">
				<!-- <br><br> -->
				<button type="submit" class="btn btn-primary"><i style="font-size:20px;font-face: lato;" class="fa">&#xf090;<b>&nbsp;Login</b></i></button>
				<br> <br>

			</div>
		</center>
	</form:form>
	<center><a href="/Vehicle_Reservation_System/forgotPassword" style="font-weight: bold; font-size: 25px;">Forgot password?</a></center>
	<center>
		<form action="/Vehicle_Reservation_System/register">
			<input type="submit" class="btn btn-link"
				value="Don't have a account? Register here" style="font-weight: bold; font-size: 25px;"/>
		</form>
	</center>
</body>
</html>
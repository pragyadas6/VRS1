<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
 <link rel="stylesheet" type="text/css"
	href="${request.contextPath }/static/styles/logostyle.css"></link> 
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${request.contextPath }/static/styles/bootstrap.min.css"></link>
<script type="text/javascript">
function confirm_alert(node) {
    return confirm("If you want to DELETE your account, please click on OK to continue.");
}
</script>
<link rel="shortcut icon"
	href="http://www.brianshim.com/webtricks/wp-content/uploads/2012/11/stars_favicon.png"
	type="image/x-icon" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body class="hero-bkg-animated" background="/static/images/bluepatt.jpg">
	 <%response.setHeader("Cache-Control","no-cache");
  	response.setHeader("Cache-Control","no-store");
 	 response.setHeader("Pragma","no-cache");
  	response.setDateHeader ("Expires", 0); %>
	<c:if test="${sessionScope.currentAdmin.adminId==null}">
		<%response.sendRedirect("/Vehicle_Reservation_System/"); %>
	</c:if> ​
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary" style="margin-bottom:45px;box-shadow: 14px 10px 4px 5px rgba(0,0,0,0.27);"> 
	<div id="nav" class="navbar-header">
		<a class="navbar-brand" href="#"><img class="picture"
			src="${request.contextPath}/static/images/logo1.png" /></a>
	</div>
	
	<a
		class="navbar-brand" href="#"><b>Vehicle Reservation System</b></a>
	<div class="collapse navbar-collapse" id="navbarColor01">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="#"><b>Home</b>
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="/Vehicle_Reservation_System/create"><b>Create</b></a></li>
			<li class="nav-item"><a class="nav-link" href="/Vehicle_Reservation_System/search"><b>Search</b></a></li>
			<li class="nav-item"><a class="nav-link" href="/Vehicle_Reservation_System/list"><b>List</b></a></li>
			<li></li>
		</ul>
	</div>
	<form action="/Vehicle_Reservation_System/logout" method="get" >
		<button class="btn btn-secondary" type="submit">
			<i style="font-size: 20px;"class="fa">&#xf08b;<b>Logout</b></i>
		</button>
	</form>
	</nav>
	<div class="row" style="margin-top: -48px; width: 100%;">
		<form:form commandName="currentAdmin">
			<div class="card mb-3 col-sm-5"
				style="max-width: 30rem; margin-top: 100px; margin-left: 50px; background-color: #23b0db;box-shadow: 14px 10px 4px 5px rgba(0,0,0,0.27);">
				<h3 class="card-header" style="color: #000000;">${ sessionScope.currentAdmin.firstName }&nbsp;${ sessionScope.currentAdmin.lastName }</h3>
				<div class="card-body">
					<h5 class="card-title" style="color: #000000;">Welcome Admin</h5>
					<!-- 	<h6 class="card-subtitle text-muted">Support card subtitle</h6> -->
				</div>
				<img class="cardbg" style="height: 121px; width: 27%; display: block;
					background-image: url('${request.contextPath}/static/images/profile.png'); background-repeat: no-repeat; margin-left: 151px;">
					
				<div class="card-body">
					<p class="card-text" style="color: #000000;">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
				</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item"><b><span
							style="color: #0c03ba"><ins>Employee Id:</ins>&nbsp;&nbsp;</span>
							<i> ${ sessionScope.currentAdmin.adminId }</i></b></li>
					<li class="list-group-item"><b><span
							style="color: #0c03ba"><ins>Contact No:</ins>&nbsp;&nbsp;</span>
							<i> ${ sessionScope.currentAdmin.contactNumber }</i></b></li>
					<li class="list-group-item"><b><span
							style="color: #0c03ba"><ins>Email Id:</ins>&nbsp;&nbsp;</span>
							<i> ${ sessionScope.currentAdmin.emailId }</i></b></li>
					<li class="list-group-item"><b><span
							style="color: #0c03ba"><ins>Branch:</ins>&nbsp;&nbsp;</span>
							<i> ${ sessionScope.currentAdmin.branch }</i></b></li>
				</ul>
				<div class="card-body">
					<a href="/Vehicle_Reservation_System/editAdmin/${sessionScope.currentAdmin.adminId}" class="card-link" style="color: #0c03ba;"><b>Update Details</b></a> <a
						href="/Vehicle_Reservation_System/deleteAdmin/${sessionScope.currentAdmin.adminId}" class="card-link" onclick="return confirm_alert(this);" style="color: #0c03ba;"><b>Delete Account</b></a>
				</div>
				<div class="card-footer" style="color: #ffffff">2 days ago</div>
			</div>
		</form:form>
		<div class="jumbotron col-sm-7"
			style="margin-top: 100px; margin-left: 127px;box-shadow: 14px 10px 4px 5px rgba(0,0,0,0.27);">
			<h1 class="display-3" style="color: #0080ff;"><b>Welcome</b></h1>
			<p class="lead"><b>Established in 1996, this vehicle reservation
				system is a powerful system with an impressive set of features. It’s
				a fully integrated software designed to simplify vehicle management
				and enable car rentals to accept online reservations with ease. It
				enables rental operators to organize the vehicle in groups with the
				robust vehicle grouping feature and run insightful usability
				reports. Vehicle grouping allows customers to select their ideal car
				with ease.</b></p>
			<hr class="my-4">
			<p><b>The reservation module allows administrators to add, update,
				view and search all reservations from a centralized control panel.
				It makes it easier to email or print the reservations or filter them
				using multiple criteria such as name, dates, locations, vehicle,
				etc. Better still, the advanced quote engine empowers automatic
				calculation of rates, charging daily extras, prorating season
				cutoffs, and billing drop-off fees. The engine is custom-quoted to
				adhere to all business rules regardless of the complexity to deliver
				quotes faster and flawlessly. One can get details of vehicle number,
				branch, vehicle type, insurance expiry date, last serviced date,
				service due date and send notification emails as and when required .
			</b>
			</p>
		</div>
	</div>
</body>
</html>
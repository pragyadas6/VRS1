<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Details</title>
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
	<link rel="shortcut icon" href="http://www.brianshim.com/webtricks/wp-content/uploads/2012/11/stars_favicon.png" type="image/x-icon" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary" style="box-shadow: 14px 10px 4px 5px rgba(0,0,0,0.27);">
	<div id="nav" class="navbar-header">
      				 <a class="navbar-brand" href="#"><img class="picture" src="${request.contextPath}/static/images/logo1.png"/></a>
				</div>
	 <a
		class="navbar-brand" href="#"><b>Vehicle Reservation System</b></a>
	<div class="collapse navbar-collapse" id="navbarColor01">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link" href="/Vehicle_Reservation_System/homeAgain"><b>Home</b></a></li>
			<li class="nav-item"><a class="nav-link" href="/Vehicle_Reservation_System/create"><b>Create</b></a></li>
			<li class="nav-item active"><a class="nav-link" href="#"><b>Search</b><span
					class="sr-only">(current)</span></a></li>
			<li class="nav-item"><a class="nav-link" href="/Vehicle_Reservation_System/list"><b>List</b></a></li>
		</ul>
	</div>
	<form action="/Vehicle_Reservation_System/logout" method="get">
		<button type="submit" class="btn btn-secondary my-2 my-sm-0" style=" color: #000000; box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);"><i style="font-size: 20px;"class="fa">&#xf08b;<b>Logout</b></i></button>
	</form>
	</nav>
	<div class="container">
		<div class="jumbotron col-sm-10" style="margin-top: 12px; margin-left: 96px; padding-top: 3%; padding-left:8%;box-shadow: 14px 10px 4px 5px rgba(0,0,0,0.27);"> 
		<h2 style="margin-top: 0%;"><b><center>Search Vehicle</center></b></h2><br><br>
		<form:form action="/Vehicle_Reservation_System/searchVehicle" method="post"
			class="needs-validation" novalidate="true" autocomplete="off"
			commandName="searchVehicle">
			<div class="row">
				<div class="col-sm-5">
					<div class="form-group">
						<form:label path="branch"><b>Branch:</b></form:label>
						<div class="form-group">
							<form:select class="form-control" path="branch">
								<form:option value="" class="hidden" selected="true">Choose Branch</form:option>
								<c:if test="${!empty allBranch}">
									<form:options items="${allBranch}"></form:options>
								</c:if>
							</form:select>
						</div>
					</div>
					<div class="form-group">
						<form:label path="lastServiceDate"><b>Last Serviced Month:</b></form:label>
						<div class="form-group">
							<form:select class="form-control" path="lastServiceDate">
								<form:option value="" class="hidden" selected="true">Choose Month</form:option>
								<form:option value="01">Jan</form:option>
								<form:option value="02">Feb</form:option>
								<form:option value="03">Mar</form:option>
								<form:option value="04">Apr</form:option>
								<form:option value="05">May</form:option>
								<form:option value="06">Jun</form:option>
								<form:option value="07">Jul</form:option>
								<form:option value="08">Aug</form:option>
								<form:option value="09">Sep</form:option>
								<form:option value="10">Oct</form:option>
								<form:option value="11">Nov</form:option>
								<form:option value="12">Dec</form:option>
							</form:select>
						</div>
					</div>
				</div>
				<div class="col-sm-5">
					<div class="form-group">
						<form:label path="vehicleType"><b>Vehicle Type:</b></form:label>
						<div class="form-group">
							<form:select class="form-control" path="vehicleType">
								<form:option value="" class="hidden" selected="true">Choose Vehicle Type</form:option>
								<c:if test="${!empty allVehicleType}">
									<form:options items="${allVehicleType}"></form:options>
								</c:if>
							</form:select>
						</div>
					</div>
					<div class="form-group">
						<form:label path="serviceDueDate"><b>Service Due Month:</b></form:label>
						<div class="form-group">
							<form:select class="form-control" path="serviceDueDate">
								<form:option value="" class="hidden" selected="true">Choose Month</form:option>
								<form:option value="01">Jan</form:option>
								<form:option value="02">Feb</form:option>
								<form:option value="03">Mar</form:option>
								<form:option value="04">Apr</form:option>
								<form:option value="05">May</form:option>
								<form:option value="06">Jun</form:option>
								<form:option value="07">Jul</form:option>
								<form:option value="08">Aug</form:option>
								<form:option value="09">Sep</form:option>
								<form:option value="10">Oct</form:option>
								<form:option value="11">Nov</form:option>
								<form:option value="12">Dec</form:option>
							</form:select>
						</div>
					</div>
				</div>
				<div class="col-sm-2" style="margin-top: 100px">
					<button type="submit" class="btn btn-primary" style="box-shadow: 14px 10px 4px 5px rgba(0,0,0,0.27);"><b><i class="fa fa-search"></i>&nbsp;Search</b></button>
				</div>
			</div>
		</form:form>
</div>
		<c:if test="${not empty searchList}">
			<table class="table table-hover">
				<tr class="table-dark">
					<th>Vehicle No</th>
					<th>Branch</th>
					<th>Vehicle Type</th>
					<th>Insurance Expiry Date</th>
					<th>Last Service Date</th>
					<th>Service Due Date</th>
					<th colspan="2">Actions</th>
				</tr>
				<c:forEach items="${searchList}" var="vh">
					<tr class="table-primary">
						<td>${vh.vehicleNo}</td>
						<td>${vh.branch}</td>
						<td>${vh.vehicleType }</td>
						<td>${vh.insuranceExpiryDate }</td>
						<td>${vh.lastServiceDate }</td>
						<td>${vh.serviceDueDate}</td>
						<td><a href="/Vehicle_Reservation_System/edit/${vh.vehicleNo}" style=" color: #0c03ba">edit</a></td>
						<td><a href="/Vehicle_Reservation_System/delete/${vh.vehicleNo}" style=" color: #0c03ba">delete</a></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</div>
</body>
</html>
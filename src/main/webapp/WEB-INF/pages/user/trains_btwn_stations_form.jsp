<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>

	<!DOCTYPE html>
	<html lang="en">

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Document</title>

		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/UserHome_Css.css">

	</head>

	<body>

		<header>
			<h1 class="hd">National Ticket Booking Spot UH</h1>

			<!-- Home Hyperlik -->
			<div class="home">
				<p class="menu">
					<a href="#">Home</a>
				</p>
			</div>

			<!-- View All trains Hyperink-->
			<div class="home">
				<p class="menu">
					<a href="${pageContext.request.contextPath}/user/viewAllTrains">View All Trains</a>
				</p>
			</div>

			<!-- Find Trains between 2 staions Hyperlink -->
			<div class="home">
				<p class="menu">
					<a href="${pageContext.request.contextPath}/user/findTrainsbetweenStaionsFwd">Trains between staions</a>
				</p>
			</div>

			<!-- Diplay train booking History Hyperlink -->
			<div class="home">
				<p class="menu">
					<a href="${pageContext.request.contextPath}/user/showBookingHistoryFwd">Ticket Booking History</a>
				</p>
			</div>

			<!-- train fair Enquery Hyperlink -->
			<div class="home">
				<p class="menu">
					<a href="${pageContext.request.contextPath}/user/trainFairEnqueryFwd">Fair Enquery</a>
				</p>
			</div>

			<!-- Check Seats Availability Hyperlink -->
			<div class="home">
				<p class="menu">
					<a href="${pageContext.request.contextPath}/user/trainSeatsAvailablityCheckFwd">Check Seats
						Availability</a>
				</p>
			</div>

			<!-- display user profile Hyperlink -->
			<div class="home">
				<p class="menu">
					<a href="${pageContext.request.contextPath}/user/userProfile">Profile</a>
				</p>
			</div>

			<!-- user Logout Hyperlink -->
			<div class="home">
				<p class="menu">
					<a href="${pageContext.request.contextPath}/user/userLogout">Logout</a>
				</p>
			</div>
		</header>

		<section>
			<h1>Find Trains betweem stations</h1>
			<form action="${pageContext.request.contextPath}/user/findTrainsbetweenStaions" class="tab red" method="post">
				From Station : <input type="text" name="fromStation"> <br>
				To Station   : <input type="text" name="toStation"> <br>
				<input type="submit" value="SEARCH TRAINS">
			</form>
		</section>
	</body>

	</html>
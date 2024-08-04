<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/login.css">

</head>

<body>
	<div class="main-container">


		<div class="container">
			<div class="left-container">
				<div class="heading">
					<p class="main-text">National Train</p>
					<p class="main-text">Ticket</p>
					<p class="main-text">Booking Spot</p>

				</div>
				<div class="register-container">
					<span class="span"> <a class="register"
						href="${pageContext.request.contextPath}/appUsers/register">
							Register</a>
					</span>
				</div>
			</div>



			<%-- Check if logoutMessage is not empty --%>
			<c:if test="${not empty logoutMessage}">
				<h3>${logoutMessage}</h3>
			</c:if>

			<%-- Check if loginFailedMessage is not empty --%>
			<c:if test="${not empty loginFailedMessage}">
				<h3>${loginFailedMessage}</h3>
			</c:if>

			<%-- Check if sessionExpired parameter is present --%>
			<c:if test="${param.sessionExpired eq 'true'}">
				<h3>Session Expired, Login again</h3>
			</c:if>



			<div class="form-container">
				<form action="${pageContext.request.contextPath}/login" class="form"
					method="post">
					<input type="text" name="username" class="input"
						placeholder="username"> <input type="password"
						name="password" placeholder="password" class="input"> <input
						class="button" type="submit" value="Login">

				</form>
			</div>
		</div>

	</div>
</body>

</html>
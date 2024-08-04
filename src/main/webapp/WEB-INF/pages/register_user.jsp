<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<title>New User Registration Form</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/registrationform_style.css">

<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/UserHome_Css.css">


</head>
<body>

	<!-- submitting the form with the proper enctype attribute set to "multipart/form-data".
	 This attribute is required to handle file uploads in HTML forms. 
	 By setting the enctype to "multipart/form-data", 
	 the form data will be encoded as multipart data, 
	 allowing file uploads to be processed correctly by your Spring controller-->
	
<div class="tab green">
    <div class="signup-form">
        <form
            action="${pageContext.request.contextPath}/appUsers/confirmRegistration/customer"
            method="post" enctype="multipart/form-data">
            <h2>Register</h2>
            <p class="hint-text">Create your account. It's free and only takes a minute.</p>
            
            <div class="form-group">
                <div class="row">
                    <div class="col">
                        <input type="text" class="form-control" name="firstName"
                            placeholder="First Name" value="${param.firstName}" />
                        <c:if test="${not empty errorMap['firstName']}">
                            <div class="text-danger">${errorMap['firstName']}</div>
                        </c:if>
                    </div>
                    <div class="col">
                        <input type="text" class="form-control" name="lastName"
                            placeholder="Last Name" value="${param.lastName}" />
                        <c:if test="${not empty errorMap['lastName']}">
                            <div class="text-danger">${errorMap['lastName']}</div>
                        </c:if>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <input type="email" class="form-control" name="username"
                    placeholder="user@gmail.com" value="${param.username}" />
                <c:if test="${not empty errorMap['username']}">
                    <div class="text-danger">${errorMap['username']}</div>
                </c:if>
            </div>
            <div class="form-group">
                <input type="password" class="form-control" name="password"
                    placeholder="Password" />
                <c:if test="${not empty errorMap['password']}">
                    <div class="text-danger">${errorMap['password']}</div>
                </c:if>
            </div>
            <div class="form-group">
                <input type="password" class="form-control" name="confirmPassword"
                    placeholder="Confirm Password" />
                <c:if test="${not empty errorMap['confirmPassword']}">
                    <div class="text-danger">${errorMap['confirmPassword']}</div>
                </c:if>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="address"
                    placeholder="Address" value="${param.address}" />
                <c:if test="${not empty errorMap['address']}">
                    <div class="text-danger">${errorMap['address']}</div>
                </c:if>
            </div>
            <div class="form-group">
                <input type="tel" class="form-control" name="phoneNumber"
                    placeholder="Ph: +91" value="${param.phoneNumber}" />
                <c:if test="${not empty errorMap['phoneNumber']}">
                    <div class="text-danger">${errorMap['phoneNumber']}</div>
                </c:if>
            </div>
            <div class="form-group">
                <input type="file" class="form-control" name="image"
                    placeholder="Upload Profile picture" />
                <c:if test="${not empty errorMap['image']}">
                    <div class="text-danger">${errorMap['image']}</div>
                </c:if>
            </div>
            <div class="form-group">
                <label class="form-check-label">
                    <input type="checkbox" name="termsAccepted" required="required" /> I accept the <a href="#">Terms of Use</a> &amp; <a href="#">Privacy Policy</a>
                </label>
                <c:if test="${not empty errorMap['termsAccepted']}">
                    <div class="text-danger">${errorMap['termsAccepted']}</div>
                </c:if>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-success btn-lg btn-block">Register Now</button>
            </div>
        </form>
        <div class="text-center">
            Already have an account? <a href="#">Sign in</a>
        </div>
    </div>
</div>
</body>
</html>
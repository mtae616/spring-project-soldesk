<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
<link href="${root }/css/signin.css" rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>
<script type="text/javascript" src="${root }/js/signin.js"></script>
</head>
<body>

	<!-- HEADER -->
	<c:import url="/WEB-INF/views/header.jsp" />

	<form:form action="signin_proc" method="post"
		modelAttribute="loginUserBean">
		<div class="body"></div>
		<div class="grad"></div>
		<div class="header">
			<div>T<br>S<span>tandhal</span><br>S<span>yndrom</span></div>
		</div>
		<br>
		<div class="login">
			<form:input type="text" placeholder="ID" name="user" path="u_id" /><br>
			<form:input type="password" placeholder="PW" name="password" path="u_password" /><br>
			<span style="display: inline-block; margin-top: 10px;">
				<a href="idfind" style="color: white;">&nbsp;Forgot ID</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="pwfind" style="color: white;">Forgot Password</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="signup" style="color: white;">Join Us</a>
			</span>
			<form:button type="submit" class="button">Sign in</form:button>
			<div class="g-recaptcha" data-sitekey="6LcmOt0aAAAAAMWkUXzj5ZHTpIwwwYZ4laXtBudY"></div>
		</div>
	</form:form>
</body>
</html>
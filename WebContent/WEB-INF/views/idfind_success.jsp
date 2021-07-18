<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기</title>
<style type="text/css">

.idinfo {
	width: 600px;
	height: 300px; 
	margin: 0 auto;
	margin-top: 300px;
}

.idinfo .idbox {
	font-size: xx-large;
}

.idinfo .btnbox {
	padding: 50px;
	display: flex;
	justify-content: center;
}

.idinfo .btnbox>button{
	padding: 10px 20px;
	border-radius: 5px;
	background-color: #02343F;
	color: #F0EDCC;
}

.idinfo .btnbox>button:nth-child(2){
	margin-left: 70px;
}

</style>
</head>
<body>
	<c:import url="/WEB-INF/views/header.jsp" />
	
	<div class="idinfo">
		<div class="idbox"><span>${name}</span>님의 아이디는 <span>${userid }</span>입니다.</div>
		<div class="btnbox">
			<button onclick="location.href='pwfind'">Forgot Password</button>
			<button onclick="location.href='signin'">Sign In</button>
		</div>
	</div>
	
	<c:import url="/WEB-INF/views/footer.jsp" />
</body>
</html>
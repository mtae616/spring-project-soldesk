<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- STYLE RESET -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"
	integrity="sha512-NmLkDIU1C/C88wi324HBc+S2kLhi08PN5GDeUVVVC/BVt/9Izdsc9SVeVfA1UZbY3sHUlDSyRXhCzHfr6hmPPw=="
	crossorigin="anonymous" />
<link rel="stylesheet" href="${root }/css/MyPage_delete.css">
<title>MyPage_edit</title>
</head>
<body>
	<c:import url="/WEB-INF/views/header.jsp" />
	<div class="container">
		<form:form id="contact" action="MyPage_delete_proc" method="post" modelAttribute="deleteUserBean">
			<h2>회원탈퇴</h2>
			<fieldset>
				ID
				<form:input type="text" value="${loginUserBean.u_id }"
					readonly="true" path="u_id" />
			</fieldset>
			<fieldset>
				Password
				<form:password path="u_password" placeholder="비밀번호를 적어주세요." />
			</fieldset>
			<fieldset>
				탈퇴 사유를 알려주세요
				<textarea placeholder="사유를 적어주세요." tabindex="5" required></textarea>
			</fieldset>
			<fieldset>
				<form:hidden value="${loginUserBean.u_no }" path="u_no" />
				<form:button name="submit" type="submit" id="contact-submit" data-submit="...Sending">탈퇴하기</form:button>
			</fieldset>
			<p class="copyright">Standhal Sindrom</p>
		</form:form>
	</div>
</body>
</html>
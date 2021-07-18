<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<link rel="stylesheet" href="./css/MyPage_edit.css">
<title>MyPage_edit</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		// 전화번호 입력 정규식
		$("#tel").on("propertychange change keyup paste input", function() {
			$(this).val($(this).val().replace(/[^0-9]/, "").replace(/(^010)([0-9]{4})?([0-9]{4})/, "$1-$2-$3").replace("--", "-"));
		})
	})
	function cl() {
		if ($(this).val().lengh == 13) {
			return true;
		} else {
			alert("올바른 전화번호를 입력해주세요.");
			return false;
		}
	}
</script>
</head>
<body>
	<c:import url="/WEB-INF/views/header.jsp" />

	<div class="editform__wrapper">
		<div class="inner">
			<div class="inner__wrapper">
				<form:form action="MyPage_edit_proc" method="post" modelAttribute="editUserBean" onsubmit="return cl();">
					<div class="idform">
					<form:hidden value="${loginUserBean.u_id }" path="u_id" />
						<span>ID</span>
						<div class="id"><c:out value="${loginUserBean.u_id }" /></div>
					</div>
					<div class="nameform">
						<span>NAME</span>
						<form:input type="text" value="${loginUserBean.u_name }" path="u_name" />
					</div>
					<div class="cellphoneform">
						<span>H.P</span>
						<form:input type="text" value="${loginUserBean.u_tel }" id="tel" path="u_tel" />
					</div>

					<div class="passwordform">
						<span>PW</span>
						<form:password path="u_password" />
					</div>

					<form:button type="submit" class="button">확인하기!</form:button>

				</form:form>
			</div>
		</div>
	</div>
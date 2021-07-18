<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- style reset -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css" integrity="sha512-NmLkDIU1C/C88wi324HBc+S2kLhi08PN5GDeUVVVC/BVt/9Izdsc9SVeVfA1UZbY3sHUlDSyRXhCzHfr6hmPPw==" crossorigin="anonymous" />
	 -->
<link href="${root }/css/footer.css" rel="stylesheet" type="text/css">

<title>Insert title here</title>
</head>
<body>

	<footer>
		<div class="logo">
			<img src="${root }images/footerlogo.png" alt="" />
		</div>
		<div class="inner">

			<ul class="menu">
				<li><a href="javascript:void(0)"> 개인정보처리방침 </a></li>
				<li><a href="javascript:void(0)"> 홈페이지 이용약관 </a></li>
				<li><a href="javascript:void(0)"> CS 핫라인 </a></li>
			</ul>

			<div class="info">
				<span>사업자등록번호 : 000-00-00000</span> <span>(주)Stendhal
					Syndrome</span>
			</div>
			<p class="copyright">
				&copy; <span>2021 Stendhal Syndrome All Rights Reserved.</span>
			</p>

		</div>
	</footer>

</body>
</html>
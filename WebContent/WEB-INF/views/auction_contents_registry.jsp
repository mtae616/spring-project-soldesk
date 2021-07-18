<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<!-- GoogleFonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap"
	rel="stylesheet">
<!-- GoogleIcons -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<link rel="stylesheet" href="./css/auction_contents_registry.css" />
<script src="./js/auction_contents_registry.js"></script>
<title>auction_contents_registry</title>
</head>
<body>

	<c:import url="/WEB-INF/views/header.jsp" />

	<section class="content">
		<div class="inner">
			<div class="content__form">
				<form:form action="auction_contents_registry_proc" modelAttribute="auctionContentBean" method="post">
				
					<div class="sub">
						<span>제목</span><br>
						<form:input path="g_sub" placeholder="작품명을 입력해주세요" class="text1"/><br>
					</div>
					
					<div class="img">
						<span>작품사진</span><br>
						<form:input value="${img }" class="text1" path="g_img" placeholder="작품의 이미지주소를 입력해주세요."/><br>
					</div>
					
					<div class="text">
						<span>내용</span><br>
						<form:textarea class="text2" path="g_text" placeholder="작품을 설명해주세요."/><br>
					</div>
					
					<div class="stime">
						<span>경매시간</span><br>
						<form:input type="datetime-local" path="g_stime" class="text3"/><br>
					</div>
					
					<div class="btnbox">
						<input type="reset" value="다시 쓰기!" class="b1"/>
						<form:button type="submit" class="b1">등록!</form:button>
					</div>
					<form:hidden value="${loginUserBean.u_no }" path="g_writer" />
				</form:form>

			</div>
		</div>
	</section>
	<c:import url="/WEB-INF/views/footer.jsp" />
</body>
</html>
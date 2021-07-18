<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<!-- GoogleFonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap"
	rel="stylesheet">
<!-- GoogleIcons -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<link rel="stylesheet" href="${root }/css/header2.css">
<script type="text/javascript" src="${root}/js/header.js"></script>
</head>
<body>

	<header>
		<div class="inner">
			<a href="${root }main" class="logo"> 
			<img src="${root }images/logo1.png" alt="">
			</a>
			<div class="sub-menu">
				<ul class="menu">
					<c:choose>
						<c:when test="${loginUserBean.u_id ne null }">
							<li><a href="javascript:void(0)">${loginUserBean.u_id }
									님</a></li>
							<li><a href="${root }MyPage">My Page</a></li>
							<li><a href="${root }Logout">Log Out</a></li>
						</c:when>

						<c:otherwise>
							<li><a href="${root }signup">Sign Up</a></li>
							<li><a href="${root }signin">Sign In</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			
			<c:choose>
				<c:when test="${loginUserBean.u_id ne null }">
					<ul class="main-menu">
						<li class="item">
							<div class="item__name">
								<a href="${root }auction">경매하기</a>
							</div>
							<div class="item__contents">
								<div class="contents__menu">
									<ul class="inner">
										<li>경매를 통해 마음에 쏙 드는 Private한 예술품을 소유하거나 판매하세요!</li>
									</ul>
								</div>
							</div>
						</li>
		
						<li class="item">
							<div class="item__name">
								<a href="${root}boardform1">구매신청하기</a>
							</div>
							<div class="item__contents">
								<div class="contents__menu">
									<ul class="inner">
										<li>원하는 예술품을 알려주세요! 당신을 위한 일대일 맞춤제작이 가능합니다.</li>
									</ul>
								</div>
							</div>
						</li>
		
						<li class="item">
							<div class="item__name">
								<a href="${root}boardform2">소통하기</a>
							</div>
							<div class="item__contents">
								<div class="contents__menu">
									<ul class="inner">
										<li>예술을 사랑하는 사람들의 Salon입니다.</li>
									</ul>
								</div>
							</div>
						</li>
						
						<li class="item">
							<div class="item__name">
								<a href="${root }painting">그림판</a>
							</div>
							<div class="item__contents">
								<div class="contents__menu">
									<ul class="inner">
										<li>원하는 그림을 그려보세요!</li>
									</ul>
								</div>
							</div>
						</li>
		
					</ul>
				</div>
				
			</c:when>
				<c:otherwise>
					<ul class="main-menu">
						<li class="item">
							<div class="item__name">
								<a href="${root }signin" onclick="alert1()">경매하기</a>
							</div>
							<div class="item__contents">
								<div class="contents__menu">
									<ul class="inner">
										<li>경매를 통해 마음에 쏙 드는 Private한 예술품을 소유하거나 판매하세요!</li>
									</ul>
								</div>
							</div>
						</li>
		
						<li class="item">
							<div class="item__name">
								<a href="${root}signin" onclick="alert1()">구매하기</a>
							</div>
							<div class="item__contents">
								<div class="contents__menu">
									<ul class="inner">
										<li>원하는 예술품을 알려주세요! 당신을 위한 일대일 맞춤제작이 가능합니다.</li>
									</ul>
								</div>
							</div>
						</li>
		
						<li class="item">
							<div class="item__name">
								<a href="${root}signin" onclick="alert1()">소통하기</a>
							</div>
							<div class="item__contents">
								<div class="contents__menu">
									<ul class="inner">
										<li>예술을 사랑하는 사람들의 Salon입니다.</li>
									</ul>
								</div>
							</div>
						</li>
						
						<li class="item">
							<div class="item__name">
								<a href="${root }painting">그림그리기</a>
							</div>
							<div class="item__contents">
								<div class="contents__menu">
									<ul class="inner">
										<li>원하는 그림을 그려보세요!</li>
									</ul>
								</div>
							</div>
						</li>
		
					</ul>
				</div>
			</c:otherwise>
		</c:choose>
	</header>

</body>
</html>
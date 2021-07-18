
<%@page import="co.sp.beans.Goods"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Auction</title>
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
<link rel="stylesheet" href="./css/auction.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<c:import url="/WEB-INF/views/header.jsp" />
<c:set var="allgoodslength" value="${fn:length(goodslist) }" />
<%
List<Goods> auctionlist = (List<Goods>) request.getAttribute("goodslist");
int size = auctionlist.size();
%>
<script type="text/javascript">
	var now_length;
	
	var goods = document.getElementsByClassName("image");
	var index = 9;
	
	$(function() {
		if(${allgoodslength} <= 9) {
			now_length = ${allgoodslength};
		} else {
			now_length = 9;
		}
		$("#now_length").text(now_length);
		
		var now = Math.floor(new Date().getTime() / 1000);
		<%for (int i = 0; i < size; i++) {%>
			dbtime = Math.floor(new Date('<%=auctionlist.get(i).getG_stime()%>').getTime() / 1000);
			if(now > (dbtime + 7200)) {		// 경매 종료
				$(".proceeding_light").each(function(index) {
					if(index == <%=i%>)
					$(this).css("background-color", "#f2f2f2");
				})
			} else if(now > dbtime) {
				$(".proceeding_light").each(function(index) {
					if(index == <%=i%>)
					$(this).css("background-color", "rgb(65, 167, 80)");
				})
			} else {
				$(".proceeding_light").each(function(index) {
					if(index == <%=i%>)
					$(this).css("background-color", "rgb(230, 63, 45)");
				})
			}
		<%}%>
	})
	
	function cl() {
		for (var i = 0; i < 9; i++) {
			if(goods[index] == null) {
				break;
			}
			goods[index].hidden = false;
			index++;
			now_length++;
		}
		$("#now_length").text(now_length);
	}
</script>
</head>
<body>

	<!-- IMAGE BOARD -->
	<section class="board">
		<div class="inner">
			<div class="board-body">
				<div class="state">
					<div class="red"></div>경매 예정
					<div class="green"></div>경매 진행 중
					<div class="gray"></div>경매 종료
				</div>
				<div class="image-wrapper">
					<c:forEach var="li" items="${goodslist }" varStatus="i">
						<c:choose>
							<c:when test="${i.index < 9 }">
								<div class="image">
									<a href="auction_contents/${li.g_no }"> <img
										src="${li.g_img }" alt="" style="height: 165px;">
										<div class="content">${li.g_sub }
											<div class="proceeding_light"></div>
											<!-- 얘 자체를 원으로 만들어서 backgroundcolor를 변경하도록 할 것. -->
										</div>
									</a>
								</div>
							</c:when>
							<c:otherwise>
								<div class="image" hidden="true">
									<a href="auction_contents/${li.g_no }"> <img
										src="${li.g_img }" alt="" style="height: 165px;">
										<div class="content">${li.g_sub }</div>
									</a>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
			</div>
		</div>

	</section>


	<!-- BUTTON -->
	<section class="btn-group">
		<div class="inner">
			<div class="btn-wrapper">
				<div class="btn--more" onclick="cl()">
					더보기( <span id="now_length"></span> /
					<c:out value="${allgoodslength } " />
					)
				</div>
			</div>

			<div class="btn__register">
				<a href="auction_contents_registry?imglink=">
					<div>등록하기</div>
				</a>
			</div>

		</div>
	</section>

	<c:import url="/WEB-INF/views/footer.jsp"></c:import>
</body>
</html>
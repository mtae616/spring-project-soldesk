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
<title>Insert title here</title>
<!-- STYLE RESET -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"
	integrity="sha512-NmLkDIU1C/C88wi324HBc+S2kLhi08PN5GDeUVVVC/BVt/9Izdsc9SVeVfA1UZbY3sHUlDSyRXhCzHfr6hmPPw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="${root }/css/boardform.css" />
</head>

<body>
	<!-- HEADER -->
	<c:import url="/WEB-INF/views/header.jsp" />

	<div class="container">
		<div class="inner">

			<div class="title">
				<c:choose>
					<c:when test="${name eq 'offer'}">
						<c:out value="구매신청하기" />
					</c:when>
					<c:when test="${name eq 'community'}">
						<c:out value="소통하기" />
					</c:when>
				</c:choose>
			</div>

			<table class="tableform">
				<tr class="tablehead">
					<td class="td_no">글번호</td>
					<td class="td_sub">글제목</td>
					<td class="td_writer">작성자</td>
					<td class="td_date">작성일</td>
					<td class="td_readcnt">조회수</td>
				</tr>

				<c:choose>
					<c:when test="${name eq 'offer'}">
						<input type="hidden" name="page" value="${page}">
						<c:forEach var="board" items="${boardbean }" varStatus="id">
							<tr class="tablebody">
								<td><c:out value="${board.o_no}" /></td>
								<td><a href="${root }contents_info1?command=offer&page=${page}&contents=${board.o_no}">
									<c:out value="${board.o_sub}" />
									<c:choose>
										<c:when test="${board.o_replycnt ne 0}">
											[<c:out value="${board.o_replycnt}" />]
                          					</c:when>
									</c:choose>
								</a></td>
								<td><c:out value="${idlist[id.index]}" /></td>
								<td><c:out value="${board.o_regdate}" /></td>
								<td><c:out value="${board.o_readcnt}" /></td>
							</tr>
						</c:forEach>
					</c:when>

					<c:when test="${name eq 'community'}">
						<input type="hidden" name="page" value="${page }">
						<c:forEach var="board" items="${boardbean }" varStatus="id">
							<tr class="tablebody">
								<td><c:out value="${board.c_no}" /></td>
								<td><a href="${root }contents_info2?command=community&page=${idx2}&contents=${board.c_no}">
									<c:out value="${board.c_sub}" />
									<c:choose>
										<c:when test="${board.c_replycnt ne 0}">
                          						[<c:out value="${board.c_replycnt}" />]
                          					</c:when>
									</c:choose>
								</a></td>
								<td><c:out value="${idlist[id.index]}" /></td>
								<td><c:out value="${board.c_regdate}" /></td>
								<td><c:out value="${board.c_readcnt}" /></td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
			</table>
			<div class="bottom-items">
				<c:choose>
					<c:when test="${name eq 'offer'}">
						<c:choose>
							<c:when test="${pageBean.prevPage<=0 }">
								<a href="#">Prev</a>
							</c:when>
							<c:otherwise>
								<a href="${root }boardform1&page=${pageBean.prevPage}">Prev</a>
							</c:otherwise>
						</c:choose>
						<c:forEach var="idx" begin="${pageBean.min }"
							end="${pageBean.max }">
							<a href="${root }boardform1?page=${idx}">${idx }</a>
						</c:forEach>
						<c:choose>
							<c:when test="${pageBean.max >= pageBean.pageCnt }">
								<a href="#">Next</a>
							</c:when>
							<c:otherwise>
								<a href="${root }boardform1&page=${pageBean.nextPage}">Next</a>
							</c:otherwise>
						</c:choose>
					</c:when>

					<c:when test="${name eq 'community'}">
						<c:choose>
							<c:when test="${pageBean.prevPage<=0 }">
								<a href="${root }barodform2&page=${pageBean.prevPage}">Prev</a>
							</c:when>
							<c:otherwise>
								<a href="${root }boardform2&page=${pageBean.prevPage}">Prev</a>
							</c:otherwise>
						</c:choose>
						<c:forEach var="idx" begin="${pageBean.min }"
							end="${pageBean.max }">
							<a href="${root }boardform2?page=${idx}"><c:out
									value="${idx }" /></a>
						</c:forEach>
						<c:choose>
							<c:when test="${pageBean.max >= pageBean.pageCnt }">
								<a href="${root }boardform2&page=${pageBean.nextPage}">Next</a>
							</c:when>
							<c:otherwise>
								<a href="${root }boardform2&page=${pageBean.nextPage}">Next</a>
							</c:otherwise>
						</c:choose>
					</c:when>
				</c:choose>
			</div>

			<div class="writebtn">
				<c:choose>
					<c:when test="${name eq 'offer' }">
						<button class="btn" onclick="location.href='board_registry1'">글쓰기</button>
					</c:when>
					<c:when test="${name eq 'community' }">
						<button class="btn" onclick="location.href='board_registry2'">글쓰기</button>
					</c:when>
				</c:choose>
			</div>
		</div>
	</div>

	<div class="wrapper">
		<c:import url="/WEB-INF/views/footer.jsp"></c:import>
	</div>
</body>
</html>
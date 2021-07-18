<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>contents_info</title>
<link rel="stylesheet" href="${root }/css/contents_info_edit.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#textarea").val("${communityContentsBean.c_text}");
})
</script>
</head>
<body>
<c:import url="/WEB-INF/views/header.jsp" />
	<section class="content">
		<div class="title">게시글 수정</div>
		<div class="inner">
			<div class="joinform">
				<form:form modelAttribute="editCommunityBean" action="contents_info2_edit_proc" method="post">
					<input type="hidden" name="contents" value="${communityContentsBean.c_no }">
					<input type='hidden' name='page' value='${page }'/>
					<input type='hidden' name='contents' value='${contents }'/>
					<form:hidden value='${communityContentsBean.c_no }' path="c_no"/>
					<form:hidden value="${communityContentsBean.c_regdate }" path="c_regdate"/><br>
					
					<span>제목</span><br><form:input placeholder="제목을 입력해주세요" class="text1" path="c_sub" value="${communityContentsBean.c_sub }"/><br>
					<span>내용</span><br><form:textarea placeholder="내용을 입력해주세요" id="textarea" class="text3" path="c_text" /><br>
					<div class="btnbox">
						<form:button type="submit" class="b1">수정완료</form:button>
						<input type="button" class="b2" onclick="location.href='boardform1?page=${page }'" value="게시판 목록">
						<input type="reset" class="b3" value="다시 작성">
					</div>
				</form:form>
			</div>
		</div>
	</section>
	<c:import url="/WEB-INF/views/footer.jsp" />
</body>
</html>
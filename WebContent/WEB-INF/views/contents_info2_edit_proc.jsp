<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="idx" begin="${pageBean.min }" end="${pageBean.max }">
	<script type="text/javascript">
		alert('완료되었습니다.');
		location.href='contents_info2?command=community&page=${idx}&contents=${editCommunityBean.c_no}';
	</script>
</c:forEach>
</body>
</html>
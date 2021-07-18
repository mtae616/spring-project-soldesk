<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root }/css/boardreply.css" />
</head>
<body>
   <section class="reply">
      <div class="inner">
         
         <form:form action="community_reply_proc" method="post" modelAttribute="communityreplyBean">
            <form:hidden value="${loginUserBean.u_id}" path="cr_writer"/>
         	<form:hidden value="${communityContentsBean.c_no}" path="c_no_re"/>
           	<input type="hidden" name="page" value="${page}">
         	<input type="hidden" name="contents" value="${communityContentsBean.c_no}">
         	<input type="hidden" name="command" value="community">
         	
            <div class="reply__header">댓글</div>
            <div class="reply__submit">
               <form:input type="text" class="text" path="cr_text" />
               <form:button type="submit" class="submit">댓글작성</form:button>
            </div>
            <div class="reply__body">
               <div class="reply_box">
                  <div class="reply__write">작성자</div>
                  <div class="reply__content">내용</div>
               </div>
               <c:forEach var="li" items="${communityli }">
	               <div class="replys">
	                  <div class="reply__writer">${li.cr_writer }</div>
	                  <div class="reply__contents">${li.cr_text }</div>
	               </div>
               </c:forEach>
            </div>
         </form:form>
      </div>
   </section>
</body>
</html>
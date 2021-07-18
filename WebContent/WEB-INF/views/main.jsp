<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Springproject</title>
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
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<!--Gsap scroll-->
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.1/ScrollToPlugin.min.js"
   integrity="sha512-kSI9CgGh60rJbNVeMJvfNX0UTKAq8LEOea/yKJQbFpIroxT7bf9/zUFXbnfsQP5F6xlOOHtCfBPgsE1ceiHnRw=="
   crossorigin="anonymous"></script>

<!-- SWIPER -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<!-- SCROLLMAGIC -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js"
   integrity="sha512-8E3KZoPoZCD+1dgfqhPbejQBnQfBXe8FuwL4z/c8sTrgeDMFEnoyTlH3obB4/fV+6Sg0a0XF+L/6xS4Xx1fUEg=="
   crossorigin="anonymous"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="${root }/css/main.css" rel="stylesheet" type="text/css">
<script defer src="${root }/js/main.js" type="text/javascript"></script>
</head>
<body>

   <!-- HEADER -->
   <c:import url="/WEB-INF/views/header.jsp" />

   <!-- Silder -->
   <section class="slider">
      <div class="inner">
         <div class="swiper-container">
            <div class="swiper-wrapper">
               <div class="swiper-slide">
                  <img src="./images/slide01.jpg" alt="">
               </div>
               <div class="swiper-slide">
                  <img src="./images/slide02.jpg" alt="">
               </div>
               <div class="swiper-slide">
                  <img src="./images/slide03.jpg" alt="">
               </div>
               <div class="swiper-slide">
                  <img src="./images/slide04.jpg" alt="">
               </div>
            </div>
         </div>
         <div class="swiper-pagination"></div>
         <div class="swiper-prev">
            <div class="material-icons">arrow_back</div>
         </div>
         <div class="swiper-next">
            <div class="material-icons">arrow_forward</div>
         </div>
      </div>
   </section>

   <!-- INTRODUCE -->
   <section class="introduce scroll-spy">
      <div class="inner">
         <img class="main__image back-to-position to-top" src="./images/main_logo.png">
      </div>
   </section>

   <section class="commonboard">
      <div class="inner">

         <!-- TRADE BOARD -->
         <section class="board">
            <div class="board-container">
            
	            <div class="title">
	               <div class="buy board-name" id="buybtn">
	                  <a href="boardform1">구매신청하기</a>
	               </div>
	               <div class="community board-name" id="communitybtn">
	                  <a href="boardform2">소통하기</a>
	               </div>
               </div>
               
               <div class="buy board-contents" id="buybox">
                  <ul>
                     <c:set var="boardlength" value="${fn:length(offersub) }" />
                     <c:choose>
                        <c:when test="${boardlength < 6 }">
                           <c:forEach var="board" items="${offersub }" varStatus="idx">
                              <li><a href="contents_info1?command=offer&page=1&contents=${offerno[idx.index]}">
                                    <div><c:out value="${board }" /></div>
                              </a></li>
                           </c:forEach>
                           <c:forEach var="board" begin="1" end="${6 - boardlength}">
                              <li><a href="function:void(0)"><div>등록된 게시글이 없습니다.</div></a></li>
                           </c:forEach>
                        </c:when>
                        <c:when test="${boardlength eq 6 }">
                           <c:forEach var="board" items="${offersub }" varStatus="idx">
                              <li><a
                                 href="contents_info1?command=offer&page=1&contents=${offerno[idx.index]}">
                                    <div><c:out value="${board }" /></div>
                              </a></li>
                           </c:forEach>
                        </c:when>
                     </c:choose>
                  </ul>
               </div>
               
               <div class="community board-contents" id="communitybox">
                  <ul>
                     <c:set var="boardlength" value="${fn:length(communitysub) }" />
                     <c:choose>
                        <c:when test="${boardlength < 6 }">
                           <c:forEach var="board" items="${communitysub }" varStatus="idx">
                              <li><a href="contents_info2?command=community&page=1&contents=${communityno[idx.index]}">
                                    <div><c:out value="${board }" /></div>
                              </a></li>
                           </c:forEach>
                           <c:forEach var="board" begin="1" end="${6 - boardlength}">
                              <li><a href="function:void(0)"><div>등록된 게시글이 없습니다.</div></a></li>
                           </c:forEach>
                        </c:when>
                        <c:when test="${boardlength >= 6 }">
                           <c:forEach var="board" items="${communitysub }" varStatus="idx">
                              <li><a href="contents_info2?command=community&page=1&contents=${communityno[idx.index]}">
                                    <div><c:out value="${board }" /></div>
                              </a></li>
                           </c:forEach>
                        </c:when>
                     </c:choose>
                  </ul>
               </div>
            </div>
         </section>
      </div>
   </section>

   <section class="introduce2"></section>

   <section class="commonboard">
      <div class="inner">
         <div class="warning">
            <div class="title">※주의사항</div>
            <p>1. 결제 시 타인의 명의를 이용할 경우 확인이 어려우니 주의하시기 바랍니다.</p>
            <p>2. Stendhal Syndrome에서 양도된 모든 작품의 저작권은 본인에게 있습니다.</p>
            <p>
               3. 건전한 문화를 위하여 본 사이트에서 주관하지 않는 양도,<br>양수의 책임은 본인에게 있음을 알려드립니다.
            </p>
            <p>4. 문의사항은 아래의 CS 핫라인을 통하여 주시기 바랍니다.</p>
         </div>
      </div>
   </section>

   <c:import url="/WEB-INF/views/footer.jsp" />
</body>
</html>
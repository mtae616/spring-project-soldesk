<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

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

<!--Gsap scroll-->
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.1/ScrollToPlugin.min.js"
   integrity="sha512-kSI9CgGh60rJbNVeMJvfNX0UTKAq8LEOea/yKJQbFpIroxT7bf9/zUFXbnfsQP5F6xlOOHtCfBPgsE1ceiHnRw=="
   crossorigin="anonymous"></script>

<!-- SWIPER -->
<link rel="stylesheet"
   href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<style>
   .inner {
      max-width: 1100px;
      margin: auto;
      position: relative;
   }
   
   strong {
      font-size: 25px;
   }
   
   @
   -webkit-keyframes animation {
      from {opacity: 0;
      -webkit-transform: scale(1.2) rotateX(45deg);
      transform: scale(1.2) rotateX(45deg);
   }
   
   to {
      
   }
   
   }
   @
   -webkit-keyframes animation2 {
      from {opacity: 0;
      -webkit-transform: scale(1.2) rotateX(45deg);
      transform: scale(1.2) rotateX(45deg);
   }
   
   to {
      
   }
   
   }
/*    body * {
      cursor:
         url(https://dl.dropboxusercontent.com/u/50037593/ElasticSlider/images/cur.png),
         auto;
   } */
   
   body {
      /*-webkit-perspective:1000px;*/
      
      cursor:
         url(https://dl.dropboxusercontent.com/u/50037593/ElasticSlider/images/cur.png),
         auto;
      color: #02343F;
   }
   
   @font-face {
      font-family: font;
      src:
         url(https://dl.dropboxusercontent.com/u/50037593/ElasticSlider/hand.ttf);
      font-weight: bold;
   }
   
/* slider */
.slider {
   position: relative;
   margin-top: 50px;
}

.slider .swiper-container {
   position: relative;
   width: 2000px;
   overflow: hidden;
   left: 50%;
   margin-left: calc(2000px/ -2);
}

.slider .swiper-container .swiper-wrapper {
   margin: auto;
}

.slider .swiper-container .swiper-wrapper > .swiper-slide > img{
   width : 500px;
   margin : auto;
}

.slider .swiper-pagination {
   left: 0;
   right: 0;
   margin-top: 10PX;
   z-index: 1;
}

.slider .swiper-pagination .swiper-pagination-bullet {
   width: 12px;
   height: 12px;
   margin-right: 6px;
   outline: none;
}

.slider .swiper-prev, 
.slider .swiper-next {
   width: 42px;
   height: 42px;
   outline : none;
   border-radius: 50%;
   position: absolute;
   z-index: 1;
   cursor: pointer;
   outline: none;
   display: flex;
   justify-content: center;
   align-items: center;
   top: 50%;
   background-color: #02343F;
   color: white;
}

.slider .swiper-prev {
   left: 0;
}

.slider .swiper-next {
   right: 0;
}
   .title {
      position: relative;
      background-color: #02343F;
      color: #F0EDCC;
      margin-top: 150px;
      height: 70px;
      text-align: center;
      font-size: 1.8em;
      padding: 15px;
      line-height: 70px;
   }
   .userInfo{
      width: 500px;
      margin: auto;
      margin-top: 50px;
      font-size: 1.5em;
      letter-spacing: 5px;
      line-height: 40px;
   }
   .bottom-items{
      text-align: center;
      margin-top: 50px;
   }
   .btn{
      width: 150px;
      height: 50px;
      border-radius: 5px;
      background-color: #02343F;
      color: #F0EDCC;
      font-weight: bold;
      font-size: 13px;
   }
   .info1{
      border-bottom: 1px #02343F solid;
      width: 500px;
      line-height: 80px;
   }
   .right-item{
      padding-left: 100px;
   }
   .tel{
      height: 50px;
      border-radius: 5px;
      text-indent: 10px;
   }
</style>
</head>

<body>
   <c:import url="/WEB-INF/views/header.jsp" />

   <div class="inner">

      <div class="title">My Page</div>   
      <div class="userInfo">
         <table>
            <tr class="info1">
               <td>ID</td>
               <td class="right-item">${loginUserBean.u_id }</td>
            </tr>
            <tr class="info1">
               <td>NAME</td>
               <td class="right-item">${loginUserBean.u_name }</td>
            </tr>
            <tr class="info1">
               <td>H.P</td>
               <td class="right-item">${loginUserBean.u_tel }</td>
            </tr>
         </table>
      </div>

      <!-- Silder -->
      <section class="slider">
         <div class="inner">
            <div class="swiper-container">
               <div class="swiper-wrapper">
                  <c:forEach var="img" items="${imglist }">
                     <div class="swiper-slide">
                        <img src="${img }" alt="">
                     </div>
                  </c:forEach>
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

      <div class="bottom-items">
         <input class="btn" type="button" onclick="location.href='main'" value="메인으로 이동" >
         <input class="btn" type="button" value="결제 대기" onclick="location.href='paymentwait'">
         <input class="btn" type="button" onclick="location.href='MyPage_edit'" value="수정" >
        <input class="btn" type="button" value="탈퇴" onclick="location.href='MyPage_delete'">
      </div>
   </div>
   <script>
   new Swiper('.slider .swiper-container',{
      autoplay : true,
      loop : true,
      pagination : {
        el : '.slider .swiper-pagination',
        clickable : true
      },
      navigation : {
        prevEl : '.slider .swiper-prev',
        nextEl : '.slider .swiper-next'
      },
      spaceBetween : 30,
      slidesPerView : 1
    });

</script>
   <c:import url="/WEB-INF/views/footer.jsp"></c:import>
</body>
</html>
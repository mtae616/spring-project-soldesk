<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PaymentWait</title>
<link rel="stylesheet" href="${root }/css/paymentwait.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>
<body>
   <c:import url="/WEB-INF/views/header.jsp" />
   <section class="paymentwait">
      <div class="inner">
         <div class="title">결제 현황</div>
         <ul class="payment__wrapper">
            <li>
               <div class="payment__index title">대기 번호</div>
               <div class="payment__sub title">제목</div>
               <div class="payment__price title">가격</div>
               <div class="payment__yn title">결제여부</div>
            </li>
            <c:forEach var="goods" items="${goodslist }" varStatus="li">
               <li>
                  <div class="payment__index"><c:out value="${li.index + 1}" /></div>
                  <div class="payment__sub"><c:out value="${goods.g_sub}" /></div>
                  <div class="payment__price"><c:out value="${goods.g_price}" /></div>
                  <input class="payment__no" type="hidden" value="${goods.g_no }">
                  <div class="payment__yn" onclick=cl(this)>
                     <button type="button">결제하기</button>
                  </div>
               </li>
            </c:forEach>
         </ul>
      </div>
   </section>
   <c:import url="/WEB-INF/views/footer.jsp" />
   <script defer type="text/javascript">
      function cl(th) {
         var IMP = window.IMP;
         var sub = $(th).parent().children(".payment__sub").text();
         var price = $(th).parent().children(".payment__price").text();
         var no = $(th).parent().children(".payment__no").val();
         IMP.init('imp65951451');
         IMP.request_pay({
            pg : 'kakao',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : sub,
            amount : price,
            buyer_email : 'iamport@siot.do',
            buyer_name : '구매자이름',
            buyer_tel : '010-1234-5678',
            buyer_addr : '서울특별시 강남구 삼성동',
            buyer_postcode : '123-456',
            m_redirect_url : 'https://www.yourdomain.com/payments/complete'
         }, function(rsp) {
            console.log(rsp);
            if (rsp.success) {
               var msg = '결제가 완료되었습니다.';
               msg += '고유ID : ' + rsp.imp_uid;
               msg += '상점 거래ID : ' + rsp.merchant_uid;
               msg += '결제 금액 : ' + rsp.paid_amount;
               msg += '카드 승인번호 : ' + rsp.apply_num;
               location.href="paymentwait_success?content="+no;
            } else {
               var msg = '결제에 실패하였습니다.';
               msg += '에러내용 : ' + rsp.error_msg;
            }
         });
      }
   </script>
</body>
</html>
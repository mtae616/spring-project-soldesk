<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${root }/css/board_registry.css" />
<title>Insert title here</title>
</head>
<body>
	<c:import url="/WEB-INF/views/header.jsp" />
	
	<section class="reg_wrapper">
		<div class="title">글쓰기</div>
		<div class="inner">
			<div class="mask">
				<span data-show>Work of art</span>
				<span>Art work</span>
				<span>illustration</span>
				<span>And so on</span>
            </div>
			<div class="joinform">
				<c:choose>
					<c:when test="${name eq 'offer'}">
						<form:form modelAttribute="offerbean" action="board_registry_proc1" method="post">
							<form:hidden value="${loginUserBean.u_no }" path="o_writer" />
							<span>제목</span> <br><form:input placeholder="제목을 입력해주세요" class="text1" path="o_sub"></form:input><br>
							<form:hidden path="o_regdate"/><br>
							<span>내용</span><br><form:textarea class="text3" path="o_text" placeholder="내용을 입력해주세요" /><br>
							<div class="btnbox">
			                    <form:button type="submit" class="b1">작성완료</form:button>
	             			    <input type="button" onclick="location.href='boardform1'" class="b2" value="메인으로">
								<input type="reset" class="b3" value="다시 작성">
							</div>
						</form:form>
					</c:when>
					
					<c:when test="${name eq 'community'}">
						<form:form modelAttribute="communitybean" action="board_registry_proc2" method="post">
							<form:hidden value="${loginUserBean.u_no }" path="c_writer" />
							<span>제목</span> <br><form:input placeholder="제목을 입력해주세요" class="text1" path="c_sub"></form:input><br>
							<form:hidden path="c_regdate"/><br>
							<span>내용</span><br><form:textarea class="text3" path="c_text" placeholder="내용을 입력해주세요" /><br>
            				<div class="btnbox">
			                    <form:button type="submit" class="b1">작성완료</form:button>
	             			    <input type="button" onclick="location.href='boardform2'" class="b2" value="메인으로">
								<input type="reset" class="b3" value="다시 작성">
							</div>
						</form:form>
					</c:when>
				</c:choose>
			</div>
		</div>
		</section>
		<c:import url="footer.jsp" />
		<script type="text/javascript">
		 setInterval(function () {
		       const show = document.querySelector('span[data-show]')
		       const next = show.nextElementSibling || document.querySelector('span:first-child')
		       const up = document.querySelector('span[data-up]')
		       
		       if (up) {
		         up.removeAttribute('data-up')
		       }
		       
		       show.removeAttribute('data-show')
		       show.setAttribute('data-up', '')
		       
		       next.setAttribute('data-show', '')
		     }, 2000)

		     function init() { 
		const catWrapper = document.querySelector('.cat_wrapper')
		const wrapper = document.querySelector('.wrapper')
		const cat = document.querySelector('.cat')
		const head = document.querySelector('.cat_head')
		const legs = document.querySelectorAll('.leg')
		const pos = {
		  x: null,
		  y: null
		}

		const walk = () =>{
		  cat.classList.remove('first_pose')
		  legs.forEach(leg=>leg.classList.add('walk'))
		}

		const handleMouseMotion = e =>{
		  pos.x = e.clientX
		  pos.y = e.clientY
		  walk()
		}

		const handleTouchMotion = e =>{
		  if (e.targetTouches) return
		  
		  pos.x = e.targetTouches[0].offsetX
		  pos.y = e.targetTouches[0].offsetY
		  walk()
		}

		const turnRight = () =>{
		  cat.style.left = `${pos.x - 90}px`
		  cat.classList.remove('face_left')
		  cat.classList.add('face_right')
		}

		const turnLeft = () =>{
		  cat.style.left = `${pos.x + 10}px`
		  cat.classList.remove('face_right')
		  cat.classList.add('face_left')
		}

		const decideTurnDirection = () =>{
		  cat.getBoundingClientRect().x < pos.x ?
		    turnRight()
		    :
		    turnLeft()
		}

		const headMotion = () =>{
		  pos.y > (wrapper.clientHeight - 100) ?
		    head.style.top = '-15px'
		    :
		    head.style.top = '-30px'
		}

		const jump = () =>{
		  catWrapper.classList.remove('jump')
		  if (pos.y < (wrapper.clientHeight - 250)) {
		    setTimeout(()=>{
		      catWrapper.classList.add('jump')
		    },100)
		  } 
		}

		const decideStop = ()=>{
		  if (cat.classList.contains('face_right') && pos.x - 90 === cat.offsetLeft ||
		      cat.classList.contains('face_left') && pos.x + 10 === cat.offsetLeft) {
		    legs.forEach(leg=>leg.classList.remove('walk'))    
		  }
		}

		setInterval(()=>{
		  if (!pos.x || !pos.y) return
		  decideTurnDirection()
		  headMotion()
		  decideStop()
		},100)

		setInterval(()=>{
		  if (!pos.x || !pos.y) return
		  jump()
		},1000)

		document.addEventListener('mousemove', handleMouseMotion)
		document.addEventListener('mousemove', handleTouchMotion)
		}

		window.addEventListener('DOMContentLoaded', init)
		</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<% 
	request.setCharacterEncoding("UTF-8"); 
	String sessionId = (String)session.getAttribute("sessionId");		//로그인 여부 판단
%>

<nav class="navbar navbar-expand navbar-dark bg-dark">  <!-- 네비게이션 바를 만듦 -->
	<div class="container">  <!-- container라는 클래스부터 내용을 표시함 -->
		<div class="navbar-header">  <!-- 네비게이션 헤더 -->
			<a class="navbar-brand" href="${pageContext.request.contextPath}/welcome.jsp">HOME</a>
		</div>
		
		<!-- 네비게이션 바 요소를 추가 등록 -->
		<div>
			<ul class="navbar-nav mr-auto">		<!-- mr-auto : 마진 공간 자동설정 -->
													<!-- sessionId가 null이면 로그인으로 링크 -->      <!-- 로그인 되어있다면 -->
				<c:choose>									
					<c:when test="${empty sessionId }">
						<li class="nav-item"><a class="nav-link" href='<c:url value="/member/loginMember.jsp" />'>로그인</a></li>
						<li class="nav-item"><a class="nav-link" href='<c:url value="/member/addMember.jsp" />'>회원 가입</a></li>
					</c:when>
					<c:otherwise>
						<li style="padding-top: 7px; color: white;">[ <%=sessionId  %> 님]</li>
						<li class="nav-item"><a class="nav-link" href='<c:url value="/member/logoutMember.jsp" />'>로그아웃</a></li>
						<li class="nav-item"><a class="nav-link" href='<c:url value="/member/updateMember.jsp" />'>회원 수정</a></li>
					</c:otherwise>
					
				</c:choose>
						
				<c:choose>
					<c:when test="${sessionId ne 'admin'}">
						<li class="nav-item"><a href="${pageContext.request.contextPath}/products.jsp" class="nav-link">상품목록</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a href="${pageContext.request.contextPath}/products.jsp" class="nav-link">상품목록</a></li>
						<li class="nav-item"><a href="${pageContext.request.contextPath}/addProduct.jsp" class="nav-link">상품등록</a></li>
						<li class="nav-item"><a href="${pageContext.request.contextPath}/editProduct.jsp?edit=update" class="nav-link">상품수정</a></li>
						<li class="nav-item"><a href="${pageContext.request.contextPath}/editProduct.jsp?edit=delete" class="nav-link">상품삭제</a></li>					
					</c:otherwise>
				</c:choose>
				
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/boardListAction.do?pageNum=1">게시판</a></li>
			</ul>
		</div>
	</div>
</nav>
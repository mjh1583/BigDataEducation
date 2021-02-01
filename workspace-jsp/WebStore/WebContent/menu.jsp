<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>

<nav class="navbar navbar-expand navbar-dark bg-dark">  <!-- 네비게이션 바를 만듦 -->
	<div class="container">  <!-- container라는 클래스부터 내용을 표시함 -->
		<div class="navbar-header">  <!-- 네비게이션 헤더 -->
			<a class="navbar-brand" href="./welcome.jsp">HOME</a>
		</div>
		
		<!-- 네비게이션 바 요소를 추가 등록 -->
		<div>
			<ul class="navbar-nav mr-auto">		<!-- mr-auto : 마진 공간 자동설정 -->
				<li class="nav-item"><a href="products.jsp" class="nav-link">상품목록</a></li>
				<li class="nav-item"><a href="addProduct.jsp" class="nav-link">상품등록</a></li>
				<li class="nav-item"><a href="editProduct.jsp?edit=update" class="nav-link">상품수정</a></li>
				<li class="nav-item"><a href="editProduct.jsp?edit=delete" class="nav-link">상품삭제</a></li>
			</ul>
		</div>
	</div>
</nav>
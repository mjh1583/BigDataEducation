<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>

<nav class="navbar navbar-expand navbar-dark bg-dark">  <!-- 네비게이션 바를 만듦 -->
	<div class="container">  <!-- container라는 클래스부터 내용을 표시함 -->
		<div class="navbar-header">  <!-- 네비게이션 헤더 -->
			<a class="navbar-brand" href="./welcome.jsp">홈</a>
			<a class="navbar-brand" href="./products.jsp">상품목록</a>
			<a class="navbar-brand" href="./addProduct.jsp">상품등록</a>
		</div>
	</div>
</nav>
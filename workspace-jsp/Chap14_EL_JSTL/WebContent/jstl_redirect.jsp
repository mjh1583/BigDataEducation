<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("utf-8");
%>

<!--
	c:redirect <== response.sendRedirect() 기능을 대처함.
			- url : redirect할 URL
	c:param 태그
			- name : 매개변수 이름
			- value : 전달값
-->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL의 redirect태그</title>
</head>
<body>
	<c:redirect url="url_result.jsp">  <!-- 리다이렉트할 페이지를 설정 -->
		<c:param name="id" value="lee" />  <!-- 리다이렉트할 페이지로 전달할 매개변수 설정 -->
		<c:param name="pw" value="1234" />
		<c:param name="name" value="이성계" />
		<c:param name="email" value="leesunggae@gmail.com" />
	</c:redirect>
</body>
</html>
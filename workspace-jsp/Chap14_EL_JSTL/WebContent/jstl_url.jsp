<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("utf-8");
%>

<!-- 
	c:url 태그
		- JSP 페이지에서 URL 정보를 저장하는 기능
		- var : url이 저장된 변수 이름
		- value : url 경로 표시, 생성할 URL, 페이지 url 값을 설정함.
		- 전달할 파라메터 값을 param태그 이용해서 페이지 이동할 때 사용함.
		- url 태그로 페이지 이동하면, get 방식으로 이동함.
 -->

<c:url var="url" value="url_result.jsp">
	<c:param name="id" value="Lee"/>
	<c:param name="pw" value="1234"/>
	<c:param name="name" value="이도"/>
	<c:param name="email" value="leedo@gmail.com"/>
</c:url>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL의 url태그</title>
</head>
<body>
	<a href="${url}">회원정보 출력</a>
</body>
</html>
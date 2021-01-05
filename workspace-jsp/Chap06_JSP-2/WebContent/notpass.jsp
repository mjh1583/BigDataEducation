<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String score = request.getParameter("score");
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>불합격 페이지</title>
</head>
<body>
	<h1><%=name %>님은 <%=score %>점으로 불합격하셨습니다.</h1>
	<a href="score.html">점수 입력</a>
</body>
</html>
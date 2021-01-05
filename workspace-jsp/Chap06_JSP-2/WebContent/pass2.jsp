<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	
	//post 방식으로 받을 때
	String name = (String)pageContext.getSession().getAttribute("name");
	String score = (String)pageContext.getSession().getAttribute("score");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>합격 페이지</title>
</head>
<body>
	<h1><%=name %>님은 <%=score %>점으로 합격하셨습니다.</h1>
	<a href="score2.html">점수 입력</a>
</body>
</html>
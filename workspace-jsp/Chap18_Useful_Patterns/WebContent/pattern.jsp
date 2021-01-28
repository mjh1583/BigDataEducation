<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>확장자 패턴이 모이는 프런트 컨트롤러</title>
</head>
<body>
	<h2>*.do 끝나는 확장자들</h2>
	
	<a href="insert.do">데이터 입력</a><br/>
	<hr/>
	
	<a href="http://localhost:8080<%= request.getContextPath() %>/update.do">데이터 수정</a><br/>
	<hr/>
	
	<a href="<%= request.getContextPath() %>/select.do">데이터 조회</a><br/>
	<hr/>
	
	<a href="delete.do">데이터 삭제</a><br/>
	<hr/>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>인클루드_패럼 테스트</title>
</head>
<body>
	<h2>include 액션 태그 테스트</h2>
	
	<jsp:include page="include_param_result.jsp" flush="false">
		<jsp:param value="이순신" name="name"/>
		<jsp:param value="40" name="age"/>
	</jsp:include>
	<br/>
	
	<h2>다시 include_param.jsp 페이지 입니다.</h2>
</body>
</html>
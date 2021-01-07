<!-- 페이지 지시자 이용해서 isErrorPage속성을 true로 설정함
설정을 해줘야 exception객체를 참조하여 예외 메시지 활용할 수 있음. -->
<%@ page isErrorPage="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>예외 페이지</title>
</head>
<body>
	<%
		/* 200이라는 값은 정상적인 페이지를 의미함. 이와 같이 지정하지 않으면
		컨테이너가 500으로 설정하는 경우가 있음.*/
		response.setStatus(200);
		response.setCharacterEncoding("utf-8");
	%>
	<h1>죄송합니다. 서비스 실행 중 오류가 발생했습니다.</h1><br/>
	<h1>잠시 후 다시 시도해 주세요.</h1><br/>
	<%-- <%= exception.getMessage() %> <br/> --%>
	<img alt="" src="image/error_image.png">
</body>
</html>
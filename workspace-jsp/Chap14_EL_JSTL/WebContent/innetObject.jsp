<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 
	* 표현언어(EL) 내장 객체(내장 변수)
		구분         내장객체
 		--------------------------------------------------------------
		스코프        pageScope
					requestScope
					sessionScope
					applicationScope
		요청매개변수   param
					paramValues
		쿠키 값 		Cookies
		JSP 내용     pageContext
 -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>EL 내장객체</title>
</head>
<body>
	<form action="innerObjectOk.jsp" method="get">
		<p>아이디 : <input type="text" name="id" /></p><br/>
		<p>비밀번호 : <input type="password" name="pw" /></p><br/><br/>
		<input type="submit" value="login" />
	</form>
	
	<%
		//내장 객체들에게 속성들 지정
		application.setAttribute("application_name", "application 내장 객체");
		session.setAttribute("session_name", "session 내장 객체");
		request.setAttribute("request_name", "request 내장 객체");
		pageContext.setAttribute("pageContext_name", "pageContext 내장 객체");
	%>
</body>
</html>
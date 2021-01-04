<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인 결과2</title>
</head>
<body>
	<%
		/* id, password 유효성 검사 */
		if(user_id == null || user_id.length() == 0 || user_pw == null || user_pw.length() == 0) {
	%>
		아이디, 비밀번호를 입력하세요!!<br/>
		<!-- 입력이 되지 않았다면 a태그를 이용해서 다시 로그인 페이지로 이동시킴. -->
		<a href="main.html">로그인 페이지</a>
	<%
		}
		else {
	%>
		<h1>환영합니다. <%=user_id %>님!!</h1>
	<%
		}
	%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인 폼 인증</title>
</head>
<body>
	<!-- 로그인 인증처리를 위해서 폼 태그 작성
		폼의 action을 j_security_check, 사용자명과 비밀번호의 name속성은 
		각각 j_username, j_password 로 설정 -->
	<form action="j_security_check" name="loginForm" method="post">
		<p><b>사용자명 : </b> <input type="text" name="j_username"/></p>
		<p><b>비밀번호 : </b> <input type="password" name="j_password"/></p>
		<p> <input type="submit" value="전송" />
	</form>
</body>
</html>
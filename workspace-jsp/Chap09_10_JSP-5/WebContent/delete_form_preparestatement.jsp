<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Delete 실습</title>
</head>
<body>
	<h2>입력된 DB값 삭제하기</h2>
	<form action="delete_preparestatement.jsp" method="post">
		<p>아이디 : <input type="text" name="id"/> </p>
		<p>비밀번호 : <input type="password" name="pw"/> </p>
		<p>이름 : <input type="text" name="username"/> </p>
		<p><input type="submit" value="전송"/> </p>
	</form>
</body>
</html>
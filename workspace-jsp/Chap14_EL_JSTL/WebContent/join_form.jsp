<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 가입 폼</title>
</head>
<body>
	<h1 style="text-align: center;">회원 등록창</h1>
	<form action="out.jsp" method="post">
		<table border="1" align="center">
			<tr>
				<td width="100"><p align="right">아이디</p></td>
				<td width="200"><input type="text" name="id"/></td>
			</tr>
			<tr>
				<td width="200"><p align="right">비밀번호</p></td>
				<td width="400"><input type="password" name="pw"/></td>
			</tr>
			<tr>
				<td width="200"><p align="right">이름</p></td>
				<td width="400"><input type="text" name="name"/></td>
			</tr>
			<tr>
				<td width="200"><p align="right">이메일</p></td>
				<td width="400"><input type="email" name="email"/></td>
			</tr>
			<tr>
				<td align="center" colspan="2" width="400">
					<input type="submit" value="가입하기"/>
					<input type="reset" value="다시입력"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
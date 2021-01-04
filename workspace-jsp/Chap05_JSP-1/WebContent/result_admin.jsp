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
	<title>관리자 로그인 결과</title>
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
			if(user_id.equals("admin")) {
	%>
		<h1>관리자로 로그인 했습니다.</h1>
		<form action="#">
			<input type="button" value="회원정보 리스트 보기" /><br/>
			<input type="button" value="회원정보 수정하기" /><br/>
			<input type="button" value="회원정보 삭제하기" /><br/>
		</form>
	<%
			}
		}
	%>
</body>
</html>
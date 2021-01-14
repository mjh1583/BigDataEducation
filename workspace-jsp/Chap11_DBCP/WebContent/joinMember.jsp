<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>신규 회원 가입</title>
</head>
<body>
	<h2>신규 회원 가입</h2>
	<form action="joinOk.jsp" method="post">
		<p><b>이름 : </b><input type="text" name="username" placeholder="이름을 입력하세요." required="required" /></p>
		<p><b>아이디 : </b><input type="text" name="id" placeholder="아이디를 입력하세요." required="required" /></p>
		<p><b>비밀번호 : </b><input type="password" name="pw" placeholder="비밀번호를 입력하세요." required="required" /></p>
		<p><b>폰 : </b><input type="number" name="phone1" size="3"/> - <input type="number" name="phone2" size="4"/>
		-<input type="number" name="phone3" size="4"/></p>
		<p><b>성별 : </b><input type="radio" name="gender" value="남자" />남자
		<input type="radio" name="gender" value="여자" />여자</p><br/>
		<input type="submit" value="회원가입" /> &nbsp;&nbsp;&nbsp;	
		<input type="reset" value="재입력" />
	</form>
</body>
</html>
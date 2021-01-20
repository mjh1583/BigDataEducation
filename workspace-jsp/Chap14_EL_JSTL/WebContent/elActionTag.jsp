<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- useBean 사용 객체 생성 -->
<jsp:useBean id="member" class="kr.gov.el.MemberInfo"></jsp:useBean>

<!-- jsp:setProperty 액션 태그를 이용하여 member에 값을 저장함. -->
<jsp:setProperty property="name" value="이도" name="member"/>
<jsp:setProperty property="id" value="Lee" name="member"/>
<jsp:setProperty property="pw" value="1234" name="member"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>액션 태그와 EL표기법</title>
</head>
<body>
	<p>액션 태그 사용</p>
	<p>이름 : <jsp:getProperty property="name" name="member"/></p>
	<p>아이디 : <jsp:getProperty property="id" name="member"/></p>
	<p>비밀번호 : <jsp:getProperty property="pw" name="member"/></p>
	<br/><br/><br/><br/><br/>
	
	<p>EL표기법은 코드 가독성 향상과 표기법이 간단해서 코드 절약 효과 있음.</p>
	<p>이름 : ${member.name}</p>
	<p>아이디 : ${member.id}</p>
	<p>비밀번호 : ${member.pw}</p>
	
</body>
</html>
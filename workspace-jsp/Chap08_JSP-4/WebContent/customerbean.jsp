<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>

<!-- Customer 클래스를 사용하겠다라고 useBean 태그를 사용함. -->
<jsp:useBean id="customer" class="kr.gov.bean2.Customer" scope="page"/>

<!-- 클라이언트가 입력한 값 전부를 저장하는 코드임-->
<jsp:setProperty property="*" name="customer"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입 결과</title>
</head>
<body>
	<h2>회원 정보 출력</h2>
	<strong>아이디 : </strong><%= customer.getId() %><br/>
	<strong>비밀번호 : </strong><%= customer.getPw() %><br/>
	<strong>이름 : </strong><%= customer.getName() %><br/>
	<strong>생년월일 : </strong><%= customer.getBirthday() %><br/>
	<strong>주소 : </strong><%= customer.getAddress() %><br/>
	<strong>이메일 : </strong><%= customer.getEmail() %><br/>
</body>
</html>
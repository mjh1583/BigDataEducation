<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	1. 세션(session)
		- 웹 페이지들 사이의 공유 정보를 서버의 메모리에 저장해 놓고 사용하는 방법
	2. 세션의 특징
		- 정보가 서버의 메모리에 저장
		- 쿠키보다 보안에 유리
		- 브라우저(사용자)당 한개의 세션(sessionID)이 생성됨
		- 세션은 유효 시간을 가짐(30분)
		- 로그인 상태 유지 기능이나 쇼핑몰의 장바구니 담기 기능등에 주로 사용됨.
 -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>세션 만들기</title>
</head>
<body>
	<%
		//세션의 속성을 지정하는 코드
		session.setAttribute("gumi", 202102);
		session.setAttribute("zoom", "jsp");
		session.setAttribute("daegu", "mysql");
		
		/* 스크립트릿으로 내부객체인 session객체를 이용하여 값을 설정함
		   현재 이 jsp파일이 서버에 요청을 하게 되면 컨테이너가 jsp파일 서블릿으로 변환함.
		   =>session 객체가 자동으로 생성되면서 컴파일 이루어짐.*/
	%>
	<a href="sessionGet.jsp">세션값 확인</a>
</body>
</html>
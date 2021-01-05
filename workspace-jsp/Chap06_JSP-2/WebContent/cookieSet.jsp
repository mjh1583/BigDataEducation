<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 쿠키(Cookie)
	- 웹 페이지들 사이의 공유 정보를 클라이언트 PC에 저장해 놓고 사용함.
	  보안이 취약함.
	  클라이언트 브라우저에서 사용 유무를 설정할 수 있음.
 -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>쿠키 만들기</title>
</head>
<body>
	<h1>서버에서 쿠키를 생성하는 cookieSet.jsp 페이지 입니다.</h1>
	<%
		System.out.println("(아래)서버에서 쿠키를 생성하였으며, 응답하기 위해서 response객체에 추가 하였습니다.");
		
		request.setCharacterEncoding("utf-8");
		
	%>
</body>
</html>
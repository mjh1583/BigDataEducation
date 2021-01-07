<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>메인 페이지</title>
</head>
<body>
	<!-- h1태그 부분은 잠깐 출력은 될 것임. 육안으로 확인 안됨.
	forward 액션 태그를 이용하여 sub.jsp 페이지로 이동하라고 코딩했음. -->
	<h1>main.jsp 페이지 입니다.</h1>
	<%
		System.out.println("sub.jsp 페이지 이동하기 전 main.jsp 페이지 입니다.");
		//sendRedirect()는 URL 주소가 바뀜
		//response.sendRedirect("sub.jsp");
	%>
	<!-- forward 액션 태그 : URL 주소는 main.jsp로 변하지 않고, 페이지 이동만 일어나서
	사용자에게 보여주는 페이지가 sub.jsp 페이지가 됨. 이게 forward 액션 태그의 특징임. -->
	<jsp:forward page="sub.jsp"/>
</body>
</html>
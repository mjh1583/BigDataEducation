<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>forward 태그, param 태그 테스트</title>
</head>
<body>
	<h1>forward_param.jsp 페이지 입니다.</h1>
	<%
		System.out.println("sub.jsp 페이지 이동하기 전 forward_param.jsp 페이지 입니다.");
	%>
	
	<!-- forward 액션 태그를 이용하고 그 안에서 jsp:param 액션 태그를 이용하여 파라메터들을 전달하고 있음.
	페이지 이동에 있어서 내부객체인 request객체는 서로 공유하기 때문에 forward_param_result.jsp 페이지에서는
	request를 이용하여 파라메터 값을 참조하면 됨. -->
	<jsp:forward page="forward_param_result.jsp">
		<jsp:param value="gumi" name="id"/>
		<jsp:param value="202101" name="pw"/>
	</jsp:forward>
</body>
</html>
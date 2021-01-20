<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>내장 객체 저장값 출력하기</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
	%>
	
	<!-- 표현식으로 값을 출력하는 부분 -->
	<p>아이디 : <%= id %></p><br/>
	<p>비밀번호 : <%= pw %></p><br/>
	
	<p>아이디 : ${param.id}</p><br/>
	<p>비밀번호 : ${param.pw}</p><br/>
	
	<!-- applicationScope 내장 객체는 웹프로젝트에 전부 적용이 되는 값
	sessionScope : 한 브라우저당 발생하므로 역시 값이 출력될 것임/ -->
	<p>applicationScope : ${applicationScope.application_name}</p><br/>
	<p>sessionScope : ${sessionScope.session_name}</p><br/>
	
	<!-- pageScope와 requestScope 내장 객체 : 현재 페이지는 적용이 되지 않아 결과값이 출력되지 않음 -->
	<p>pageScope : ${pageScope.pageContext_name}</p><br/>
	<p>requestScope : ${requestScope.requestScope_name}</p><br/>
	
	<!-- 
		소결론 : EL태그는 개발하는데 있어 기존 산출물 소스에 내용을 해독할 수 있어야 함.
			    EL태그를 잘 이용하면 코드 양을 줄이고 가독성을 높일 수 있음.
			    보안에 취약함.
	 -->
	
</body>
</html>
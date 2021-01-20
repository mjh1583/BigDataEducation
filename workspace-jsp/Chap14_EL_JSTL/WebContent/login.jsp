<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 자바로 구현한 변수 선언, 조건식, 반복문 기능등을 태그로 대처함 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<!--
	pageContext 내장 객체를 이용하여
	contextPath (웹프로그램 이름)에다가 미리 경로(path)를 저장해둠
	==> 경로를 설정하거나 경로 관련된 부분에 쉽게 적용할 수 있음.
 -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" scope="application"/>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL라이브러리 set태그-컨텍스트 이름</title>
</head>
<body>
	<form action="#" method="post">
		<p>아이디 : <input type="text" name="id"/></p>
		<p>비밀번호 : <input type="password" name="pw"/></p>
		<p><input type="submit" value="로그인"/></p>
	</form>
	
	<p>컨텍스트 패스 값 : ${contextPath}</p>
	
	<!-- 내장객체의 다소 긴 속성을 사용할 필요가 없이 간단한 변수이름으로 컨텍스트 패스 사용 -->
	<a href="${contextPath}/join/member.jsp">회원가입</a>
</body>
</html>
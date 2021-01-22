<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- fmt 태그 라이브러리 사용하기위해 taglib 지시자 설정 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>다국어처리-fmt태그-01(로케일)</title>
</head>
<body>
	<p>-------------------------------------기본 로케일-----------------------------------------</p>
	<!-- 가져올 번들을 resourceBundle변수에 저장함. -->
	<fmt:setBundle basename="kr.gov.bundle.myBundle_ko" var="resourceBundle"/>
	<p>제목 : <fmt:message key="title" bundle="${resourceBundle}" /></p>  <!-- 지정한 언어에 해당하는 언어를 표시함 -->
	<!-- username의 키를 주면 value값 관리자를 리턴하는데 그 값을 user 변수에 저장 -->
	<p><fmt:message key="username" var="user" bundle="${resourceBundle}" /></p>
	이름 : ${user}
	<p>비밀번호 : <fmt:message key="password" bundle="${resourceBundle}" /></p>
	
	<p>-------------------------------------영문 로케일-----------------------------------------</p>
	<fmt:setLocale value="en"/>  <!-- 로케일 지정 -->
	<fmt:setBundle basename="kr.gov.bundle.myBundle_en" var="resourceBundle"/>
	<p>제목 : <fmt:message key="title" bundle="${resourceBundle}" /></p> 
	<p><fmt:message key="username" var="user" bundle="${resourceBundle}" /></p>
	이름 : ${user}
	<p>비밀번호 : <fmt:message key="password" bundle="${resourceBundle}" /></p>
	
</body>
</html>
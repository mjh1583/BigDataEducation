<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>인증 처리페이지(Security)</title>
</head>
<body>
	<p><b>사용자명 : </b><%= request.getRemoteUser() %></p>  <!-- 인증된 사용자명을 가져옴 -->
	<p><b>인증방법 : </b><%= request.getAuthType() %></p>  <!-- 인증방법이 어떤것인지 가져옴 -->
	
	<p><b> 인증한 사용자명이 역할명 "tomcat"에 속하는 사용자인가? <%= request.isUserInRole("tomcat") %></b></p>
	<p><b> 인증한 사용자명이 역할명 "role1"에 속하는 사용자인가? <%= request.isUserInRole("role1") %></b></p>
	
	<p><b> 프로토콜이 무엇인가? <%= request.getProtocol() %></b></p>
	<p><b> https 요청으로 요청이 들어왔나요? <%= request.isSecure() %></b></p>
</body>
</html>
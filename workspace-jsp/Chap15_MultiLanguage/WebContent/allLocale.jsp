<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>모든 Locale 인자값 출력하기</title>
</head>
<body>
	<%
		for(Locale locale : Locale.getAvailableLocales()) {
	%>
		<p>언어 코드 : <%= locale.getLanguage() %></p>
		<p>국가 코드 : <%= locale.getCountry() %></p>
		<p>국가 명 : <%= locale.getDisplayCountry() %></p>
		<p>언어, 국가 : <%= locale.getDisplayName() %></p>
	<%
		}
	%>
	<p>총 locale 수 : <%= Locale.getAvailableLocales().length %></p>
</body>
</html>
<%@page import="java.util.TimeZone"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>다국어처리-fmt태그-04(타임존)</title>
</head>
<body>
	<p><jsp:useBean id="now" class="java.util.Date" /></p>
	
	<p>한국 : <fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/></p>
	
	<p><fmt:timeZone value="America/New_York" >
		<p>뉴욕 : <fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/> </p>
	</fmt:timeZone></p>
	
	<p><fmt:timeZone value="Europe/London" >
		<p>런던 : <fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/> </p>
	</fmt:timeZone></p>
	
	<h2>타임존 목록</h2>
	<c:forEach var="id" items="<%= TimeZone.getAvailableIDs() %>">
		타임존 이름 : ${id}<br/>
	</c:forEach>
	
	<p>총 타임존의 수 : <c:out value="<%= TimeZone.getAvailableIDs().length %>"/></p>
</body>
</html>
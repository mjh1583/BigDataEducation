<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>다국어처리-fmt태그-03(날짜)</title>
</head>
<body>
	<!-- jsp:useBean 액션 태그 이용하여 Date객체 생성하고 now를 참조변수로 생성 -->
	<p><jsp:useBean id="now" class="java.util.Date"/> </p>
	
	<!-- type에 따라 출력내용 바뀜 -->
	<p>date 타입 : <fmt:formatDate value="${now}" type="date" /></p>
	<p>time 타입 : <fmt:formatDate value="${now}" type="time" /></p>
	<p>both 타입 : <fmt:formatDate value="${now}" type="both" /></p>
	
	<!-- dateStyle에 따라 출력 내용이 바뀜 -->
	<p>default 스타일 : <fmt:formatDate value="${now}" type="both" dateStyle="default"/></p>
	<p>short 스타일 : <fmt:formatDate value="${now}" type="both" dateStyle="short"/></p>
	<p>medium 스타일 : <fmt:formatDate value="${now}" type="both" dateStyle="medium"/></p>
	<p>long 스타일 : <fmt:formatDate value="${now}" type="both" dateStyle="long"/></p>
	<p>full 스타일 : <fmt:formatDate value="${now}" type="both" dateStyle="full"/></p>
	
	<!-- 직접 패턴을 주는 방법 -->
	<p>패턴주기 : <fmt:formatDate value="${now}" type="both" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초 E요일"/></p>
	<p>패턴주기 : <fmt:formatDate value="${now}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></p>
</body>
</html>
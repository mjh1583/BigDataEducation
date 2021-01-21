<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <!-- core 태그 라이브러리를 사용하기 위해 반드시 선언 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<%
	List<String> dataList = new ArrayList<>();  //인터페이스의 다형성
	dataList.add("반갑습니다.");
	dataList.add("축하합니다.");
	dataList.add("안녕하세요.");  //ArrayList에 3개의 String 객체 저장하는 코드
%>

<c:set var="list" value="<%= dataList %>" />  <!-- list라는 변수에 dataList를 저장 -->

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL라이브러리 forEach태그</title>
</head>
<body>
	<!-- JSP페이지에서 반복문을 수행하는 태그 
		- var : 반복할 변수 이름
		- begin : 반복 시작값
		- end : 반복 종료값
		- step : 한번 반복할때마다 반복 변수를 증가시킬 값
		- varStatus : 반복 상태 속성
					count - 몇번째 반복인지 나타내는 속성, 1부터 시작함
					index - 0부터 시작
					first - 첫번째 반복인지 나타냄
					last - 마지막 반복인지 나타냄
	 -->
	<c:forEach var="i" begin="1" end="10" step="1" varStatus="loop" >
		i = ${i} &nbsp;&nbsp;&nbsp;&nbsp; 반복횟수 : ${loop.count}<br/>
	</c:forEach>
	
	<c:forEach var="i" begin="1" end="10" step="2" >
		10 * ${i} = ${10 * i} &nbsp;&nbsp;&nbsp;&nbsp;<br/>
	</c:forEach>
	
	<c:forEach var="data" items="${list}" >  <!-- ArrayList 컬렉션에 저장된 객체를 하나씩 가져와서 처리 -->
		${data} <br/>
	</c:forEach>
	
	<c:set var="car" value="소나타, 그랜저, 제네시스, 아반떼" />
	<c:forTokens items="${car}" delims="," var="token">  <!-- 구분자(delims)-콤마를 이용하여 문자열을 분리해 출력함 -->
		${token} <br/>
	</c:forTokens>
	
</body>
</html>
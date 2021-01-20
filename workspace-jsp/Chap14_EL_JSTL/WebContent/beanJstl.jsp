<%@page import="kr.gov.jstl.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("utf-8");
%>

<!-- useBean 액션 태그 이용하여 컬렉션 객체들 가져옴. -->
<jsp:useBean id="membersList" class="java.util.ArrayList"/>
<jsp:useBean id="membersMap" class="java.util.HashMap"/>

<%
	//HashMap에 값 저장
	membersMap.put("id", "Lee");
	membersMap.put("pw", "1234");
	membersMap.put("name", "이방원");
	membersMap.put("email", "leebangwon@gmail.com");
	
	//멤버 객체 생성
	Member member1 = new Member("ha", "1234", "하륜", "ha@gmail.com");
	Member member2 = new Member("jung", "1234", "정도전", "jung@gmail.com");
	
	//ArrayList에 객체 추가
	membersList.add(member1);
	membersList.add(member2);
	
	membersMap.put("membersList", membersList);
	
%>

<c:set var="membersList" value="${membersMap.membersList}"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL라이브러리 set태그-bean 활용</title>
</head>
<body>
	<table border="1">
		<tr align="center" bgcolor="yellow">
			<td width="20%"><b>아이디</b></td>
			<td width="20%"><b>비밀번호</b></td>
			<td width="20%"><b>이름</b></td>
			<td width="20%"><b>이메일</b></td>
		</tr>
		
		<!-- HashMap에 직접 저장한 것을 출력함. -->
		<tr align="center">
			<td>${membersMap.id}</td>
			<td>${membersMap.pw}</td>
			<td>${membersMap.name}</td>
			<td>${membersMap.email}</td>
		</tr>
		
		<!-- ArrayList에 저장된 객체임. 2개의 객체를 다시 HashMap에 저장을 함. -->
		<tr align="center">
			<td>${membersList[0].id}</td>
			<td>${membersList[0].pw}</td>
			<td>${membersList[0].name}</td>
			<td>${membersList[0].email}</td>
		</tr>
		
		<tr align="center">
			<td>${membersList[1].id}</td>
			<td>${membersList[1].pw}</td>
			<td>${membersList[1].name}</td>
			<td>${membersList[1].email}</td>
		</tr>
	</table>
</body>
</html>
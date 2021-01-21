<%@page import="java.util.ArrayList"%>
<%@page import="kr.gov.jstl.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("utf-8");
%>

<%
	List<Member> membersList = new ArrayList<>();  //인터페이스 다형성
	
	Member member1 = new Member("lee", "1234", "이성계", "lee@gmail.com");
	Member member2 = new Member("jung", "1234", "정도전", "jung@gmail.com");
	Member member3 = new Member("ha", "1234", "하륜", "ha@gmail.com");
	
	membersList.add(member1);
	membersList.add(member2);
	membersList.add(member3);  /* ArrayList에 3개의 Member객체 저장 */
%>

<!-- membersList라는 변수에 membersList 값 할당 -->
<c:set var="membersList" value="<%= membersList %>" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL forEach태그</title>
</head>
<body>
	<table border="1">
		<tr align="center" bgcolor="lightgreen">
			<td width="7%"><b>아이디</b></td>
			<td width="7%"><b>비밀번호</b></td>
			<td width="5%"><b>이름</b></td>
			<td width="5%"><b>이메일</b></td>
		</tr>
	
		<c:forEach var="member" items="${membersList}">
			<tr align="center" >
				<td>${member.id} </td>
				<td>${member.pw} </td>
				<td>${member.name} </td>
				<td>${member.email} </td>
			</tr>
		</c:forEach>  <!-- 향상된 for문 형태로 객체들을 가져와 출력 -->
		
	</table>
</body>
</html>
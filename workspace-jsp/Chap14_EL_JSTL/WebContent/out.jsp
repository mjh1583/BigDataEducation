<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL out태그</title>
</head>
<body>
	<table border="1">
		<tr align="center" bgcolor="yellow">
			<td width="7%"><b>아이디</b></td>
			<td width="7%"><b>비밀번호</b></td>
			<td width="7%"><b>이름</b></td>
			<td width="7%"><b>이메일</b></td>
		</tr>
		
		<tr	align="center">
			<td><c:out value="${param.id}"/></td>
			<td><c:out value="${param.pw}"/></td>
			<td><c:out value="${param.name}"/></td>
			<td><c:out value="${param.email}"/></td>
		</tr>
		
		<tr	align="center">
			<td><%=id %></td>
			<td><%=pw %></td>
			<td><%=name %></td>
			<td><%=email %></td>
		</tr>
		
		<!-- 
			c:out 태그
				- 화면에 지정한 값을 출력하는 기능
				- value : 출력값
				- escapeXml : escape 문자를 반환여부 지정(생략가능, 기본값 true)
								<	&lt;
								>	$gt;
								&	&amp;
		 -->
		<tr align="center">
			<td><c:out value="&lt" escapeXml="true"/></td>  <!-- value의 &lt; 그대로 출력 -->
			<td><c:out value="&lt" escapeXml="false"/></td>  <!-- value의 &lt;에 해당하는 특수문자로 변환되어 출력됨 -->
			<td><c:out value="&gt" escapeXml="true"/></td>
			<td><c:out value="&gt" escapeXml="false"/></td>
		</tr>
	</table>
</body>
</html>
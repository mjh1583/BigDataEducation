<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>폼태그 포워드 결과2</title>
</head>
<body>
	<h1>포워드 된 페이지(forward_form_result02.jsp)</h1>
	<% request.setCharacterEncoding("utf-8"); %>
	
	<!-- forward_form.jsp 파일에서 입력받은 부분을 출력하고 있음. -->
	<!-- 폼태그를 이용해서 데이터 전송하면 URL이 바뀌고, forward 액션 태그는 URL 바뀌지 않음.
	forward 액션 태그는 제어권을 포워딩되는 페이지로 완전히 넘기고 그 페이지가 끝이 나면 모든
	응답을 종료함. -->
	<table border="1" bgcolor="aqua">
		<tr>
			<td>이름</td>
			<td><%= request.getParameter("name") %></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><%= request.getParameter("age") %></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><%= request.getParameter("address") %></td>
		</tr>
		<tr>
			<!-- 전화번호 경우는 forward_form_result01.jsp 파일에서 param 액션 태그로 넘어온 값임. -->
			<td>전화번호</td>
			<td><%= request.getParameter("tel") %></td>
		</tr>
	</table>
</body>
</html>
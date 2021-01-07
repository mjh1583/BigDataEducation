<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>폼태그 포워드 결과1</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		System.out.println("forward_form_result01.jsp 지나감.");
	%>
	
	<jsp:forward page='<%= request.getParameter("forwardPage") %>'>
		<jsp:param value="053-1588-1599" name="tel"/>
	</jsp:forward>
	
	<!-- forward 액션 태그를 이용해서 forward_form.jsp에서 form태그로 요청한 hidden 속성을 지정한 값으로
	페이지 이동 시킴. 추가로 param 액션 태그를 이용해서 tel값을 넘기고 있음.
	여기서 넘어온 값을 가져가기 위한 것은 스크립트릿 양 옆에 ''로 감싸야 함. -->
</body>
</html>
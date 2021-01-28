<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 
	* redirect를 이용한 포워딩
		: 서블릿의 요청이 클라이언트의 웹 브라우저를 다시 거쳐 요청되는 방식
		1) 클라이언트의 웹 브라우저에서 첫번째 서블릿에 요청함
		2) 첫번째 서블릿은 sendRedirect() 메서드를 이용해 두번째 서블릿을 웹 브라우저를 통해서 요청
		3) 웹 브라우저는 sendRedirect() 메서드가 지정한 두번째 서블릿을 다시 요청
 -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>redirect 포워드 결과</title>
</head>
<body>
	<%
		String id = (String)request.getAttribute("id");
		String pw = (String)request.getAttribute("pw");
		
		String name = (String)session.getAttribute("name");
		String season = (String)session.getAttribute("season");
		
		out.println("id : " + id + "<br/>");
		out.println("pw : " + pw + "<br/>");
		
		out.println("name : " + name + "<br/>");
		out.println("season : " + season + "<br/>");
	%>
</body>
</html>
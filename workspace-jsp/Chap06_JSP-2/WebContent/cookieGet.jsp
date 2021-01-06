<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>쿠키 속성 읽기</title>
</head>
<body>
	<h1>쿠키 속성들의 내용을 읽는 cookieGet.jsp 페이지 입니다.</h1>
	
	<%
		System.out.println("서버에서 쿠키를 생성하였으며, 생성된 쿠키의 값을 출력해봅니다.");
		
		//요청들어오는 쿠키들의 값들을 받음.
		Cookie[] cookies = request.getCookies();
		
		for(int i = 0; i < cookies.length; i++) {
			String name = cookies[i].getName();
			String value = cookies[i].getValue();
			if(name.equals("gumi")) {
				out.println("cookies[" + i + "]'s name : " + name);
				out.println("<br/>");
				out.println("cookies[" + i + "]'s value : " + value);
				out.println("<br/>");
			}
		}
	%>
	<br/><br/>
	<a href="cookieDel.jsp">쿠키 삭제</a>
</body>
</html>
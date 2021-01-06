<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그아웃</title>
</head>
<body>
	<%
		Cookie[] cookies = request.getCookies();
		
		for(int i = 0; i < cookies.length; i++) {
			String id = cookies[i].getValue();  //실제 아이디 값 얻는 코드
			
			if(id.equals("gumi")) {	
				cookies[i].setMaxAge(0);  //쿠키 삭제됨.
				response.addCookie(cookies[i]);  //쿠키가 변경되었으니 다시 추가함.
				out.println(id + "님이 로그아웃 하셨습니다.");
			}
		}
	%>
	<br/><br/>
	<a href="cookieCheck.jsp">쿠키 확인</a>
</body>
</html>
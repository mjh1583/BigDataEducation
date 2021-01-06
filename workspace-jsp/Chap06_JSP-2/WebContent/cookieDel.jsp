<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>쿠키 삭제</title>
</head>
<body>
	<h1>쿠키 속성을 삭제하는 cookieDel.jsp 페이지 입니다.</h1>
	<%
		System.out.println("(아래) 서버에서 쿠키를 삭제하였습니다.");
		
		//요청들어오는 쿠키들의 값들을 받음.
		Cookie[] cookies = request.getCookies();
		
		for(int i = 0; i < cookies.length; i++) {
			String name = cookies[i].getName();  // 쿠키 이름을 얻음
			String value = cookies[i].getValue();  //쿠키 값을 얻음
			if(name.equals("gumi")) {
				out.println("cookies[" + i + "]'s name : " + name);
				out.println("<br/>");
				out.println("cookies[" + i + "]'s value : " + value);
				out.println("<br/>");
				cookies[i].setMaxAge(0);  //유효기간을 0초로 설정 => 삭제하는 효과와 동일함.
				//쿠키 수정이 있었으므로 다시 response객체에 쿠키추가함.
				response.addCookie(cookies[i]);
			}
		}
	%>
	<br/><br/>
	<a href="cookieCheck.jsp">쿠키 확인</a>
</body>
</html>
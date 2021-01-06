<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>쿠키 확인</title>
</head>
<body>
	<h1>쿠키 속성이 삭제된 것을 확인하는 cookieCheck.jsp 페이지 입니다.</h1>
	<%
		System.out.println("현재 쿠키 체크해봅니다.");
	
		Cookie[] cookies = request.getCookies();
		
		//유효한 쿠키 체크
		if(cookies != null) {
			for(int i = 0; i < cookies.length; i++) {
				out.println("현재 남아있는 쿠키 이름 : " + cookies[i].getName());
				out.println("<br/>");
				out.println("현재 남아있는 쿠키 값 : " + cookies[i].getValue());
				out.println("<br/>");
			}
		}
		
		/* 
			확인해보니
			현재 남아있는 쿠키 이름 : JSESSIONID                       --> 서버에서 생성함
			현재 남아있는 쿠키 값 : 271371CD66C34634A05EFC3C7F6F9316   --> 서버에서 생성함
			위의 이름과 값은 그냥 무시하면 됨.(이부분은 항상 출력됨)
		*/
		/* 
			(여기서 반드시 기억해야 할것은) 쿠키를 생성하고 response객체에 추가해주어야함.
			또한 변경이 일어나면 반드시 response객체에 재추가 해주어야함.
			=> 쿠키값이 일관성 있게 유지됨.
		*/
	%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 쿠키(Cookie)
	- 웹 페이지들 사이의 공유 정보를 클라이언트 PC에 저장해 놓고 사용함.
	  보안이 취약함.
	  클라이언트 브라우저에서 사용 유무를 설정할 수 있음.
 -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>쿠키 만들기</title>
</head>
<body>
	<h1>서버에서 쿠키를 생성하는 cookieSet.jsp 페이지 입니다.</h1>
	<%
		System.out.println("(아래)서버에서 쿠키를 생성하였으며, 응답하기 위해서 response객체에 추가 하였습니다.");
		
		request.setCharacterEncoding("utf-8");
		
		/* 
			1. 쿠키는 보통 클라이언트가 접속을 하면 서버쪽에서 생성하여
			해당 클라이언트에게 보내어 로컬 PC에 저장하는 방식임.
			2. 쿠키속성(이름, 값)을 설정할때는 한글로 만들어지지 않기 떄문에
			반드시 영문이나 숫자로만 설정해야함.
		*/	
		Cookie cookie = new Cookie("gumi", "202101");
		cookie.setMaxAge(60*60);  //쿠키의 유효시간 설정(1시간)
		//쿠키속성을 지정했다면, 반드시 response객체에 추가해줘야 함.(변경이 있어도 재추가)
		response.addCookie(cookie);
	%>
	<br/><br/>
	<a href="cookieGet.jsp">쿠키값 확인</a>
</body>
</html>
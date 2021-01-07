<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	소결론 -- 차이점(중요)
	
	쿠키 : 보안에 취약(로컬 PC에 저장되기 때문에)
	-------------------------------------------------------
	세션 : 1) 서버에 객체로 존재함.
		  2) 보안에 강함. JSP를 통해서만 접근 가능함.
		  3) 여러 클라이언트가 접속하므로 
		     한 클라이언트에 하나의 세션 생성하고 세션아이디 부여함.
		  4) 세션아이디로 어느 클라이언트에서 요청이 들어오는지
		     서버는 구분할 수 있게됨.
		  5) 현업에서 세션 많이 사용함.
 -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>세션 확인</title>
</head>
<body>
	<h1>세션 속성이 삭제된 것을 확인하는 session_Check.jsp 페이지 입니다.</h1>
	<%
		System.out.println("현재 세션 체크해봅니다.");
	
		Enumeration<String> enumeration = session.getAttributeNames();
		
		int i = 0;
		
		while(enumeration.hasMoreElements()) {
			i++;
			String sName = enumeration.nextElement();
			String sValue = (String)session.getAttribute(sName);  //downcasting
			
			out.println("sName : " + sName + "<br/>");	
			out.println("sValue : " + sValue + "<br/>");	
		}
		
		//세션의 값이 많을때는 invalidate() 사용
		//session.invalidate();
		
		if(i == 0) {
			out.println("해당 세션이 삭제되었습니다.");
		}
	%>
</body>
</html>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>쿠키 확인</title>
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
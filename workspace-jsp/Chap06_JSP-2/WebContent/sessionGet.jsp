<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>세션 값 확인</title>
</head>
<body>
	<%
		/* 
			세션에 저장한 각 속성의 Name에 대한 value를 출력함.
			=> session의 getAttribute()의 반환타입이 Object타입이어서
			강제로 다운캐스팅함.
		*/
		Object obj1 = session.getAttribute("gumi");  //속성값 얻기
		Integer intValue =  (Integer)obj1;  //downcasting
		out.println("gumi : " + intValue + "<br/>");  //출력
		
		Object obj2 = session.getAttribute("zoom");
		String str = (String)obj2;
		out.println("zoom : " + str + "<br/>");
	%>
	<br/>
	
	<%
		out.println("==========================================================<br/>");
		
		String sName;
		String sValue;
		
		Enumeration<String> enumeration = session.getAttributeNames();
		
		//가져올 데이터가 있느냐?
		while(enumeration.hasMoreElements()) {
			sName = enumeration.nextElement();  //있으면 가져와라
			sValue = session.getAttribute(sName).toString();
			
			out.println("sName : " + sName + "<br/>");
			out.println("sValue : " + sValue + "<br/>");
		}
		
		out.println("==========================================================<br/>");
		
		/* 
			sessionID는 웹브라우저당 하나가 생기는 유니크한 값임.
			당연히 서버에서 생성해줌.
		*/
		String sessionID = session.getId();
		out.println("sessionID : " + sessionID + "<br/>");
		
		out.println("==========================================================<br/>");
		int sessionInterval = session.getMaxInactiveInterval();
		out.println("세션 유효시간(초) : " + sessionInterval + "<br/>");
	%>
</body>
</html>
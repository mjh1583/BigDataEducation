<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Locale클래스를 이용한 다국어 처리-2</title>
</head>
<body>
	<h3>Locale 클래스를 인스턴스로 생성하여 처리</h3>
	<%
		//Locale locale = new Locale("fr", "CA");  //인스턴스 생성
		Locale locale = Locale.TAIWAN;  //Locale 클래스의 상수 이용함.
		
		Date date = new Date();
		//DateFormat : 정해진 포맷을 상수(FULL, LONG, MEDIUM, SHORT)로 제공하고 있는 클래스
		DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.FULL, locale);
		//SimpleDateFormat : DateFormat을 상속받고, 원하는 출력 형태를 직접 지정하고자 할 때 사용
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
		NumberFormat numberFormat = NumberFormat.getNumberInstance(locale);
		
	%>
	<p>날짜 : <%= date %></p>
	<p>날짜2 : <%= dateFormat.format(date) %></p>
	<p>날짜3 : <%= sdf.format(date) %></p>
	
	<p>국가 : <%= locale.getDisplayCountry() %></p>
	<p>국가코드 : <%= locale.getCountry() %></p>
	<p>국가언어 : <%= locale.getDisplayLanguage() %></p>
	<p>국가언어 : <%= locale.getDisplayLanguage(locale) %></p>
	<p>국가언어 : <%= locale.getDisplayName() %></p>
	
	<p>숫자(123456.67) : <%= numberFormat.format(123456.67) %></p>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>다국어처리-fmt태그-02(숫자)</title>
</head>
<body>
	<!-- setLocale 태그 이용하여 로케일 정해주면 그에 맞는 숫자, 통화가 그 로케일에 맞게끔 출력됨. -->
	<fmt:setLocale value="en_US"/>
	
	<!-- fmt:formatNumber 태그는 기본적으로 groupingUsed 속성이 true로 되어 있어서,
		 천단위 자리에 ,로 구분되어짐. -->
	<p>숫자 : <fmt:formatNumber value="4545000" groupingUsed="true"/></p>
	<p>숫자 : <fmt:formatNumber value="4545000" type="number"/></p>  <!-- 천자리 구분(기본값) -->
	<p>숫자 : <fmt:formatNumber value="4545000" type="number" groupingUsed="false"/></p>  <!-- 천자리 구분 안함 -->
	
	<p><fmt:formatNumber value="4545000" type="currency"/></p>
	<p><fmt:formatNumber value="4545000" type="currency" currencySymbol="원"/></p>
	
	<p><fmt:formatNumber value="0.45" type="percent" /></p>
	
	<!-- minIntegerDigits : 최대 자리수, minFractionDigits : 소수점 자리 -->
	<p><fmt:formatNumber value="4545000" minIntegerDigits="10" minFractionDigits="2" /></p>
	
	<!-- 0은 자리수를 차지하고, #은 숫자가 있으면 출력하고 없으면 출력하지 않음. -->
	<p><fmt:formatNumber value="4545000.12" pattern="0000000000.000" /></p>
	
	<p><fmt:formatNumber value="4545000.12" pattern="##########.###" /></p>
	<p><fmt:formatNumber value="4545000.12" pattern="#,###.###" /></p>
	
</body>
</html>
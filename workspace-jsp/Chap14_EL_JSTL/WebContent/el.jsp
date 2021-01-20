<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	EL(Expression Language, 표현 언어) :
		1) 표현식을 좀더 편리하게 사용하기 위해 jsp 2.0부터 도입
		2) 데이터 출력 기능, 값 출력 기능
		3) 표현 언어 자체 내장 객체도 제공됨.
-->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>EL 표기법</title>
</head>
<body>
	<%
		int el = 10;
		pageContext.setAttribute("scores", new int[] {10, 20, 30});
	%>
	표현식으로 출력한 내용<br/>
	<%= el %><br/>
	<%= (1>2) || (1<2) %><br/><br/>
	
	EL로 출력한 내용<br/>
	${scores[0]}<br/>	<!-- 표현식 or 값 -->
	${"이방원"}<br/>
	${null}<br/>
	${100}<br/><br/>
	
	연산자 이용<br/>
	${100 + 10}<br/>
	
	${1 > 2 ? "true" : "false"}<br/>
	${1 < 2 ? "참" : "거짓"}<br/>
	
	${ (1>2) && (1<2) }<br/>
	${ (1>2) || (1<2) }<br/>
	
	<!-- 
		EL 표기법 :
			1) 단순히 변수명을 주면 출력되지 않음
			2) 객체 요소들의 값들을 간단한 코드로 가져올때 사용하면 유용함.
	 -->
</body>
</html>
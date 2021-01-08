<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>인클루드 액션태그 테스트</title>
</head>
<body>
	<h1>include_test.jsp 페이지 입니다.</h1>
	
	<!-- 
		chap05 include를 사용 해봤음. 이때의 include는 페이지 지시자를 이용한 것이고
		chap07 include는 액션 태그를 이용한 것임.
		차이점이라면, 페이지 지시자는 소스코드가 텍스트로 포함이 되어짐. 그래서 조각코드를 추가할
		용도로 많이 사용함.
		flush속성을 true로 설정을 하면 포함될 페이지로 이동하기 전에 버퍼를 다 비우고 포함될
		페이지로 이동함. 일반적으로는 false로 설정을 해줘야 함. include 액션 태그는 여러 페이지를
		동적으로 하나의 페이지로 묶을 수 있으므로, 각각의 페이지를 기능별로 모듈화 가능함.
		==> 템플릿 페이지라고 함.
	 -->
	
	<jsp:include page="include_test_sample.jsp" flush="false"/>
	
	<h1>다시 include_test.jsp 페이지 입니다.</h1>
</body>
</html>
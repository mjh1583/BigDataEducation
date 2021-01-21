<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 
	* 커스텀 태그(Custom tag)
		- 액션 태그나 표현 언어를 사용하더라도 조건식이나 반복문 등 자바코드를 제거하기 위해서 도입된 기능.
	* 커스텀 태그 종류
		- 1) JSTL(JSP Standard Tag Library)
			: JSP페이지에서 가장 많이 사용하는 기능을 태그로 제공함.
			  JSTL 라이브러리를 따로 설치해서 사용함.
		  2) 개발자가 만든 커스텀 태그
		  	: 스프링 프레임워크(오픈소스)에서 미리 만들어서 제공함.
	* JSTL 라이브러리 구분
		- 코어 : 변수, 조건문, 반복문 처리...
		- 국제화 : 숫자, 날짜 형식...
		- XML
		- 데이터베이스 : SQL
		- 함수 : 컬렉션 처리, 문자열 처리...
 -->
 
 <!-- core 태그 라이브러리를 사용하기 위해 반드시 선언 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- var : 사용할 변수 이름, value : 변수에 저장할 값, scope : 접근 범위 -->
<c:set var="id" value="lee" scope="page"/>
<c:set var="pw" value="1234" scope="page"/>

<c:set var="name" value="${'정도전'}"/>
<c:set var="age" value="${22}"/>
<c:set var="height" value="${177}"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL라이브러리 if태그</title>
</head>
<body>
	<c:if test="${true}">  <!-- test : EL을 이용해 수행할 조건식 위치 -->
		<h2>항상 참입니다.</h2>
	</c:if>
	
	<c:if test="${11 == 11}">
		<h2>두 값은 같습니다.</h2>
	</c:if>
	
	<c:if test="${(id == 'lee') && (name == '정도전')}">
		<h2>아이디는 ${id}이고, 이름은 ${name} 입니다.</h2>
	</c:if>
	
	<c:if test="${age == 22}">
		<h2>나이는 ${age} 입니다.</h2>
	</c:if>
	
	<c:if test="${height >= 170}">
		<h2>${name}의 키는 170보다 큰 ${height}입니다.</h2>
	</c:if>
</body>
</html>
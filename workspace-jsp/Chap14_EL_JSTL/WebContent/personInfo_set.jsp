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
	<title>JSTL라이브러리 set태그</title>
</head>
<body>
	<table border="1">
		<tr align="center" bgcolor="yellow">
			<td width="7%"><b>아이디</b></td>
			<td width="7%"><b>비밀번호</b></td>
			<td width="7%"><b>이름</b></td>
			<td width="7%"><b>나이</b></td>
			<td width="7%"><b>키</b></td>
		</tr>
		<!-- EL 태그 이용해서 값 출력 -->
		<tr align="center">
			<td><b>${id}</b></td>
			<td><b>${pw}</b></td>
			<td><b>${name}</b></td>
			<td><b>${age}</b></td>
			<td><b>${height}</b></td>
		</tr>
	</table>
</body>
</html>
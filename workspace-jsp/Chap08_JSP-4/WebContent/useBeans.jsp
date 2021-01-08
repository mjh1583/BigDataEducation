<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- jsp 액션 태그 중, useBean태그를 이용하여 설정함
	*id : 자바에서의 참조변수와 같은 역할함.
	*class : student 원본 클래스의 패키지명.클래스명 지정을 해주어야함.
	==> 자바에서 new 연산자로 객체(인스턴스)를 생성한 것과 동일하게 되는 것임. 
	*scope : 
 -->
<jsp:useBean id="student" class="kr.gov.bean.Student" scope="page"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>빈 생성</title>
</head>
<body>
	<h1>빈에 데이터 값들을 저장하였습니다.</h1>
	
	<!-- 속성(멤버변수)에 '*'는 빈(bean)객체의 속성 값을 기본값으로 지정하는 것임. -->
	<jsp:setProperty property="*" name="student"/>
	
	<!-- name : bean의 id값, property : 빈의 속성(멤버변수), value : 실제 값을 주어 저장함. -->
	<!-- setProperty : student클래스의 setter메서드를 호출하는 태그임(중요) -->
	<jsp:setProperty property="name" name="student" value="이순신"/>
	<jsp:setProperty property="age" name="student" value="30"/>
	<jsp:setProperty property="grade" name="student" value="3"/>
	<jsp:setProperty property="studentNum" name="student" value="15"/>
	
	<h1>빈에서 데이터를 가져온 값입니다.</h1><br/>
	<font size="10" color="blue">
		<!-- getProperty : student클래스의 getter메서드를 호출하는 태그임(중요) -->
		이름 : <jsp:getProperty property="name" name="student"/><br/>
		나이 : <jsp:getProperty property="age" name="student"/><br/>
		학년 : <jsp:getProperty property="grade" name="student"/><br/>
		학번 : <jsp:getProperty property="studentNum" name="student"/><br/>
	</font>
</body>
</html>
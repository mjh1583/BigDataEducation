<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 
	* 브라우저에서 웹 애플리케이션 요청
	http://localhost:8080/Chap01_Intro/hello.jsp
	=http://127.0.0.1:8080/Chap01_Intro/hello.jsp
	http://IP주소:포트번호/컨텍스트이름(Context)/요청파일이름
	
	* 컨텍스트 : 톰캣의 server.xml에 등록하는 웹 애플리케이션을 컨텍스트라고 함.
			   톰캣입장에서 인식하는 한개의 웹 어플리케이션임.
			   - 웹 애플리케이션당 하나의 컨텍스트가 등록됨.
			   - 웹 애플리케이션 이름과 같을수도 있고 다를 수도 있음.
			   - 컨텍스트 이름은 중복하면 안됨.
			   - 웹 애플리케이션의 의미를 가장 나타낼 수 있는 명사형으로 지정.
 -->
<html>
<head>
	<meta charset="UTF-8">
	<title>Hello JSP</title>
</head>
<body>
	<h1>안녕하세요 JSP 테스트 페이지 입니다.</h1>
	JSP를 열심히 학습하도록 합시다.
	<script type="text/javascript" src="js/jquery-3.5.1.js">></script>
	<script type="text/javascript">
		
	</script>
</body>
</html>
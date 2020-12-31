<%-- <%@부분은 페이지 지시자임. 페이지 속성이나 import할때 자주 사용함.%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
</head>
<body>
	<h1>안녕하세요. JSP파일입니다.</h1>
	<h1>응답은 HTML코드로 합니다.</h1>
	
	<%
		int i = 10;
		out.print("i의 값 : " + i);
	%>
</body>
</html>

<!-- 실제 hello_jsp.java, hello_jsp.class 파일을 확인하는 경로
 C:\workspace-jsp\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\work\Catalina\localhost\Chap05_JSP-1\org\apache\jsp
 -->
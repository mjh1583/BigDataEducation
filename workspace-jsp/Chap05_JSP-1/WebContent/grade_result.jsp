<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>학점 출력</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String score1 = request.getParameter("score");
		
		if(score1 == "" || score1 == null){
	%>
	<h1>점수가 잘못 입력되었습니다.</h1>
	<a href="scoreInput.html">시험점수 입력</a>	
	<%
			return;
		}
		
		int score = Integer.parseInt(score1);
	%>
	
	<h1>시험 점수 <%= score %></h1>
	
	<%
		if(score > 100 || score < 0) {
	%>
	<h1>점수는 0~100사이값 입니다. 점수가 잘못 입력되었습니다.</h1>	
	<%
		}
	%>
	<%
		if(score >= 90 && score <= 100) {
	%>
	<h1>A학점입니다.</h1>
	<%
		}
		else if(score >= 80 && score <= 89) {
	%>
	<h1>B학점입니다.</h1>
	<%
		}
		else if(score >= 70 && score <= 79) {
	%>
	<h1>C학점입니다.</h1>
	<%
		}
		else if(score >= 60 && score <= 69) {
	%>
	<h1>D학점입니다.</h1>
	<%
		}
		else if(score < 60 && score >= 0){
	%>
	<h1>F학점입니다.</h1>
	<%
		}
	%>
	<br/>
	<a href="scoreInput.html">시험점수 입력</a>	
</body>
</html>
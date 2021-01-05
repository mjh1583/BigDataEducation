<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String encodedName = URLEncoder.encode(name, "utf-8");
	
	String strScore = request.getParameter("score");
	//점수를 바로 문자열에서 정수타입으로 캐스팅
	int score = Integer.parseInt(strScore);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>시험 점수 확인</title>
</head>
<body>
	<%
		if(score < 0 || score > 100 )	{
			out.println("<h1>점수를 잘못 입력했습니다.</h1>");
			out.println("<a href='score.html'>점수 입력</a>");
			return;
		}
	%>
	<%
		//score점수에 따라 페이지 이동이 발생하여 달라지는 코드임.
		if(score >= 60) {
			//점수가 60점이상이면 pass.jsp 파일로 이동함.(get방식)
			response.sendRedirect("pass.jsp?name=" + encodedName + "&score=" + strScore);
			System.out.println("scoreResult.jsp페이지를 지나감1.");
		}
		else {
			//점수가 60점미만이면 notpass.jsp 파일로 이동함.(get방식)
			response.sendRedirect("notpass.jsp?name=" + encodedName + "&score=" + strScore);
			System.out.println("scoreResult.jsp페이지를 지나감2.");
	}
	%>
</body>
</html>
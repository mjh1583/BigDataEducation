<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	//post방식으로 보낼때 : 값을 session에 저장하여 다른 페이지로 이동할 때 파라미터 
	pageContext.getSession().setAttribute("name", name);
	
	String strScore = request.getParameter("score");
	pageContext.getSession().setAttribute("score", strScore);
	if((strScore != null) && (strScore.equals(""))) {
		out.print("<h1>점수를 입력해주세요.</h1>");
		out.print("<a href='score2.html'>점수 입력</a>");
		return;		
	}
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
			out.println("<a href='score2.html'>점수 입력</a>");
			return;
		}
	%>
	<%
		//score점수에 따라 페이지 이동이 발생하여 달라지는 코드임.
		if(score >= 60) {
			//점수가 60점이상이면 pass2.jsp 파일로 이동함.(post방식)
			response.sendRedirect("pass2.jsp");
			System.out.println("scoreResult2.jsp페이지를 지나감1.");
		}
		else {
			//점수가 60점미만이면 notpass2.jsp 파일로 이동함.(post방식)
			response.sendRedirect("notpass2.jsp");
			System.out.println("scoreResult2.jsp페이지를 지나감2.");
	}
	%>
</body>
</html>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>선언문, 표현식</title>
</head>
<body>
	<!-- 선언부는 전역임 -->
	<%!
		public int sum() {
			int total = 0;
			for(int i = 0; i <= 100; i++) {
				total += i;
			}
			return total;
		}
	%>
	
	<%
		String str = "1부터 100까지의 합";
	%>
	
	<h2><%=str %>은 <b><%=sum() %></b> 입니다.</h2>
	<!-- 1부터 100까지의 합에 3을 곱하면 15150입니다. -->
	<h2><%=str %>에 3을 곱하면 <b><%=3*sum() %></b> 입니다.</h2>
	<!-- 1부터 100까지의 합에 1000을 나누면 5.05입니다. -->
	<h2><%=str %>에 1000을 나누면 <b><%=sum()/1000.0 %></b> 입니다.</h2>
</body>
</html>
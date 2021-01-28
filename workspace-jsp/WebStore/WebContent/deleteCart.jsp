<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>장바구니 비우기</title>
</head>
<body>
	<%
		//모든 상품을 삭제하기 위해서 sessionID값을 얻음
		String id = request.getParameter("cardId");
		if(id == null || id.trim().equals("")) {
			response.sendRedirect("cart.jsp");
			return;
		}
		
		session.invalidate();  //세션 삭제
		response.sendRedirect("cart.jsp");
		
	%>
</body>
</html>
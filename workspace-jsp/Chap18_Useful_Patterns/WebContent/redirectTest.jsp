<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HttpServletResponse를 이용한 sendRedirect</title>
</head>
<body>
	<%
		/* HttpServletResponse를 통해서 위임을 하고 있지만 sendRedirect() 방법은
			새로운 request객체를 생성되므로 이전 요청이 들어온 request객체는 제거되어서 속성값을 참조할 수 없음. */
		request.setAttribute("id", "gumi");
		request.setAttribute("pw", "0217");
		
		pageContext.getSession().setAttribute("name", "daegu");
		pageContext.getSession().setAttribute("season", "winter");
		
		response.sendRedirect("redirectResult.jsp");
	%>
</body>
</html>
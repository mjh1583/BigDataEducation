<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인 확인</title>
</head>
<body>
	<%!
		String id, pw;
	%>
	
	<%
		request.setCharacterEncoding("utf-8");
		
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		
		/* 
			지금은 DB를 설정하지 않아서 아래와 같이 코드 작성함.
			추후 DB연동하고 난 뒤 코드 변경.
		*/
		if(id.equals("gumi") && pw.equals("202101")) {
			
			//세션으로 로그인 정보 저장함.
			session.setAttribute("id", id);
			//session.setAttribute("pw", pw);
			
			System.out.println("session_loginOk.jsp 파일 지나감.");
			
			//로그인 성공하면 sendRedirect() 이용하여 login_success.jsp파일로 이동.
			response.sendRedirect("session_login_success.jsp");
		}
		else {
			//로그인 실패하면 sendRedirect() 이용하여 login_fail.jsp파일로 이동.
			response.sendRedirect("session_login_fail.jsp");
		}
	%>
</body>
</html>
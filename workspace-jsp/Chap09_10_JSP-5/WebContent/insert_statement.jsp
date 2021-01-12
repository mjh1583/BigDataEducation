<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>사용자 입력값 DB 저장하기</title>
</head>
<body>
	<%@include file="dbconn.jsp" %>  <!-- 접속할 DB코드를 페이지 지시자 태그로 가져옴 -->
	
	<%
		request.setCharacterEncoding("utf-8");
		
		/* 사용자가 입력한 내용을 가져와서 변수에 저장함 */
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String username = request.getParameter("username");
		
		//쿼리문 실행할 Statement 객체 선언
		Statement statement = null;
		
		try {
			//쿼리문 작성
			String sql = "insert into member(id, pw, username) values('"+id+"','"+pw+"','"+username+"')";
			
			//Connection객체로부터 Statement 객체를 얻어내는 코드
			statement = connection.createStatement();
			
			//쿼리문을 DB에 실행하는 코드
			statement.executeUpdate(sql);
			out.println("member테이블에 정상적으로 입력 성공되었습니다." + "<br/>");
			
		} catch(SQLException e) {
			out.println("member테이블에 입력이 실패되었습니다." + "<br/>");
			out.println("SQLException : " + e.getMessage() + "<br/>");
			e.printStackTrace();
		}
		finally {
			//자원 해제 반드시 해야함.
			if(statement != null)
				statement.close();
			if(connection != null)
				connection.close();
		}
		
	%>
	<br/>
	<a href="select_statement.jsp">회원 리스트</a>
</body>
</html>
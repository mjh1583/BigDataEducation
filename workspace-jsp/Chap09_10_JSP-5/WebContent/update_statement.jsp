<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>DB데이터 수정</title>
</head>
<body>
	<%@include file="dbconn.jsp" %>  <!-- 접속할 DB코드를 페이지 지시자 태그로 가져옴 -->
	
	<%
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String username = request.getParameter("username");
		
		Statement statement = null;  //쿼리문 실행할 Statement 객체 선언
		ResultSet resultSet = null;  //select한 결과를 받아오는 객체
		
		try {
			String sql = "select id, pw from member where id = '"+id+"'";
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			/* 
			if(statement != null)
				statement.close(); */
			/* ResultSet 결과물을 가지고 온 Statement 객체가 닫힐 경우 ResultSet 객체도 함께 닫힘 */
			
			if(resultSet.next()) {
				String rId = resultSet.getString("id");
				String rPw = resultSet.getString("pw");
				
				if(id.equals(rId) && pw.equals(rPw)) {
					sql = "update member set username = '"+username+"' where id = '"+rId+"'";
					
					/* Statement 객체는 쿼리를 단 한번 실행함. 재사용하기 위해서는 반드시 다시 Connection 객체로부터
					   Statement 객체를 얻어야함. => 쿼리문이나 사용법에서 상당히 불편함. */
					if(statement != null)
						statement.close();
					
					statement = connection.createStatement();
					statement.executeUpdate(sql);
					out.println(rId + "님의 정보를 수정했습니다.");
					
				}
				else {
					out.println("아이디나 비밀번호가 일치하지 않습니다.");
				}
			}
			else {
				out.println("Member테이블에 일치하는 아이디가 없습니다.");
			}
				
		} catch(SQLException e) {
			out.println("SQLException : " + e.getMessage() + "<br/>");
			e.printStackTrace();
		} finally {
			if(resultSet != null)
				resultSet.close();
			if(statement != null)
				statement.close();
			if(connection != null)
				connection.close();
		}
		
	%>
	<br/>
	<a href="select_statement.jsp">회원 리스트</a> &nbsp;&nbsp;&nbsp;
	<a href="insert_form_statement.jsp">회원 가입</a>
</body>
</html>
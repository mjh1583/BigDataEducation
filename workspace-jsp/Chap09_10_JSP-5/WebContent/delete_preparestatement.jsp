<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>DB데이터 삭제</title>
</head>
<body>
	<%@include file="dbconn.jsp" %>  <!-- 접속할 DB코드를 페이지 지시자 태그로 가져옴 -->
	
	<%
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String username = request.getParameter("username");
		
		PreparedStatement preparedStatement = null;  //쿼리문 실행할 Statement 객체 선언
		ResultSet resultSet = null;  //select한 결과를 받아오는 객체
		
		try {
			String sql = "select id, pw from member where id = ?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, id);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				String rId = resultSet.getString("id");
				String rPw = resultSet.getString("pw");
				
				if(id.equals(rId) && pw.equals(rPw)) {
					sql = "delete from member where id = ? and pw = ?";
					
					if(preparedStatement != null)
						preparedStatement.close();
					
				    preparedStatement = connection.prepareStatement(sql);
				    
					preparedStatement.setString(1, id);
					preparedStatement.setString(2, pw);
					
					preparedStatement.executeUpdate();
					out.println(rId + "님의 정보를 삭제했습니다.");
					
				}
				else {
					out.println("일치하는 비밀번호가 아닙니다.");
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
			if(preparedStatement != null)
				preparedStatement.close();
			if(connection != null)
				connection.close();
		}
		
	%>
	<br/>
	<a href="select_preparestatement.jsp">회원 리스트</a> &nbsp;&nbsp;&nbsp;
	<a href="insert_form_preparestatement.jsp">회원 가입</a> &nbsp;&nbsp;&nbsp;
	<a href="update_form_preparestatement.jsp">회원 정보 수정</a>
</body>
</html>
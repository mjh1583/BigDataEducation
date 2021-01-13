<%@page import="jdk.jfr.Percentage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>DB SELECT 결과</title>
</head>
<body>
	<%@include file="dbconn.jsp" %> 
	
	<table border="1">
		<tr>
			<th width="300" align="center">아이디</th>
			<th width="300" align="center">비밀번호</th>
			<th width="300" align="center">이름</th>
		</tr>
		<%
			request.setCharacterEncoding("utf-8");
			
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;  //select한 결과를 받아오는 객체
			
			try {
				String sql = "select * from member";
				preparedStatement = connection.prepareStatement(sql);
				resultSet = preparedStatement.executeQuery();
				
				//가져올 행이 있느냐?
				while(resultSet.next()) {
					//해당하는 행의 컬럼값들을 각각 저장하고 있음.
					String id = resultSet.getString("id");
					String pw = resultSet.getString("pw");
					String username = resultSet.getString("username");
		%>
		<tr>
			<td width="300" align="center"><%= id %></td>
			<td width="300" align="center"><%= pw %></td>
			<td width="300" align="center"><%= username %></td>
		</tr>	
		<%
				}
			} catch(SQLException e) {
				out.println("member 테이블 select 오류가 발생했습니다." +"<br/>");
				out.println("SQLException : " + e.getMessage() +"<br/>");
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
	</table>
	<br/>
	<a href="insert_form_preparestatement.jsp">회원가입</a> &nbsp;&nbsp;&nbsp;
	<a href="update_form_preparestatement.jsp">회원 정보 수정</a> &nbsp;&nbsp;&nbsp;
	<a href="delete_form_preparestatement.jsp">회원 정보 삭제</a>
	
</body>
</html>
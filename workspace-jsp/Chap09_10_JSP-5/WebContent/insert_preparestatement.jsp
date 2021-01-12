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
		
		//쿼리문 실행할 PreparedStatement 객체 선언
		PreparedStatement preparedStatement = null;
		
		try {
			//쿼리문 작성
			String sql = "insert into member values(?,?,?)";
			
			//Connection객체로부터 PreparedStatement 객체를 얻어내는 코드. 매개변수값으로 sql문 넣어야함.
			preparedStatement = connection.prepareStatement(sql);
			
			//PreparedStatement 객체를 이용하여 각각의 ?에 해당하는 값들을 지정해 줌.
			preparedStatement.setString(1, id);
			preparedStatement.setString(2, pw);
			preparedStatement.setString(3, username);
			
			//쿼리문을 DB에 실행하는 코드
			/* 단, 쿼리문을 매개변수로 넣지 않아야함. 이미 위에서 preparedStatement 객체 생성됨. */
			preparedStatement.executeUpdate();
			out.println("member테이블에 정상적으로 입력 성공되었습니다." + "<br/>");
			
		} catch(SQLException e) {
			out.println("member테이블에 입력이 실패되었습니다." + "<br/>");
			out.println("SQLException : " + e.getMessage() + "<br/>");
			e.printStackTrace();
		}
		finally {
			//자원 해제 반드시 해야함.
			if(preparedStatement != null)
				preparedStatement.close();
			if(connection != null)
				connection.close();
		}
		
	%>
	<br/>
	<a href="select_preparestatement.jsp">회원 리스트</a>
</body>
</html>
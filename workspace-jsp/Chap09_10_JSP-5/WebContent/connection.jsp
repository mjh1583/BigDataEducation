<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>DB연결 테스트</title>
</head>
<body>
	<%
		Connection connection = null;
		
		/* 
			mysql서버에 접속하기 위한 경로를 설정함
			jdbc:mysql => 프로토콜,
			//localhost:3306 => 도메인(IP),
			3306 => 포트번호,
			testdb => 접속할 DB명
		*/
		String url = "jdbc:mysql://localhost:3306/testdb?serverTimezone=UTC";
		String id = "root";  //접속 아이디
		String pw = "0217";  //접속 비밀번호
		String driver = "com.mysql.cj.jdbc.Driver";
		
		try {
			/* 
				드라이버명에 있는 동적객체(Driver)를 생성 => JDBC 드라이버 로딩하기
				JDBC 드라이버 로딩되면 자동으로 객체가 생성되고 DriverManager에 등록되어
				연결객체(connection)를 얻게됨.
			*/
			Class.forName(driver);
			DriverManager.getConnection(url, id, pw);
			out.println("데이터베이스 연결 성공");
		} catch(Exception e) {
			out.println("데이터베이스 연결 실패 <br/>");
			out.println(e.getMessage());  //웹 페이지 출력
			e.printStackTrace();  //콘솔 출력
		} finally {
			if(connection != null) {
				connection.close();
			}
		}
		
	%>
</body>
</html>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 상품 조회, 등록, 수정, 삭제하기 (DB연동) -->

<% 
	try {
		Connection conn = null;
		
		String url = "jdbc:mysql://localhost:3306/webstoredb?serverTimezone=UTC";
		String user = "root";
		String password = "0217";
		
		Class.forName("com.mysql.cj.jdbc.Driver");  //드라이버명
		conn = DriverManager.getConnection(url, user, password);  //연결 객체 생성
		
		System.out.println("데이터베이스 연결 되었습니다.");
		
	} catch(SQLException e) {
		System.out.println("데이터베이스 연결 실패되었습니다.");
		e.printStackTrace();
	}
	

%>
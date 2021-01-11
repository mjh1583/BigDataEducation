<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
	//페이지 모듈화하기 위해서 연결 부분을 따로 파일로 만듦.
	Connection connection = null;
	
	String url = "jdbc:mysql://localhost:3306/testdb?serverTimezone=UTC";
	String id = "root";  //접속 아이디
	String pw = "0217";  //접속 비밀번호
	String driver = "com.mysql.cj.jdbc.Driver";
	
	Class.forName(driver);
	DriverManager.getConnection(url, id, pw);
	
%>
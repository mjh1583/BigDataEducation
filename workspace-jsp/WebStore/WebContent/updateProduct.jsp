<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	DecimalFormat dFormat = new DecimalFormat("###,###");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 수정 - WebStore</title>
	
	<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="menu.jsp"/>	
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 수정</h1>
		</div>
	</div>
	<%
		Connection conn = null;
		
		String url = "jdbc:mysql://localhost:3306/webstoredb?serverTimezone=UTC";
		String user = "root";
		String password = "0217";
		
		Class.forName("com.mysql.cj.jdbc.Driver");  //드라이버명
		conn = DriverManager.getConnection(url, user, password);  //연결 객체 생성
	%>
	
	<%
		String productId = request.getParameter("id");  /* 어떤 제품을 수정할지 id값 넘어오는 것 받음 */
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from product where productId = ?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img alt="사진" src="${pageContext.request.contextPath}/resources/images/<%= rs.getString("filename") %>" 
				style="width: 100%">
				
			</div>
		</div>
	</div>
	<%
		}
		
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	%>
	
</body>
</html>
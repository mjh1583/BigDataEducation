<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Connection conn = null;
	
	String url = "jdbc:mysql://localhost:3306/webstoredb?serverTimezone=UTC";
	String user = "root";
	String password = "0217";
	
	Class.forName("com.mysql.cj.jdbc.Driver");  //드라이버명
	conn = DriverManager.getConnection(url, user, password);  //연결 객체 생성
%>

<%
	String productId = request.getParameter("id");  /* 어떤 제품 삭제할지 id값 넘어오는 것을 저장해둠 */
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select * from product";
	
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	//rs에 있는 물품과 id값으로 저장해놓은것과 일치하는게 있다면
	if(rs.next()) {
		sql = "delete from product where productId = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		pstmt.executeUpdate();
	}
	else {
		out.println("일치하는 상품이 없습니다.");
	}
	
	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
	
	response.sendRedirect("editProduct.jsp?edit=delete");
%>















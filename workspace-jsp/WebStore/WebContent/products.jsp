<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="kr.gov.dao.ProductRepository"%>
<%@page import="kr.gov.dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <jsp:useBean id="productDAO" class="kr.gov.dao.ProductRepository" scope="session"/> --%>

<% 
	request.setCharacterEncoding("utf-8"); 
	DecimalFormat dFormat = new DecimalFormat("###,###");  //숫자 천단위 구분 표시
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품목록 - WebStore</title>
	<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"> -->
	<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="menu.jsp"/>	
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	
	<%-- <%
		ProductRepository dao = ProductRepository.getInstance();
		
		//상품목록 가져옴
		ArrayList<Product> listOfProducts = dao.getAllProducts();
	%> --%>
	
	<%
		
	%>
	
	<div class="container">
		<div class="row" align="center">
			<%-- <%@ include file="dbconn.jsp" %> --%>
			<%
				/* 
				for(int i = 0; i < listOfProducts.size(); i++) {
					Product product = listOfProducts.get(i);
				}
			 	*/
			 	Connection conn = null;
				
				String url = "jdbc:mysql://localhost:3306/webstoredb?serverTimezone=UTC";
				String user = "root";
				String password = "0217";
				
				Class.forName("com.mysql.cj.jdbc.Driver");  //드라이버명
				conn = DriverManager.getConnection(url, user, password);  //연결 객체 생성
				
			 	PreparedStatement pstmt = null;
			 	ResultSet rs = null;
			 	String sql = "select * from product";
			 	
			 	pstmt = conn.prepareStatement(sql);  /* Connection 객체에 쿼리문 넘겨주고 PrepareStatement를 얻음 */
			 	rs = pstmt.executeQuery();  /* 쿼리문 결과 받아옴 */
			 	
			 	while(rs.next()) {
			 		
			 %>
				<div class="col-md-4">
					<!-- 경로 지정해서 이미지 출력 -->
					<%-- <img alt="" src="D:/workspace-jsp/upload/<%= product.getFilename()%>" style="width: 100%" /> --%>
					<img alt="" src="${pageContext.request.contextPath}/resources/images/<%= rs.getString("filename") %>"
					 style="width: 100%" />
					<h3><%= rs.getString("pname") %></h3>
					<p><%= rs.getString("description") %></p>
					<p><%= dFormat.format(Integer.parseInt(rs.getString("unitPrice"))) %>원</p>
					<p><a href="./product.jsp?id=<%= rs.getString("productId") %>"
						class="btn btn-secondary" role="button">상세 정보 &raquo;</a></p>
				</div>
			<%
				}
			 	if(rs != null) rs.close();
			 	if(pstmt != null) pstmt.close();
			 	if(conn!= null) conn.close();
			%>
		</div>
		<hr>
	</div>
	
	<jsp:include page="footer.jsp"/>
	
</body>
</html>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String edit = request.getParameter("edit");  /* 메뉴 "상품수정" 클릭시 넘어오는 edit값 받음 */
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
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row" align="center">
			<%
				Connection conn = null;
				
				String url = "jdbc:mysql://localhost:3306/webstoredb?serverTimezone=UTC";
				String user = "root";
				String password = "0217";
				
				Class.forName("com.mysql.cj.jdbc.Driver");  //드라이버명
				conn = DriverManager.getConnection(url, user, password);  //연결 객체 생성
			%>
			
			<%
				PreparedStatement pstmt = null;
			 	ResultSet rs = null;
			 	String sql = "select * from product";
			 	
			 	pstmt = conn.prepareStatement(sql);  /* Connection 객체에 쿼리문 넘겨주고 PrepareStatement를 얻음 */
			 	rs = pstmt.executeQuery();  /* 쿼리문 결과 받아옴 */
			 	
			 	while(rs.next()) {
	 		%>
	 		<div class="col-md-4">
	 			<img alt="사진" src="${pageContext.request.contextPath}/resources/images/<%= rs.getString("filename") %>" style="width: 100%">
	 			<h3><%= rs.getString("pname") %></h3>
	 			<p><%= rs.getString("description") %></p>
	 			<p><%= dFormat.format(Integer.parseInt(rs.getString("unitPrice"))) %></p>
	 			<p><%
	 					if(edit.equals("update")) {
					%>
					<a href="./updateProduct.jsp?id=<%= rs.getString("productId") %>" 
					class="btn btn-success" role="button">수정 &raquo;</a>
					<%
	 					}
	 					else if(edit.equals("delete")) {
					%>
					<a href="#" onclick="deleteConfirm('<%= rs.getString("productId") %>')"
					 class="btn btn-danger" role="button">삭제 &raquo;</a>
					<%
	 					}
	 				%>
	 			
	 		</div>
	 		<%
			 	}
			 	if(rs != null) rs.close();
			 	if(pstmt != null) pstmt.close();
			 	if(conn != null) conn.close();
			%>
		</div>
		<hr/>
	</div>
	
	<jsp:include page="footer.jsp"/>
	
	<script type="text/javascript">
		function deleteConfirm(id) {
			if(confirm('해당 상품을 삭제합니다!') == true) {
				location.href = "./deleteProduct.jsp?id=" + id;
			}
			else 
				return;
		}
	</script>
</body>
</html>
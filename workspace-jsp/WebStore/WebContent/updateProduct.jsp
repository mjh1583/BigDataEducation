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
			
			<div class="col-md-7">
				<form action="./processUpdateProduct.jsp" name="newProduct" class="form-horizontal" 
				method="post" enctype="multipart/form-data">
					<div class="form-group row">
						<label class="col-sm-3">상품코드</label>
						<div class="col-sm-3">
							<input type="text" id="productId" name="productId" class="form-control"
							value="<%= rs.getString("productId") %>">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-3">상품명</label>
						<div class="col-sm-3">
							<input type="text" id="pname" name="pname" class="form-control"
							value="<%= rs.getString("pname") %>">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-3">상품가격</label>
						<div class="col-sm-3">
							<input type="text" id="unitPrice" name="unitPrice" class="form-control"
							value="<%= rs.getString("unitPrice") %>">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-3">상세 설명</label>
						<div class="col-sm-3">
							<input type="text" id="description" name="description" class="form-control"
							value="<%= rs.getString("description") %>">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-3">제조사</label>
						<div class="col-sm-3">
							<input type="text" id="manufacturer" name="manufacturer" class="form-control"
							value="<%= rs.getString("manufacturer") %>">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-3">카테고리</label>
						<div class="col-sm-3">
							<input type="text" id="category" name="category" class="form-control"
							value="<%= rs.getString("category") %>">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-3">재고 수</label>
						<div class="col-sm-3">
							<input type="text" id="numberOfStock" name="numberOfStock" class="form-control"
							value="<%= rs.getString("numberOfStock") %>">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-3">상태</label>
						<div class="col-sm-5">
							<input type="radio" name="condition" value="New">신규 제품<br/>
							<input type="radio" name="condition" value="Old">중고 제품<br/>
							<input type="radio" name="condition" value="Refurblished">재생 제품<br/>
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-3">이미지</label>
						<div class="col-sm-5">
							<input type="file" name="filename" class="form-control">
						</div>
					</div>
					
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-2">
							<input type="submit" class="btn btn-primary" value="수정완료">
						</div>
					</div>
					
				</form>
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
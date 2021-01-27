<%@page import="kr.gov.dao.ProductRepository"%>
<%@page import="kr.gov.dto.Product"%>
<%@page errorPage="exceptionNoProductId.jsp" %>  <!-- id값이 유효하지 않으면 에러페이지로 이동시킴 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <jsp:useBean id="productDAO" class="kr.gov.dao.ProductRepository" scope="session"/> --%>

<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 상제 정보</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="menu.jsp"/>	
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	
	<%
		//넘어온 상품 아이디값을 얻음.
		String id = request.getParameter("id");
		
		ProductRepository dao = ProductRepository.getInstance();
		
		//넘어온 상품 아이디값을 이용해 실제 해당하는 Product 객체를 얻음.
		Product product = dao.getProductById(id);
	%>
	
	<div class="container">
		<div class="row" align="center">
			<div class="col-md-5">
				<%-- <img alt="" src="D:/workspace-jsp/upload/<%= product.getFilename()%>" style="width: 100%" /> --%>
				<img alt="" src="${pageContext.request.contextPath}/resources/images/<%= product.getFilename()%>"
				 style="width: 100%" />
			</div>
			<div class="col-md-6">
				<h3><%= product.getPname() %></h3>
				<p><%= product.getDescription() %></p>
				<p><b>상품 코드 : </b><span class="badge badge-danger"><%= product.getProductId() %></span></p>
				<p><b>제조사 : </b><%= product.getManufacturer() %></p>
				<p><b>분류 : </b><%= product.getCategory() %></p>
				<p><b>재고수량 : </b><%= product.getNumberOfStock() %></p>
				<h4><%= product.getUnitPrice() %>원</h4>
				
				<p><form name="addForm" action="./addCart.jsp?id=<%= product.getProductId() %>" method="post">
					<!-- 상품 주문을 클릭하면 자바스크립트 핸들러 함수인 addToCart() 호출  -->
					<a href="#" class="btn btn-info" onclick="addToCart()">상품 주문 &raquo;</a>
					<!-- 장바구니 버튼 추가, 클릭시 cart.jsp로 이동함 -->
					<a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
					<a href="./products.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
				</form>
			
			</div>
		</div>
		<hr>
	</div>
	
	<jsp:include page="footer.jsp"/>
	
	<script type="text/javascript">
		/* 장바구니에 추가하기 위한 핸들러 함수 */
		function addToCart() {
			if(confirm('해당 상품을 장바구니에 추가하시겠습니까?')) {  //confirm() : 사용자가 선택할 때 이용
				document.addForm.submit();
			}
			else {
				document.addForm.reset();
			}
		}
	</script>
</body>
</html>
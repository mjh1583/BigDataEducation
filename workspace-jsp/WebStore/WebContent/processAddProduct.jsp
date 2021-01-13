<%@page import="kr.gov.dto.Product"%>
<%@page import="kr.gov.dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	/* addProduct.jsp에서 사용자가 입력한 부분 받아서 저장 */
	String productId = request.getParameter("productId");  //상품 아이디
	String pname = request.getParameter("pname");  //상품명
	String unitPrice = request.getParameter("unitPrice");  //상품 가격
	String description = request.getParameter("description");  //상품 설명
	String manufacturer = request.getParameter("manufacturer");  //제조사
	String category = request.getParameter("category");  //분류
	String numberOfStock = request.getParameter("numberOfStock");  //재고 수
	String condition = request.getParameter("condition");  //신상품 or 중고품 or 재생품
	
	int price;
	long stock;
	
	//단가 입력창에 미 입력시에
	if(unitPrice.isEmpty()) {
		price = 0;  //auto-boxing(오토박싱)
	}
	else {
		//String을 숫자로 변환함.
		price = Integer.valueOf(unitPrice);
	}
	
	//재고수량 입력창에 미 입력시에
	if(numberOfStock.isEmpty()) {
		stock = 0L;
	}
	else {
		//String을 long으로 변환함.
		stock = Long.valueOf(numberOfStock);
	}
	
	ProductRepository dao = ProductRepository.getInstance();
	Product newProduct = new Product();
	
	//Product 객체에 사용자가 입력한 내용을 저장
	newProduct.setProductId(productId);
	newProduct.setPname(pname);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setNumberOfStock(stock);
	newProduct.setCondition(condition);
	
	//ArrayList에 새상품을 추가
	dao.addProduct(newProduct);
	//페이지 이동시킴
	response.sendRedirect("./products.jsp");
%>
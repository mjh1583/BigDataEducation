<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.gov.dto.Product"%>
<%@page import="kr.gov.dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	
	//addProduct.jsp에서 사용자가 업로드한 이미지 부분을 받아 저장.
	String filename = "";
	//String realFolder = "D:\\workspace-jsp\\upload";  //웹 애플리케이션에서 절대 경로
	String realFolder = "D:\\workspace-jsp\\WebStore\\WebContent\\resources\\images";  //웹 애플리케이션에서 절대 경로
	int maxsize = 10 * 1024 * 1024;  //최대 업로드 크기(10MB)
	String encType = "utf-8";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxsize,
											encType, new DefaultFileRenamePolicy());
	
	/* addProduct.jsp에서 사용자가 입력한 부분 받아서 저장 */
	String productId = multi.getParameter("productId");  //상품 아이디
	String pname = multi.getParameter("pname");  //상품명
	String unitPrice = multi.getParameter("unitPrice");  //상품 가격
	String description = multi.getParameter("description");  //상품 설명
	String manufacturer = multi.getParameter("manufacturer");  //제조사
	String category = multi.getParameter("category");  //분류
	String numberOfStock = multi.getParameter("numberOfStock");  //재고 수
	String condition = multi.getParameter("condition");  //신상품 or 중고품 or 재생품
	
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
	
	Enumeration files = multi.getFileNames();
	String fname = (String)files.nextElement();
	filename = multi.getFilesystemName(fname);
	
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
	//이미지 저장 부분
	newProduct.setFilename(filename);
	
	//ArrayList에 새상품을 추가
	dao.addProduct(newProduct);
	//페이지 이동시킴
	response.sendRedirect("./products.jsp");
%>
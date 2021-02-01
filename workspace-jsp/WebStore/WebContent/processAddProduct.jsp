<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
	
	//아래 내용 DB입력으로 대체
	/* 
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
	*/
	Connection conn = null;
	
	String url = "jdbc:mysql://localhost:3306/webstoredb?serverTimezone=UTC";
	String user = "root";
	String password = "0217";
	
	Class.forName("com.mysql.cj.jdbc.Driver");  //드라이버명
	conn = DriverManager.getConnection(url, user, password);  //연결 객체 생성
	
	PreparedStatement pstmt = null;
	String sql = "insert into product values(?, ?, ?, ?, ?, ?, ?, ?, ?);";
	pstmt = conn.prepareStatement(sql);
	
	/* 9개의 사용자로부터 입력받은 데이터를 DB에 저장 */
	pstmt.setString(1, productId);
	pstmt.setString(2, pname);
	pstmt.setInt(3, price);
	pstmt.setString(4, description);
	pstmt.setString(5, manufacturer);
	pstmt.setString(6, category);
	pstmt.setLong(7, stock);
	pstmt.setString(8, condition);
	pstmt.setString(9, filename);
	
	pstmt.executeUpdate();
	System.out.println("상품 등록 완료");
	
	//자원 해제
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
	//페이지 이동시킴
	response.sendRedirect("./products.jsp");
%>
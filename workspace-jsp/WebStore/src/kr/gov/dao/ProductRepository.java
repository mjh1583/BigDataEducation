package kr.gov.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import kr.gov.dto.Product;

public class ProductRepository {
	
	private ArrayList<Product> listOfProducts = new ArrayList<>();
	
	//ProductRepository 인스턴스를 하나만 공유하게끔 싱글톤 패턴 이용
	private static ProductRepository instance = new ProductRepository();
	
	//DB 접속에 필요한 멤버
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private static String url = "jdbc:mysql://localhost:3306/webstoredb?serverTimezone=UTC";
	private static String user = "root";
	private static String password = "0217";
	
	//ProductRepository 인스턴스를 리턴하는 getter 메서드
	public static ProductRepository getInstance() {
		return instance;
	}
	
	public ProductRepository() {
		//DB 연동전 임시데이터로 활용
		
//		Product phone = new Product("P1234", "iPhone 12 Pro Max", 1490000);
//		phone.setDescription("6.7-inch, 2778*1284-pixel, OLED Super Retina XDR display, cameras");
//		phone.setCategory("Smart Phone");
//		phone.setManufacturer("Apple");
//		phone.setUnitPrice(1490000);
//		phone.setCondition("New");
//		phone.setNumberOfStock(7000);
//		phone.setFilename("iphone-12-pro-max-gold-hero.jpg");
//		
//		Product notebook = new Product("P1235", "LG 울트라 기어", 1930000);
//		notebook.setDescription("15-inch, 1920*1080-pixel, IPS LED display, 10세대 인텔 코어 i7-10510U 프로세서");
//		notebook.setCategory("Notebook");
//		notebook.setManufacturer("LG");
//		notebook.setUnitPrice(1930000);
//		notebook.setCondition("Refurblished");
//		notebook.setNumberOfStock(5000);
//		notebook.setFilename("usp_0103.jpg");;
//		
//		Product tablet = new Product("P1236", "갤럭시 탭 S7+", 1149500);
//		tablet.setDescription("12-inch, 2800*1752-pixel, Super AMOLED display, Octa-Core 프로세서");
//		tablet.setCategory("Tablet");
//		tablet.setManufacturer("Samsung");
//		tablet.setUnitPrice(1149500);
//		tablet.setCondition("Old");
//		tablet.setNumberOfStock(3000);
//		tablet.setFilename("b008b623-6fe8-4191-82bd-d988db87e6e6.jpg");
//		
//		listOfProducts.add(phone);
//		listOfProducts.add(notebook);
//		listOfProducts.add(tablet);
		
	}
	
	//모든 상품 정보를 넘겨주는 getter 메서드
	public ArrayList<Product> getAllProducts() {
		String sql = "select * from product";
		
		try {
			conn = getConnection();  //커넥션 얻기
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();  //DB에 저장되어 있는 상품 모두 가져와 ResultSet에 담음.
			
			while(rs.next()) {
				Product product = new Product();  //빈 객체인 product에 각각 db에서 가져온 값을 저장
				product.setProductId(rs.getString("productId"));
				product.setPname(rs.getString("pname"));
				product.setUnitPrice(rs.getInt("unitPrice"));
				product.setDescription(rs.getString("description"));
				product.setManufacturer(rs.getString("manufacturer"));
				product.setCategory(rs.getString("category"));
				product.setNumberOfStock(rs.getLong("numberOfStock"));
				product.setCondition(rs.getString("conditions"));
				product.setFilename(rs.getString("filename"));
				
				listOfProducts.add(product);  //ArrayLsit 컬렉션에 product 객체 추가
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				System.out.println("DB 연동 해제");
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return listOfProducts;  // 각 객체가 저장되어 ArrayList 리턴함.
	}
	
	//DB 접속(Connection 객체 리턴하는 메서드)
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");  //드라이버명
			conn = DriverManager.getConnection(url, user, password);  //DB연결 객체 얻음
			System.out.println("DB 연동 완료");
		} catch (Exception e) {
			System.out.println("DB 연동 실패");
			e.printStackTrace();
		}
		
		return conn;
	}
	
	//listOfProducts에 저장된 모든 상품 목록을 조회해서 상품아이디와 일치하는 상품을 리턴하는 메서드
	public Product getProductById(String productId) {
		Product productById = new Product();
		
		String sql = "select * from product where productId = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			
			rs = pstmt.executeQuery();  //인자값으로 넘어온 productId 값에 해당하는 상품을 ResultSet객체에 하나만 저장됨.
			
			if(!rs.next()) {
				return null;  //일치하는 상품없는 상태임
			}
			
			//인자값으로 넘어온 productId값이 있다면
			if(rs.next()) {
				productById.setProductId(rs.getString("productId"));
				productById.setPname(rs.getString("pname"));
				productById.setUnitPrice(rs.getInt("unitPrice"));
				productById.setDescription(rs.getString("description"));
				productById.setManufacturer(rs.getString("manufacturer"));
				productById.setCategory(rs.getString("category"));
				productById.setNumberOfStock(rs.getLong("numberOfStock"));
				productById.setCondition(rs.getString("conditions"));
				productById.setFilename(rs.getString("filename"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				System.out.println("DB 연동 해제");
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
//		for(int i = 0; i < listOfProducts.size(); i++) {
//			Product product = listOfProducts.get(i);
//			
//			if(productId != null && product.getProductId() != null && 
//					product.getProductId().equals(productId)) {
//				productById = product;
//				break;
//			}
//			
//		}
		
		return productById;
	}
	
	//상품을 추가하는 메서드
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
	
}

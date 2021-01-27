package kr.gov.dto;

/*
 * *자바 빈(bean)을 이용한 정보 조회
 * 		1.자바 빈
 * 			1) Java EE 프로그래밍시 여러 객체를 거치면서 만들어지는 데이터를 저장하거나 전달하는데 사용되는 클래스.
 * 			2) 자바의 DTO(Data Transfer Object, 데이터 전송 객체) 클래스, VO(Value Object, 값 객체) 클래스와 같은 개념.
 * 		2.자바 빈 특징
 * 			1) 속성의 접근 제한자는 private임.
 * 			2) 각 속성(attribute, property)은 각각의 getter/setter를 가짐.
 * 			3) 인자 없는 생성자를 반드시 가지며 다른 생성자도 추가할 수 있음.
 */

//Product라는 클래스 => 자바 빈 객체가 되는 것.
public class Product {
	private String productId;  //상품 아이디
	private String pname;  //상품명
	private int unitPrice;  //상품 가격
	private String description;  //상품 설명
	private String manufacturer;  //제조사
	private String category;  //분류
	private long numberOfStock;  //재고 수
	private String condition;  //신상품 or 중고품 or 재생품
	private String filename;  //제품 이미지
	private int quantity;  //장바구니에 담은 갯수
	
	public Product() {
		
	}

	public Product(String productId, String pname, int unitPrice) {
		super();
		this.productId = productId;
		this.pname = pname;
		this.unitPrice = unitPrice;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getNumberOfStock() {
		return numberOfStock;
	}

	public void setNumberOfStock(long numberOfStock) {
		this.numberOfStock = numberOfStock;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
}

package kr.co.kihd.pmapp;

//상품관리 프로그램

//조상클래스
public class Product {
	
	private int productId;
	private String description;
	private String maker;
	private int price;
	
	//생성자
	public Product(int productId, String description, String maker, int price) {
		super();
		this.productId = productId;
		this.description = description;
		this.maker = maker;
		this.price = price;
	}

	//getter() 제공
	public int getProductId() {
		return productId;
	}

	public String getDescription() {
		return description;
	}

	public String getMaker() {
		return maker;
	}

	public int getPrice() {
		return price;
	}
		
	public void showInfo() {
		System.out.println("상품ID >> " + (this.getProductId() + 1));
		System.out.println("상품설명 >> " + this.getDescription());
		System.out.println("생산자 >> " + this.getMaker());
		System.out.println("가격 >> " + this.getPrice());
	}
	
}

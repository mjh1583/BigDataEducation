package kr.gov.dao;

import java.util.ArrayList;

import kr.gov.dto.Product;

public class ProductRepository {
	
	private ArrayList<Product> listOfProducts = new ArrayList<>();
	
	//ProductRepository 인스턴스를 하나만 공유하게끔 싱글톤 패턴 이용
	private static ProductRepository instance = new ProductRepository();
	
	//ProductRepository 인스턴스를 리턴하는 getter 메서드
	public static ProductRepository getInstance() {
		return instance;
	}
	
	public ProductRepository() {
		//DB 연동전 임시데이터로 활용
		
		Product phone = new Product("iPhone13,4", "iPhone 12 Pro Max", 1490000);
		phone.setDescription("6.7-inch, 2778*1284-pixel, OLED Super Retina XDR display, cameras");
		phone.setCategory("Smart Phone");
		phone.setManufacturer("Apple");
		phone.setUnitPrice(1490000);
		phone.setCondition("New");
		phone.setNumberOfStock(7000);
		
		Product notebook = new Product("15U70N-PA70K", "LG 울트라 기어", 1930000);
		notebook.setDescription("15-inch, 1920*1080-pixel, IPS LED display, 10세대 인텔 코어 i7-10510U 프로세서");
		notebook.setCategory("Notebook");
		notebook.setManufacturer("LG");
		notebook.setUnitPrice(1930000);
		notebook.setCondition("Refurblished");
		notebook.setNumberOfStock(5000);
		
		Product tablet = new Product("SM-T970NZKEKOO", "갤럭시 탭 S7+", 1149500);
		tablet.setDescription("12-inch, 2800*1752-pixel, Super AMOLED display, Octa-Core 프로세서");
		tablet.setCategory("Tablet");
		tablet.setManufacturer("Samsung");
		tablet.setUnitPrice(1149500);
		tablet.setCondition("Old");
		tablet.setNumberOfStock(3000);
		
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
		
	}
	
	public ArrayList<Product> getAllProducts() {
		return listOfProducts;
	}
	
	public Product getProductById(String productId) {
		Product productById = null;
		
		for(int i = 0; i < listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			
			if(productId != null && product.getProductId() != null && 
					product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
			
		}
		
		return productById;
	}
	
	//상품을 추가하는 메서드
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
	
}

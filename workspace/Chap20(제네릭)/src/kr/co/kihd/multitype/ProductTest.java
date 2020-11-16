package kr.co.kihd.multitype;

public class ProductTest {

	public static void main(String[] args) {
		
		Product<Tv, String> p1 = new Product<>();
		p1.setT(new Tv(2020, 11));
		p1.setM("LG OLED AI TV");
		
		System.out.println("나의 TV는 " + p1.getT().getYear() + "년 " + 
							p1.getT().getMonth() + "월 식이며, " + p1.getM() + "입니다.");
		
		Product<Car, String> p2 = new Product<>();
		p2.setT(new Car("현대", 2021, 7));
		p2.setM("펠리세이드 캘리그래피");
		
		System.out.println("나의 Car는 " + p2.getT().getYear() + "년 " + p2.getT().getMonth() + "월 출시된, " 
										+ p2.getT().getBrand() + "의 "+ p2.getM() + "입니다.");
	}

}

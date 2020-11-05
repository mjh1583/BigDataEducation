package kr.co.kihd.polyparameter;

public class TV extends Product {
	
	public TV() {
		//조상클래스의 매개변수가 있는 생성자 Product(int price){}를 호출
		super(300);
	}

	@Override
	public String toString() {
		return "TV";
	}
	
}

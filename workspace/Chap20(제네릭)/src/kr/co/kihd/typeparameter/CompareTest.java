package kr.co.kihd.typeparameter;

public class CompareTest {
	
	public static void main(String[] args) {
		
		int result = Compare.compare(100, 200);
		System.out.println(result);
		
		result = Compare.compare(200, 200);
		System.out.println(result);
		
		result = Compare.compare(300, 200);
		System.out.println(result);
		
		//String 클래스는 Number클래스하고는 아무런 관계가 없다.
		//Compare.compare("최지만", "김지만");
		
		//Number클래스는 Object클래스의 자손이기 때문에 매개변수 타입으로 적합하지 않음.
		//Compare.compare(new Object(), new Object());
		
		result = Compare.compare(100, 75.11);   //auto boxing
		System.out.println(result);  // 앞의 값이 크면 1
		
		//Number는 추상클래스이므로 인스턴스를 생성하지 못한다.
		//result = Compare.compare(new Number(), new Number());
		
	}
	
}

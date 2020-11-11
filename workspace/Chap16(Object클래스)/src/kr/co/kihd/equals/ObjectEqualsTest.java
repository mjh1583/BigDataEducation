package kr.co.kihd.equals;

public class ObjectEqualsTest {
	
	public static void main(String[] args) {
		
		//Object 클래스의 equals()
		//주소 비교
		Object object1 = new Object();
		Object object2 = new Object();
		
		//Object클래스의 eqauls()는 원론적으로 메모리 번지 비교
		boolean result1 = object1.equals(object2);
		boolean result2 = (object1 == object2);
		
		System.out.println("equals() : " + result1);
		System.out.println("== 연산자: " + result2);
		System.out.println(object1);
		System.out.println(object2);
		
	}
	
}

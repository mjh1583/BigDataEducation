package kr.co.kihd.genericmethod;

public class PersonTest {
	
	public static void main(String[] args) {
		
//		Person<Integer> p1 = Util.<Integer>changing(100);
		Person<Integer> p1 = Util.changing(100);  //자동 박싱(auto boxing)
		int value = p1.getT();
		System.out.println("Person 객체가 가지고 있는 값 : " + value);
		
		Person<String> p2 = Util.changing("최지만");  //자동 박싱(auto boxing)
		String str = p2.getT();
		System.out.println("Person 객체가 가지고 있는 값 : " + str);
		
	}
	
}

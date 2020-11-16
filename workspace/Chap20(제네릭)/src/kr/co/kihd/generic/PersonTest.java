package kr.co.kihd.generic;

public class PersonTest {

	public static void main(String[] args) {
		
		//Person 제네릭 클래스에 T를 String만 들어오게끔 무조건 만들겠다.
		Person<String> person = new Person<>();
		person.setT("최지만");
		String str = person.getT();
		System.out.println(str);
		
		//데이터의 통일화, 타입변환제거, 컴파일시 예외를 발생
		Person<Integer> person2 = new Person<>();
		person2.setT(100);  //자동 언박싱 => Integer value = 100;
		int value = person2.getT();
		System.out.println(value);
		
		Person<Apple> person3 = new Person<>();
		person3.setT(new Apple());
		Apple apple = person3.getT();
		System.out.println(apple);
		
	}

}

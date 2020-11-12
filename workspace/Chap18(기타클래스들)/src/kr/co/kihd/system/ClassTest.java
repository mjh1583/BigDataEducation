package kr.co.kihd.system;

public class ClassTest {
	
	public static void main(String[] args) {
		
		//객체로부터 클래스 정보를 얻는 방법(getClass())
		Person person = new Person();
		Class class1 = person.getClass();
		
		System.out.println(class1.getName());
		System.out.println(class1.getSimpleName());
		
	}
	
}

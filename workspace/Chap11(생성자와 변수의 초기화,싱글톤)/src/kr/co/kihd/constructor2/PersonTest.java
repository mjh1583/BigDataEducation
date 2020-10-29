package kr.co.kihd.constructor2;

//Person 객체를 만들어 사용한다.
public class PersonTest {

	public static void main(String[] args) {
		
		Person person = new Person("추신수");
		person.setAge(27);
		System.out.println(person);
		
		Person person2 = new Person(18);
		person2.setName("홍길동");
		System.out.println(person2);
		
		Person person3 = new Person("이순신", 20);
		System.out.println(person3);
		
	}
	
}

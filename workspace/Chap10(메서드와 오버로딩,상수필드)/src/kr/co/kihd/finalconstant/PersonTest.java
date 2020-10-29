package kr.co.kihd.finalconstant;

public class PersonTest {

	public static void main(String[] args) {
		
		Person person = new Person(50);
		//final 속성은 상수이므로 값을 절대 변경 못함.
		//person.NATION = "USA";    //불가함 확인
		//person.AGE = 60;          //불가함 확인
		System.out.println(person);
		System.out.println(Person.MAX_NUMBER);
		
		Person person1 = new Person(150);
		Person person2 = new Person(250);
		System.out.println(person);
		System.out.println(person1);
		System.out.println(person2);
		
		System.out.println(person.AGE);
		System.out.println(person1.AGE);
		System.out.println(person2.AGE);
		
	}
	
}

package kr.co.kihd.constructor2;

//사람을 나타낸다.
public class Person {
	
	private String name;
	private int age;
	
	//기본 생성자
	public Person() {

	}
	
	public Person(String name) {
		this.name = name;
	}
	
	public Person(int age) {
		this.age = age;
	}
	
	public Person(String name, int age) {
		this.name = name;
		this.age = age;
	}

	//접근자 메소드(getter)
	public String getName() {
		return name;
	}

	public int getAge() {
		return age;
	}
	
	@Override
	public String toString() {
		return "이름 : " + this.getName() + ", 나이 : " + this.getAge();
	}
	
	//변경자 메소드(setter)
	public void setName(String name) {
		this.name = name;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
}

package kr.co.kihd.inheritancereview;

class Person3 {}
class Student3 extends Person3 {}
class Researcher3 extends Person3 {}
class Professor3 extends Researcher3 {}

public class InstanceOfEx {
	
	static void print(Person3 person3) { //업캐스팅 때문에 자손 클래스들도 사용가능 => 다형성
		if(person3 instanceof Person3)
			System.out.println("Person3 타입");
		if(person3 instanceof Student3)
			System.out.println("Student3 타입");
		if(person3 instanceof Researcher3)
			System.out.println("Researcher3 타입");
		if(person3 instanceof Professor3)
			System.out.println("Professor3 타입");
	}
	
	public static void main(String[] args) {
		
		InstanceOfEx.print(new Person3());
		System.out.println();
		InstanceOfEx.print(new Student3());
		System.out.println();
		print(new Researcher3());
		System.out.println();
		print(new Professor3());
		
		
	}
	
}

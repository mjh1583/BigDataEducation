package kr.co.kihd.inheritancereview;

class Person {
	String name;
	String id;
	
	public Person(String name) {
		this.name = name;
	}
}

class Student extends Person{
	String grade;
	String drpartment;
	
	public Student(String name) {
		super(name);
	}
}

public class UpcastingEx {
	
	public static void main(String[] args) {
		
		Student student = new Student("홍길동");
		student.drpartment = "컴퓨터과";
		Person person = new Student("최지만"); //왼쪽이 원래 타입, 오른쪽은 상속받은 클래스 => 따라서 업캐스팅(Upcasting)(자동 형변환)
		person.id = "111";
	}
	
}

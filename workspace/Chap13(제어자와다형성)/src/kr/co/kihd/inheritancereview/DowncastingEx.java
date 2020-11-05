package kr.co.kihd.inheritancereview;

class Person2 {
	String name;
	String id;
	
	public Person2(String name) {
		this.name = name;
	}
}

class Student2 extends Person2 {
	String grade;
	String department;
	
	public Student2(String name) {
		super(name);
	}	
}

public class DowncastingEx {
	
	public static void main(String[] args) {
		
		Person2 person2 = new Student2("홍길동");  //업캐스팅
		//person2.
		
		Student2 student2 = (Student2)person2;   //다운캐스팅(강제형변환)
		student2.grade = "A";
		
	}
	
}

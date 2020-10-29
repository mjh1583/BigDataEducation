package kr.co.kihd.constructor1;

public class StudentTest {

	public static void main(String[] args) {
		//기본생성자 호출
		Student student = new Student();
		System.out.println(student.getAge());
		System.out.println(student.toString());
		
		//매개변수가 있는 생성자 호출
		Student student2 = new Student("최지만", 20);
		System.out.println(student2.toString());
		
		//매개변수가 있는 생성자 호출
		Student student3 = new Student("손흥민");
		System.out.println(student3.toString());
		
		//매개변수가 있는 생성자 호출
		Student student4 = new Student(28);
		System.out.println(student4.toString());
	}
	
}

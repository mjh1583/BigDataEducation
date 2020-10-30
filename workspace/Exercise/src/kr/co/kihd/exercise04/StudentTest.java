package kr.co.kihd.exercise04;

public class StudentTest {

	public static void main(String[] args) {
		
		Student student = new Student(14, "최지만", 50, 60, 80);
		
		System.out.println(student);
		int x = student.getScore(1);
		System.out.println("시험점수 1번 : " + x);
		student.setScore(2, 50);
		System.out.println(student);
		
		student.getScore(5);
		student.setScore(5, 99);
	}
	
}

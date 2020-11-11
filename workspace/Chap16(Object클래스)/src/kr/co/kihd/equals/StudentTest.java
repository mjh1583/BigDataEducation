package kr.co.kihd.equals;

public class StudentTest {
	
	public static void main(String[] args) {
		
		Student student1 = new Student(10, "최지만", new int[] {100, 80});
		Student student2 = new Student(20, "류현진", new int[] {100, 90});
		
		System.out.println(student1.equals(student2));
		

		Student student3 = new Student(10, "최지만", new int[] {100, 90});
		Student student4 = new Student(10, "최지만", new int[] {100, 90});
		
		System.out.println(student3.equals(student4));
		
	}
	
}

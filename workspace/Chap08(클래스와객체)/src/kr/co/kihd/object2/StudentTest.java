package kr.co.kihd.object2;

public class StudentTest {
	
	public static void main(String[] args) {
		
		//각각 독립된 저장공간을 가지는 인스턴스가 힙에 할당됨.
		Student stu1 = new Student();
		Student stu2 = new Student();
		
		stu1.name = "최지만";
		stu1.age = 20;
		System.out.println(stu1);
		System.out.println(stu2);
		
		//stu1의 주소를 stu2에다가 대입.
		//원래 stu2가 가리키고 있던 인스턴스는 쓰레기 객체가 됨.
		//gc(garbage collector)가 쓰레기 객체를 수집하여 소멸시킴.
		stu2 = stu1;
		System.out.println(stu1);
		System.out.println(stu2);
		
		stu2.age = 10;
		System.out.println(stu1);
		System.out.println(stu2);
		
	}
	
}

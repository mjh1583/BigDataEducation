package kr.co.kihd.polymorphism2;

public class ReferTest {
	
	public static void main(String[] args) {
		
		Parent parent = new Child();
		Child child = new Child();
		
		//"멤버변수"는 원래 타입을 벗어나지 못함.
		System.out.println(parent.x);
		System.out.println(child.x);
		
		//"멤버메서드"는 현재 참조하고 있는 인스턴스에 영향을 받음(오버라이딩)
		parent.method();
		child.method();
		
		parent.type(new Child());
		parent.type(new Parent());
		parent.type(new Car());
	}
		
}

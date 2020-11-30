package kr.co.kihd.event2;

public class InnerClassTest2 {
	
	public static void main(String[] args) {
		
		Outer1 ot1 = new Outer1();
		Outer1.Inner oi = ot1.new Inner();
		oi.innerFunc();
		
	}
	
}

class Outer1 {
	int value = 100;
	
	class Inner {
		int value = 200;
		
		void innerFunc() {
			int value = 300;
			System.out.println("innerFunc의 value : " + value);
			System.out.println("Inner클래스의 value : " + this.value);
			System.out.println("Outer1클래스의 value : " + Outer1.this.value);
		}
		
	} //Inner 클래스
	
} //Outer1 클래스
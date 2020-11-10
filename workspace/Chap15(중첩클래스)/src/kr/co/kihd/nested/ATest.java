package kr.co.kihd.nested;

import kr.co.kihd.nested.A.C;

public class ATest {
	
	public static void main(String[] args) {
		
		A a = new A();
		//인스턴스 클래스 B는 반드시 외부 클래스 A의 인스턴스가 있어야 생성가능
		System.out.println("--------------------------------------------");
		
		A.B b = a.new B();
		System.out.println(b.a);
		b.method1();
		System.out.println("--------------------------------------------");
		
		System.out.println(A.C.b);
		A.C.method2();
		//정적 멤버 클래스인 C는 외부클래스 A의 인스턴스가 있던 없던 상관없이 접근 가능
		A.C c = new A.C();
		System.out.println(c.a);
		System.out.println(C.b);
		c.method1();
		C.method2();
		System.out.println("--------------------------------------------");
		
	}
	
}

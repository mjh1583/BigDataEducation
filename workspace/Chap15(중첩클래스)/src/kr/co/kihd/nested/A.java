package kr.co.kihd.nested;

public class A {
	
	public A() {
		System.out.println("----------------------------------------------------");
		System.out.println("외부클래스 A의 생성자 호출");
		
		B b = new B();  //인스턴스 멤버클래스는 외부클래스 A의 멤버이다.
		System.out.println(b.a);
		b.method1();
		
		System.out.println(A.C.b);
		A.C.method2();
		C c = new C();
		System.out.println(c.a);
		System.out.println(C.b);
		c.method1();
		C.method2();
	}
	
	//인스턴스 멤버클래스 B
	class B {
		int a = 10;
		//static int cv = 20;
			
		public B() {
			System.out.println("중첩클래스 B의 생성자 호출");	
		}
			
		public void method1() {
			System.out.println("B클래스의 멤버메서드 호출");
		}
			
		//static void method2() {}
	}
	
	//정적 멤버 클래스 C
	static class C {
		int a = 10;
		static int b = 20;
		
		public C() {
			System.out.println("정적멤버클래스 C의 생성자 호출");
		}
		
		public void method1() {
			System.out.println("정적멤버클래스 C의 method1() 호출");
		}
		
		public static void method2() {
			System.out.println("정적멤버클래스 C의 정적메서드 method2() 호출");
		}
	}
	
}

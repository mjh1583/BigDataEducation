package kr.co.kihd.nested;

public class NestedTest {
	
	//인스턴스 멤버 클래스
	class A {
		int iv = 100;
		//static int cv = 200;        //static 멤버변수는 사용불가
		
		public A() {
			System.out.println("A생성자 호출");
		}
		
		public void method() {
			System.out.println("A클래스의 method() 호출");
		}		
		
	}
	
	//정적 멤버 클래스
	static class B {
		int iv = 100;
		static int cv = 500;         //NestedTest.B.cv 접근가능
		
		public B() {
			System.out.println("B 생성자 호출");
		}
		
		public void method1() {
			System.out.println("B클래스의 method1() 호출");
		}
		
		public static void method2() {
			System.out.println("B클래스의 method2() 호출");
		}
		
	}
	
	public void method() {
		//로컬클래스 : 메서드내에 선언과 사용(잠싼 사용할 용도)
		class C {
			int iv = 200;
			//static int cv = 700;    //static 멤버 선언 불가
			public C() {
				System.out.println("로컬클래스C 생성자 호출");
			}
			public void lmethod() {
				System.out.println("로컬클래스C 메서드 호출");
			}
		}
		
		//로컬클래스는 해당 메서드 내에서만 사용이 가능하다는 것에 주목
		C c = new C();
		System.out.println(c.iv);
		c.lmethod();
	}
	
	public void method2() {
		class D {
			int iv = 200;
	
			public D() {
				System.out.println("로컬클래스D 생성자 호출");
			}
			public void lmethod() {
				System.out.println("로컬클래스D 메서드 호출");
			}
		}
		
		D d = new D();
		System.out.println(d.iv);
		d.lmethod();
	}
	
	public static void main(String[] args) {
		
		NestedTest nestedTest = new NestedTest();
		//인스턴스 멤버 클래스는 외부클래스의 인스턴스가 반드시 있어야 생성가능함.
		NestedTest.A a = nestedTest.new A();
		System.out.println(a.iv);
		a.method();
		System.out.println("---------------------------------------------------");
		
		//정적클래스 : 외부클래스의 인스턴스가 없이도 접근 가능
		System.out.println(NestedTest.B.cv);
		NestedTest.B.method2();
		//NestedTest.B.method1();         //B 생성해야 접근가능
		System.out.println("---------------------------------------------------");
		
		nestedTest.method();
		System.out.println("---------------------------------------------------");
		
		nestedTest.method2();
	}
	
}

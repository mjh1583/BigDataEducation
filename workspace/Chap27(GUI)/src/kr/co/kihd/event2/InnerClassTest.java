package kr.co.kihd.event2;

public class InnerClassTest {
	
	public static void main(String[] args) {
		
		Outer outer = new Outer();
		System.out.println("Outer의 aa값 : " + outer.aa);
		System.out.println("Outer의 bb값 : " + Outer.bb);
		outer.method();
		
		System.out.println("-------Inner 클래스 접근하기--------");
		Outer outer2 = new Outer();
		Outer.Inner inner = outer2.new Inner();
		System.out.println("Inner의 cc값 : " + inner.cc);
		inner.subFunc();
		
		Outer.StaticInner staticInner = new Outer.StaticInner();
		System.out.println("Inner의 dd값 : " + staticInner.dd);
		System.out.println("Inner의 ee값 : " + Outer.StaticInner.ee);
		staticInner.subFunc1();
		//staticInner.subFunc2();    
		Outer.StaticInner.subFunc2();
		
	}
	
}

class Outer {
	int aa = 100;            //인스턴스 변수, non-static 변수
	static int bb = 200;     //클래스 변수, static 변수
	
	public void method() {
		System.out.println("---------일반 메서드----------");
	}
	
	//Member Inner 클래스(non-static 내부 클래스)
	class Inner {            
		int cc = 10;
		public void subFunc() {
			System.out.println("---------Inner Class(non-static)----------");
			System.out.println("외부클래스의 변수 aa  : " + aa);
			System.out.println("외부클래스의 변수 bb  : " + bb);
			method();
		}
	}
	
	//Member Inner 클래스(static 내부 클래스)
	static class StaticInner {
		int dd = 20;
		static int ee = 30;
		
		public void subFunc1() {
			System.out.println("---------Inner Class(static)----------");
		}
		
		public static void subFunc2() {
			System.out.println("---------Inner Class(static2)----------");
		}
		
	}
	
}
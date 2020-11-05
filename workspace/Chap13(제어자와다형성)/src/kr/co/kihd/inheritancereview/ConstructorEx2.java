package kr.co.kihd.inheritancereview;

class A2 {
	public A2() {
		System.out.println("생성자 A");
	}
	
	public A2(int x) {
		
	}
}

class B2 extends A2 {
	public B2() {
		System.out.println("생성자 B");
	}
	
	public B2(int x) {
		super(30);
	}
}

public class ConstructorEx2 {
	
	public static void main(String[] args) {
		
		B2 b2 = new B2(3);
		
	}
	
}

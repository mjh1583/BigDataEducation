package kr.co.kihd.nested2;

public class ATest {
	
	public static void main(String[] args) {
		
		Aaccess a = new Aaccess();
		Aaccess.B b = a.new B();
		a.method1();
		
	}
	
}

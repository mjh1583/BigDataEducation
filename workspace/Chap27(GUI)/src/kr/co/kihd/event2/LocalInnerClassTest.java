package kr.co.kihd.event2;

public class LocalInnerClassTest {
	
	String str = "멤버 변수 str";
	
	public void method() {
		final int aa = 100;
		System.out.println(str);
		System.out.println(aa);
		
		class LocalInner {
			String str1 = "로컬 이너클래스의 변수";
			
			public void show() {
				System.out.println("LocalInnerClassTest의 변수 str : " + str);
				System.out.println("LocalInner의 변수 str1 : " + str1);
				System.out.println("method()의 지역변수 aa : " + aa);
			}
		}
		
		LocalInner li = new LocalInner();    //내부에서만 객체생성가능함.
		li.show();
	}
	
	public static void main(String[] args) {
		
		LocalInnerClassTest local = new LocalInnerClassTest();
		local.method();
		
	}
	
}

package kr.co.kihd.anonymous;

public class ChildTest {
	
	public static void main(String[] args) {
		
		//익명자손객체(이름없음) -- UI이벤트 처리나 스레드 객체 간편하게 생성시 사용
		Parent child = new Parent() {   //원래타입이 클래스임
			
			int b = 10;
			public void method1() {
				System.out.println("익명자손객체 메서드");
			}
			
			@Override
			public void method() {
				int a = 10;
				System.out.println("a : " + a);
				System.out.println(this.b);
				this.method1();
			}
			
		};
		
		child.method();
		//child.b;                       //부모타입멤버가 아님
		//child.method1();               //부모타입멤버가 아님
	}
	
}

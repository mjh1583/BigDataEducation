package kr.co.kihd.innerouter;

public class Outside {
	
	//필드선언
	String str = "Outside-field";
	
	//멤버메서드
	public void method() {
		System.out.println("Outside-method() 호출");
	}
	
	class Inner {
		//필드선언
		String str = "Inner-field";
		
		//멤버메서드
		public void method() {
			System.out.println("Inner-method() 호출");
		}
		
		public void showInfo() {
			//여기에서 this는 Inner클래스의 this
			System.out.println(this.str);
			this.method();
			
			//외부클래스의 접근하는 방법
			//외부클래스명.this.외부클래스멤버이름
			System.out.println(Outside.this.str);
			Outside.this.method();
		}
		
	}
	
	public void show() {
		System.out.println("--------------------------------------");
		//외부클래스 영역에서의 this는 당연히 Outside클래스를 말한다.
		System.out.println(this.str);
		this.method();
		
		//외부클래스에서 내부클래스로 접근을 하려면 보이지 않는다.
		//인스턴스를 하나 생성해서 중첩클래스의 멤버들에게 접근하면 된다.
		Inner inner = new Inner();
		inner.showInfo();
	}
	
}

package kr.co.kihd.anonymous;

public class SoundTest {
	
	public static void main(String[] args) {
		
		//익명구현개체(이름 없음) -- UI이벤트 처리나 스레드 객체 간편하게 생성시 사용
		//						잠깐 사용할 목적
		Soundable soundable = new Soundable() {   //원래타입이 인터페이스
			
			//클래스이니까 내부적으로 멤버들을 선언 가능
			//하지만, 외부에서 접근 불가
			int a = 10;
			
			public void method() {
				System.out.println("익명구현개체 메서드");
			}
			
			@Override
			public void sound() {
				String str = "냄비";
				System.out.println("첫번째 익명구현객체 : " + str);
				System.out.println(str + "에 물을 담습니다.");
				System.out.println(str + "에 숟가락으로 탕탕소리를 냅니다.");
				
				this.method();
				System.out.println(this.a);
			}
		};
		
		soundable.sound();
		
		Soundable soundable2 = new Soundable() {   
			
			int a = 20;
			
			public void method() {
				System.out.println("밥그릇 익명구현개체 메서드");
			}
			
			@Override
			public void sound() {
				String str = "밥그릇";
				System.out.println("두번째 익명구현객체 : " + str);
				System.out.println(str + "에 물을 담습니다.");
				System.out.println(str + "에 숟가락으로 탕탕소리를 냅니다.");
				
				this.method();
				System.out.println(this.a);
			}
		};
		
		soundable2.sound();
		
	}
	
}

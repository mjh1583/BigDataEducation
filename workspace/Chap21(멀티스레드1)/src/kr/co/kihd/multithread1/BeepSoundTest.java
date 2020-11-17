package kr.co.kihd.multithread1;

//import java.awt.Toolkit;

public class BeepSoundTest {
	
	//main()은 JVM이 실행
	public static void main(String[] args) {
		
		//직접 생성하는 멀티스레드 방법 3가지
		//방법 1 --> 구현객체 (Runnable) 대입
		Runnable runnable = new Beep();  	//구현객체 대입
		Thread thread = new Thread(runnable);
		thread.start();
		
		//스레드는 한번 start() 실행하고 나면, 재실행이 안된다.
		//재실행을 하고자 한다면 인스턴스 한개 더 만들어야 한다.
		thread = new Thread(runnable);
		thread.start();
		
		//방법 2 --> 익명구현객체
//		Thread thread = new Thread(new Runnable() {
//			
//			@Override
//			public void run() {
//				
//				Toolkit toolkit = Toolkit.getDefaultToolkit();
//				
//				for(int i = 0; i < 5; i++) {
//					System.out.println("for문을 실행하는 스레드 이름 : " + Thread.currentThread().getName());
//					
//					toolkit.beep();   //비프음 출력
//					
//					try {
//						Thread.sleep(500);
//					} catch (InterruptedException e) {
//						e.printStackTrace();
//					}
//				}
//				
//			}
//		});
//		
//		thread.start();
		
		//방법 3 --> 람다식(함수적 인터페이스) JDK1.8, 코드절약, 가독성
//		Thread thread = new Thread( ()-> {
//			Toolkit toolkit = Toolkit.getDefaultToolkit();
//			
//			for(int i = 0; i < 5; i++) {
//				System.out.println("for문을 실행하는 스레드 이름 : " + Thread.currentThread().getName());
//				
//				toolkit.beep();   //비프음 출력
//				
//				try {
//					Thread.sleep(500);
//				} catch (InterruptedException e) {
//					e.printStackTrace();
//				}
//			}
//		});
//		thread.start();
		
		for(int i = 0; i < 5; i++) {
			System.out.println("for문을 실행하는 스레드 이름 : " + Thread.currentThread().getName());
			System.out.println("삐웅~");
			
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		
	}
	
}

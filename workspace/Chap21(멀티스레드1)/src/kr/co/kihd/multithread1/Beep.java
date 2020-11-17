package kr.co.kihd.multithread1;

import java.awt.Toolkit;

//Runnable 인터페이스르 직접 구현하고 있다.
public class Beep implements Runnable {

	@Override
	public void run() {
		Toolkit toolkit = Toolkit.getDefaultToolkit();
		
		for(int i = 0; i < 5; i++) {
			System.out.println("for문을 실행하는 스레드 이름 : " + Thread.currentThread().getName());
			
			toolkit.beep();   //비프음 출력
			
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		
	}

}

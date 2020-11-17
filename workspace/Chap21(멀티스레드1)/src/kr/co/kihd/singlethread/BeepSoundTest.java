package kr.co.kihd.singlethread;

import java.awt.Toolkit;

public class BeepSoundTest {
	
	//main()은 JVM이 실행한다.
	public static void main(String[] args) {
		
		//현재 실행중인 스레드 명을 출력함
		System.out.println(Thread.currentThread().getName());
		
		//Toolkit은 추상클래스인데, 그중에 GUI관련된 메서드들로 구성되어진 인스턴스를
		//getDefaultToolkit()을 통해서 탐조를 얻어냄.
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
		
		for(int i = 0; i < 5; i++) {
			System.out.println("삐웅~");
			
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		
		//싱들스레드를 멀티스레드로 바꿔서 프로그램을 만드는것이 우리의 목표
	}
	
}

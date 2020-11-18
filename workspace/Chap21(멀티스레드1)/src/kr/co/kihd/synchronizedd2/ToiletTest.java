package kr.co.kihd.synchronizedd2;

public class ToiletTest {
	
	public static void main(String[] args) {
		
		Toilet toilet = new Toilet();
		
		Thread thread1 = new UsingToilet(toilet, "아버지");
		Thread thread2 = new UsingToilet(toilet, "어머니");
		Thread thread3 = new UsingToilet(toilet, "아들");
		Thread thread4 = new UsingToilet(toilet, "딸");
		
		thread1.start();
		thread2.start();
		thread3.start();
		thread4.start();
		
	}
	
}

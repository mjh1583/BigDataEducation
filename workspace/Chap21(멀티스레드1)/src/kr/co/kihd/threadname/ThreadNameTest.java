package kr.co.kihd.threadname;

public class ThreadNameTest {
	
	public static void main(String[] args) {
		
		Thread thread = Thread.currentThread();
		System.out.println("[프로그램 시작 스레드 명] : " + thread.getName());
		
		Thread threadGumi = new ThreadGumi();
		threadGumi.start();
		System.out.println("[ThreadGumi를 생성한 스레드 이름] : " + Thread.currentThread().getName());
		System.out.println("[main스레드가 threadGumi의 이름을 가져온 것] : " + threadGumi.getName());
		
		Thread threadDaegu = new ThreadDaegu();
		threadDaegu.start();
		System.out.println("[ThreadDaegu를 생성한 스레드 이름] : " + Thread.currentThread().getName());
		System.out.println("[main스레드가 threadDaegu의 이름을 가져온 것] : " + threadDaegu.getName());
		
	}
	
}

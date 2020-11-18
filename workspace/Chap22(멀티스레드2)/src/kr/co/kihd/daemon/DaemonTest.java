package kr.co.kihd.daemon;

public class DaemonTest {

	public static void main(String[] args) {
		
		AutoSaveThread autoSaveThread = new AutoSaveThread();
		//daemon설정 (필히, start() 호출전에 설정을 해야한다.)
		autoSaveThread.setDaemon(true);
		autoSaveThread.start();
		
		/*
		 * 메인스레드가 5초동안 정지하면, daemon스레드인 autoSaveThread가
		 * 실행되고, 메인스레드가 종료되면 더 이상 autoSaveThread실행이
		 * 안된다는 것을 알 수 있다.(종속적 관계)
		 */
		try {
			Thread.sleep(5000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		System.out.println("메인스레드 종료함");
	}

}

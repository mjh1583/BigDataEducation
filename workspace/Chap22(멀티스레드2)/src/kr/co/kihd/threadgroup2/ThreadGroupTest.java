package kr.co.kihd.threadgroup2;

public class ThreadGroupTest {
	
	public static void main(String[] args) {
		//현재 실행되고 있는 스레드 그룹을 얻어옴
		ThreadGroup mainGroup = Thread.currentThread().getThreadGroup();
		String threadGroup = mainGroup.getName();
		System.out.println(threadGroup);
		
		//myGroup은 main그룹의 하위 그룹으로 만들어짐
		ThreadGroup myGroup =  new ThreadGroup("myGroup");
		WorkThread workThreadA = new WorkThread(myGroup, "workThreadA");
		WorkThread workThreadB = new WorkThread(myGroup, "workThreadB");
		
		workThreadA.start();
		workThreadB.start();
		
		System.out.println("[메인 스레드 그룹의 list()메서드 호출 후 출력 내용]");
		ThreadGroup mainGroup2 = Thread.currentThread().getThreadGroup();
		mainGroup2.list();
		
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		myGroup.interrupt();
	
	}
	
}

package kr.co.kihd.synchronizedd2;

public class Toilet {
	
	//플래그 변수
	private boolean seat;
	
	public synchronized void use() throws Exception {
		String name = Thread.currentThread().getName();
		
		if(this.seat == false) {
			System.out.println(name + "가/이 화장실에 입장했습니다.");
			this.seat = true;
			
			Thread.sleep(1000);
			System.out.println(name + "가/이 말 : 아 시원하다!");
			
			this.seat = false;
			System.out.println(name + "가/이 화장실 사용을 마쳤습니다.");
			System.out.println();
		}
		else {
			System.out.println(name + "가/이 화장실 사용중입니다. 기다리세요!");
		}
	}
	
	public synchronized void knock() {
		System.out.println(Thread.currentThread().getName() + " 똑똑!");
	}
	
}

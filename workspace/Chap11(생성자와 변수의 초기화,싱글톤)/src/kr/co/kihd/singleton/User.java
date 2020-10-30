package kr.co.kihd.singleton;

public class User {

	//1. 해당 클래스 자신의 타입으로 정적 멤버 변수 선언과 동시에 생성함.
	private static User singleton = new User();
	
	//2. 해당 클래스를 외부에서 new 연산자로 인스턴스를 생성 못하게 막기.
	private User() {
		
	}
	
	//3. 해당 클래스 멤버의 주소를 넘겨주기(공유) 위해 외부에서 호출할 수 있는 getter() 메서드를 제공
	public static User getInstance() {
		return User.singleton;
	}
	
	
	
}

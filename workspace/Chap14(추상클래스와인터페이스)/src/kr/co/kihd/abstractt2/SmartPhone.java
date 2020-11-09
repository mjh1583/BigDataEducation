package kr.co.kihd.abstractt2;

public class SmartPhone extends Phone {

	public SmartPhone(int serialNo, String company, String owner) {
		super(serialNo, company, owner);
	}

	@Override
	public void turnOn() {
		System.out.println("스마트폰이 켜졌습니다.");
	}

	@Override
	public void turnOff() {
		System.out.println("스마트폰이 꺼졌습니다.");
	}
	
	//자체 메서드 
	public void internetSearch() { 
		System.out.println("구글 검색을 합니다!");
	}
	
}

package kr.co.kihd.abstractt2;

public class PhoneTest {
	
	public static void main(String[] args) {
		
		//추상클래스는 인스턴스를 생성할 수 없다.
//		Phone phone = new Phone();
		
		SmartPhone smartphone = new SmartPhone(201106, "LG-V50", "최지만");
		smartphone.showInfo();
		smartphone.turnOn();
		smartphone.turnOff();
		smartphone.internetSearch();
		System.out.println("=================================================");
		
		TripleCameraPhone tripleCameraPhone = new TripleCameraPhone(201112, "Apple iPhone12 pro", "류현진");
		tripleCameraPhone.showInfo();
		tripleCameraPhone.turnOn();
		tripleCameraPhone.turnOff();
		tripleCameraPhone.cameraOn();
		tripleCameraPhone.cameraOff();
		System.out.println("=================================================");
		
		Phone[] phone = new Phone[10];
		phone[0] = new SmartPhone(201106, "LG-V50", "추신수");
		phone[1] = new TripleCameraPhone(201112, "Apple iPhone12 pro", "박지성");
		
		//원래 타입이 Phone이니까 SmartPhone이나 TripleCameraPhone에 선언되어 있는 메서드는 사용을 못한다. 원래타입이 Phone이니까.
		phone[0].turnOff();
		phone[0].showInfo();
		
		System.out.println("=================================================");
		phone[1].turnOff();
		phone[1].showInfo();
		
	}
	
}

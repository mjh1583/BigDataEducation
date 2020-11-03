package kr.co.kihd.overriding;

public class UsbMemory extends Hdd {
	
	//멤버변수
	int capacity;
	int rpm;
	
	public UsbMemory() {
		
	}

	public UsbMemory(int capacity, int rpm) {
		this.capacity = capacity;
		this.rpm = rpm;
	}	
	
	//조상클래스의 메서드를 오버라이딩
	@Override
	public String status() {
		String str = "USB 용량 : " + this.capacity + "\nUSB 속도 : " + this.rpm + " (rpm)";
		return str;	
	}
	
	//오버로딩
	public String status(int i) {
		String str = "USB 용량2 : " + this.capacity + "\nUSB 속도2 : " + this.rpm + " (rpm)";
		return str;	
	}
}

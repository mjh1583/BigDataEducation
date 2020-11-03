package kr.co.kihd.overriding;

public class HddTest {

	public static void main(String[] args) {
		
		Hdd hdd = new Hdd(500, 7200);
		UsbMemory usbMemory = new UsbMemory(32, 960);
		
		System.out.println("HDD 상세");
		System.out.println(hdd.status());
		
		System.out.println("USB 상세");
		System.out.println(usbMemory.status());
		
		System.out.println(usbMemory.status(0));
		
	}
	
}

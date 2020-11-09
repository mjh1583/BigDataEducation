package kr.co.kihd.interfacee2;

public class RemoteTest {

	public static void main(String[] args) {
		
		RemoteControl rControl = new Television();
		rControl.turnOn();
		rControl.setVolume(15);
		rControl.setVolume(-100);
		rControl.turnOff();
		System.out.println();
		
		RemoteControl audio = new Audio();
		audio.turnOn();
		audio.setVolume(5);
		audio.turnOff();
	}

}

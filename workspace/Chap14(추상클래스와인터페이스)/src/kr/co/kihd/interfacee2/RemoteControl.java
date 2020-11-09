package kr.co.kihd.interfacee2;

public interface RemoteControl {
	
	//상수 (static final)
	int MAX_VOLUME = 10;
	int MIN_VOLUME = 0;
	
	//추상메서드 3개 선언 (abstract)
	public void turnOn();
	public void turnOff();
	public void setVolume(int volume);
	
}

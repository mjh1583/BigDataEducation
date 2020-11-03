package kr.co.kihd.overriding2;

public class SportsCar extends Car{
	
	public SportsCar() {
		
	}
	
	public SportsCar(int speed) {
		this.speed = speed;
	}
	
	@Override
	public void speedDown() {
		super.speedDown();
	}
	
	@Override
	public void stop() {
		System.out.println("스포츠카가 멈춥니다.");
	}
}

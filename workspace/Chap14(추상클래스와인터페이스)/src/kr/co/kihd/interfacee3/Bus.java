package kr.co.kihd.interfacee3;

public class Bus implements Vehiclable {

	private int speed;
	
	@Override
	public void run() {
		System.out.println("버스가 " + this.speed + "km로 달립니다.");
	}

	@Override
	public void stop() {
		System.out.println("버스가 멈춥니다.");
	}

	@Override
	public void setSpeed(int speed) {
		if(speed < 0) {
			System.out.println("속도가 음수일리가 없군요!");
			return;
		}
		
		this.speed = speed;
	}

}

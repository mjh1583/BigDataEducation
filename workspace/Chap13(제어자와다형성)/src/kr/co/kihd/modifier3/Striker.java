package kr.co.kihd.modifier3;

//자손 클래스
public class Striker extends Player {

	private int shoot;
	
	public Striker(String name, int age, int backNumber, int speed, int shoot) {
		super(name, age, backNumber, speed);
		this.shoot = shoot;
	}
	
	public int getShoot() {
		return this.shoot;
	}
	
	@Override
	public void info() {
		super.info();    //player의 info를 호출
		System.out.println("유효슈팅 : " + this.getShoot());
	}
	
}

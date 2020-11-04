package kr.co.kihd.modifier3;

//자손 클래스
public class Defender extends Player {

	private int defence;
	
	public Defender(String name, int age, int backNumber, int speed, int defence) {
		super(name, age, backNumber, speed);
		this.defence = defence;
	}
	
	public int getDefence() {
		return this.defence;
	}
	
	@Override
	public void info() {
		super.info();    //player의 info를 호출
		System.out.println("방어 횟수 : " + this.getDefence());
	}
	
}

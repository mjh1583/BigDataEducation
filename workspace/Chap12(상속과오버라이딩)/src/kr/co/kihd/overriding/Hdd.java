package kr.co.kihd.overriding;

public class Hdd {
	
	//멤버변수
	int capacity;      //용량
	int rpm;           //속도
	
	//기본 생성자
	public Hdd() {
		
	}

	//매개변수가 있는 생성자
	public Hdd(int capacity, int rpm) {
		this.capacity = capacity;
		this.rpm = rpm;
	}

	//HDD의 사용자 정의 메서드
	public String status() {
		String str = "하드디스크 용량 : " + this.capacity + "\n하드디스크 속도 : " + this.rpm + " (rpm)";
		return str;
	}	
	
}

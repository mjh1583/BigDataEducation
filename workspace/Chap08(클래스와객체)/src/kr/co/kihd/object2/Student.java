package kr.co.kihd.object2;

public class Student {
	
	//멤버 변수(필드)
	String name;
	int age;
	
	//Object 클래스의 toString() 오버라이딩(재정의)
	//this : 클래스의 주소(new라는 연산자가 인스턴스를 생성하면 비로소 활성화)
	@Override
	public String toString() {
		String str = "이름 : " + this.name + ", 나이 : " + this.age;
		return str;
	}
}

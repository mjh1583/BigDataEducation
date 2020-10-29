package kr.co.kihd.staticnonstatic;

public class MemberReferTest {

	int iv;         //인스턴스 멤버변수
	static int cv;  //정적 멤버변수
	
	//인스턴스 메서드
	//이유 : 인스턴스 메서드가 호출될때 이미 인스턴스가 생성되어 있을 것임.
	public void instanceMethod() {
		System.out.println(this.iv);  //인스턴스 변수 사용가능
		System.out.println(cv);       //정적 멤버변수 사용가능
		staticMethod();               //정적 멤버메서드 사용가능
	}

	//정적 메서드
	public static void staticMethod() {
		//System.out.println(this.iv);  //인스턴스 변수 사용불가
		System.out.println(cv);         //정적 멤버변수 사용가능
		//this.instanceMethod();        //인스턴스 멤버메서드 사용불가
	}
}

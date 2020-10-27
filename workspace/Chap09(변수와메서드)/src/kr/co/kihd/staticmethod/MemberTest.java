package kr.co.kihd.staticmethod;

public class MemberTest {

	public static void study() {
		System.out.println("자바 개발자가 필요합니다.");
	}
	
	public void memberMethod() {
		System.out.println("인스턴스 메소드");
	}
	
	public static void main(String[] args) {
		
		//static 멤버들이므로 인스턴스 생성없이, 얼마든지 클래스명.정적멤버명으로 접근이 가능하다는 것을 보여주고 있음.
		//static은 static만 호출이 가능함.
		Member.sMethod();
		Member.cv = 500;
		Member.sMethod();
		
		Member member = new Member();
		member.iMethod();
		member.iv = 999;
		member.iMethod();
		
		MemberTest.study();
		
		MemberTest memberTest = new MemberTest();
		memberTest.memberMethod();
		
	}
	
}

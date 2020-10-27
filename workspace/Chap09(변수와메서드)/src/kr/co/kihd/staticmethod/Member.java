package kr.co.kihd.staticmethod;

/*
 * 변수 : 1. 인스턴스(객체) 변수
 *       2. 클래스(static, 정적) 변수
 * 메소드 : 1. 인스턴스(객체) 메소드
 * 		  2. 클래스(static, 정적) 메소드
 * static이라는 키워드가 클래스 변수 혹은 클래스 메소드를 나타냄.
 * 이 키워드가 없으면 객체 변수나 객체 메소드를 나타냄.
 */
public class Member {

	int iv = 100;         //인스턴스 멤버변수
	static int cv = 200;  //static 멤버변수
	
	//인스턴스 메소드
	public void iMethod() {
		System.out.println("iv : " + this.iv);
		//System.out.println("cv : " + Member.cv);  //클래스명.정적변수명
	}
	
	//static 메소드
	public static void sMethod() {
		//System.out.println("iv : " + this.iv);
		//이유는 언제 인스턴스가 만들어질지는 아무도 모르기 때문.
		
		//cv는 static 변수이기 때문에 인스턴스 생성없이도 접근가능해야하는데, static매소드 내에서는 얼마든지 접근 가능함.
		System.out.println("cv : " + Member.cv);
	}
	
}

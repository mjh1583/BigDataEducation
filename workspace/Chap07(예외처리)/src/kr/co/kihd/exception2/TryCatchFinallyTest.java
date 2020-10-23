package kr.co.kihd.exception2;

public class TryCatchFinallyTest {
	
	public static void main(String[] args) {
		/*
		 * Class 클래스 : 문자열을 가지고 클래스로 만들어서 변환해줌(동적객체).
		 * 			    인스턴스의 정보만 알뿐이지 멤버를 사용하는 것은 안됨.
		 */
		try {
			Class class1 = Class.forName("java.lang.String1");
			System.out.println("클래스를 찾았습니다.");
			
			System.out.println(class1.getName()); //패키지 + 클래스명 출력
			System.out.println(class1.getSimpleName()); // 클래스명 출력
			
		} catch (ClassNotFoundException e) {
			System.out.println("클래스가 없습니다.");
		} finally {    //옵션(항상 실행함)
			System.out.println("프로그램을 안전하게 종료합니다.");
		}
	}
}

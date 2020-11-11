package kr.co.kihd.string2;

public class IndexOfTest {
	
	public static void main(String[] args) {
		
		String str = "오늘은 자바 하기가 좋네요";
		//indexOf()메서드 : 찾기 기능을 할때 자주 쓰임
		int index = str.indexOf("공부");
		System.out.println("공부의 시작 방 번호 : " + index);
		
		if(str.indexOf("공부") != -1) {
			System.out.println("공부와 관련된 내용이군요.");
		}
		else {
			System.out.println("공부와 관련없는 내용이군요.");
		}
	}
	
}

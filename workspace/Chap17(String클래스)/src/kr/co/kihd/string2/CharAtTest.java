package kr.co.kihd.string2;

public class CharAtTest {
	
	public static void main(String[] args) {
		
		String str = "980203-2456871";
		
		//특정문자를 받고자 할때
		char gender = str.charAt(7);
		
		if(gender == '1' || gender == '3') {
			System.out.println("남자입니다.");
		}
		else if(gender == '2' || gender == '4') {
			System.out.println("여자입니다.");
		}
		else {
			System.out.println("사람이 아닙니다.");
		}
		
	}
	
}

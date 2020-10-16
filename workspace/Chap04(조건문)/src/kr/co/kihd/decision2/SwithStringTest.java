package kr.co.kihd.decision2;

public class SwithStringTest {
	public static void main(String[] args) {
		
		String str = "손님";
		
		//문자열이 조건으로 옴
		switch(str) {
			case "부장":
				System.out.println("450만원");
				break;
			case "차장":
				System.out.println("400만원");
				break;
			case "과장":
				System.out.println("350만원");
				break;
			case "대리":
				System.out.println("250만원");
				break;	
			case "사원":
				System.out.println("200만원");
				break;
			default:
				System.out.println("없는 직급이네요.");
				
		}
	}
}

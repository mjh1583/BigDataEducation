package kr.co.kihd.staticvariable;

public class CardTest {

	public static void main(String[] args) {
		
		Card card1 = new Card();		
		card1.setColor("노랑");
		card1.setCompany("국민은행");		
		System.out.println(card1);
		
		//card1.width = 80;
		//card1.height = 150;
		//static 변수는 반드시 클래스명.static 변수명으로 접근하여야 함.
		//웬만하면, 공유변수는 분석하는 단계에서는 바꾸지 않는게 바람직함.
		Card.width = 80;
		Card.height = 150;
	
		Card card2 = new Card();
		card2.setColor("파랑");
		card2.setCompany("농협");
		System.out.println(card2);
	}
	
}

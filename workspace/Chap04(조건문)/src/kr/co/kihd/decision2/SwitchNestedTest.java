package kr.co.kihd.decision2;

public class SwitchNestedTest {

	public static void main(String[] args) {
		
		int number = 7;
		
		//정형화된 값, 정해져 있는 값들에게는 switch문이 가독성이 좋다.(if문에 비해)
		switch(number) {
			case 1:
			case 7:
				switch(number) {
					case 1:
						System.out.println("011이시군요.");
						break;
					case 7:
						System.out.println("017이시군요.");
						break;
				}
				break;
			case 6:
			case 9:
				switch(number) {
					case 6:
						System.out.println("016이시군요.");
						break;
					case 9:
						System.out.println("019이시군요.");
						break;
				}
				break;
			default:
				System.out.println("010이시군요.");
					
		}

	}

}

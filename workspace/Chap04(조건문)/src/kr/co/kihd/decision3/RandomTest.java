package kr.co.kihd.decision3;

public class RandomTest {

	public static void main(String[] args) {

		//Math.ramdom()값은 0.000000 ~ 0.999999 사이의 값을 발생시킨다.
		System.out.println(Math.random());

		//주사위 숫자 : 랜덤하게 발생
		int num = (int)(Math.random() * 6 + 1);   // 0~5 => 1~6 까지 범위의 수를 발생시키는 식
		//int num2 = (int)(Math.random() * 45 + 1);   //로또(1~45 숫지 발생)
		System.out.println(num);
		
		if(num == 1) {
			System.out.println("1이 나왔네요!");
		}
		else if(num == 2) {
			System.out.println("2이 나왔네요!");
		}
		else if(num == 3) {
			System.out.println("3이 나왔네요!");
		}
		else if(num == 4) {
			System.out.println("4이 나왔네요!");
		}
		else if(num == 5) {
			System.out.println("5이 나왔네요!");
		}
		else {
			System.out.println("6이 나왔네요!");
		}
		
		//if문을 switch문으로 바꿔보세요.
		switch(num) {
			case 1:
				System.out.println("1이 나왔네요!");
				break;
			case 2:
				System.out.println("2이 나왔네요!");
				break;
			case 3:
				System.out.println("3이 나왔네요!");
				break;
			case 4:
				System.out.println("4이 나왔네요!");
				break;
			case 5:
				System.out.println("5이 나왔네요!");
				break;
			case 6:
				System.out.println("6이 나왔네요!");
				break;
		}
		
	}

}

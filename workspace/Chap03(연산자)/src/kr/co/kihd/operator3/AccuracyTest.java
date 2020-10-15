package kr.co.kihd.operator3;

public class AccuracyTest {

	public static void main(String[] args) {
		// CPU의 연산의 오차 확인
		int apple = 1;
		double unit = 0.1;
		int number = 7;
		
		double result = apple - (number * unit);
		System.out.println("사과 한개에서");
		System.out.println("0.7 조각을 빼면,");
		System.out.println(result + " 조각이 남는다.");

		double result2 = number * unit;
		System.out.println(result2);
		
	}

}

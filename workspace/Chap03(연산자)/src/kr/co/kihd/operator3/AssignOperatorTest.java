package kr.co.kihd.operator3;

public class AssignOperatorTest {

	public static void main(String[] args) {
		
		// 복합대입연산자 이해
		int result = 0;
		
		// 복합대입연산자는 값을 누적시킬때 많이 사용
		result += 10;    // result = result + 10
		System.out.println("result = " + result);
		
		result -= 5;     // result = result - 5
		System.out.println("result = " + result);
		
		result *= 5;     // result = result * 5
		System.out.println("result = " + result);
		
		result /= 5;     // result = result / 5
		System.out.println("result = " + result);
		
		result %= 5;     // result = result % 5;
		System.out.println("result = " + result);
		
	}

}

package kr.co.kihd.decision3;

public class MethodTest {

	//메서드의 선언부 구성
	/*
	 * 1. 리턴타입(반환값) : int
	 * 2. 메서드명
	 * 3. () : 매개변수, 인자값, Arguments, Parameter
	 */
	public static int add(int x, int y) {
		System.out.println("add() 메서드 호출됨");
	
		int temp = 0;
		temp = x + y;
		
		return temp;
	}
	
	public static int minus(int x, int y) {
		System.out.println("minus() 메서드 호출됨");
		
		return x - y;
	}
	
	public static int multiply(int x, int y) {
		System.out.println("multiply() 메서드 호출됨");
		
		return x * y;
	}
	
	public static double divide(double x, double y) {
		System.out.println("divide() 메서드 호출됨");
		
		return x / y;
	}
	
	public static void main(String[] args) {
		
		int num1 = 10;
		int num2 = 30;
		
		//int result = num1 + num2;
		
		//값에 의한 복사(Call by Value)
		int result = MethodTest.add(num1, num2);
		System.out.println("num1 + num2 : " + result);
		
		result = MethodTest.minus(num1, num2);
		System.out.println("num1 - num2 : " + result);
		
		result = MethodTest.multiply(num1, num2);
		System.out.println("num1 * num2 : " + result);
		
		double result2 = MethodTest.divide(num1, num2);
		System.out.println("num1 / num2 : " + result2);
	}

}

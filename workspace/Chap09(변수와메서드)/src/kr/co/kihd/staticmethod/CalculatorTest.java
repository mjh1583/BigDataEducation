package kr.co.kihd.staticmethod;

public class CalculatorTest {

	public static void main(String[] args) {
		
		Calculator calculator = new Calculator();
		
		int addResult = calculator.add(100, 200);
		System.out.println("인스턴스 메서드 add() 호출결과 : " + addResult);
		
		int substractResult = calculator.substract(100, 200);
		System.out.println("인스턴스 메서드 substract() 호출결과 : " + substractResult);
		
		long multiplyResult = Calculator.multiply(100, 20);
		System.out.println("static 메서드 multiply() 호출결과 : " + multiplyResult);
	
		double divideResult = Calculator.divide(100.2, 10.2);
		System.out.println("static 메서드 divide() 호출결과 : " + divideResult);
		
		Integer.parseInt("100");
		Math.random();
		
	}
	
}

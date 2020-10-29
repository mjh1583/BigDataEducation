package kr.co.kihd.staticnonstatic;

//메서드 오버로딩(method overloading) : 한 클래스내에 같은 이름을 가지는 메서드를 여러 개 정의하는 것.
public class Accumulator {

	//add라는 메서드명으로 오버로딩함
	public int add(int x, int y) {
		System.out.println("add(int x, int y)");
		return x + y;
	}
	
	//변수 이름은 오버로딩과 상관 없음
//	public int add(int a, int b) {
//		System.out.println("add(int a, int b)");
//		return a + b;
//	}
	
	public long add(int x, long y) {
		System.out.println("add(int x, long y)");
		return x + y;
	}

	public long add(long x, int y) {
		System.out.println("add(long x, int y)");
		return x + y;
	}
	
	public long add(long x, long y) {
		System.out.println("add(long x, long y)");
		return x + y;
	}
	
	public double add(double x, double y) {
		System.out.println("add(double x, double y)");
		return x + y;
	}
	
	//참조형 변수를 받아서 오버로딩하는 케이스
	public long add(int[] arr) {
		System.out.println("add(int[] arr) : 배열의 주소를 받아서 그 값의 총합을 구하여 리턴하고 있는 메서드");
		
		long sum = 0L;
		
		for(int i : arr)
		{
			sum += i;
		}
		return sum;
	}
	
	//클래스를 매개변수로 받아서 오버로딩하는 케이스
	public int add(A a) {
		System.out.println("add(A a)");
		return a.data1 + a.data2;
	}
	
	public int divide(int amount, int number) {
		System.out.println("divide(int amount, int number)");
		return amount / number;
	}
	public double divide(double amount, double number) {
		System.out.println("divide(double amount, double number)");
		return amount / number;
	}
}
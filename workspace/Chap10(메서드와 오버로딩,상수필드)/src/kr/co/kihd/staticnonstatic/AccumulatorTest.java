package kr.co.kihd.staticnonstatic;

class A {
	int data1 = 10;
	int data2 = 20;
}

public class AccumulatorTest {

	public static void main(String[] args) {
		
		Accumulator accumulator = new Accumulator();
		int iResult = accumulator.add(10, 50);
		System.out.println("iResult : " + iResult);
		
		//접미사 반드시 붙이도록 함.
		long lResult = accumulator.add(100, 7500L);
		System.out.println("lResult : " + lResult);
		
		lResult=  accumulator.add(1000L, 10);
		System.out.println("lResult : " + lResult);
		
		lResult=  accumulator.add(2000L, 20L);
		System.out.println("lResult : " + lResult);
		
		double dResult = accumulator.add(107.88, 11.55);
		System.out.println("dResult : " + dResult);
		
		lResult = accumulator.add(new int[] {1, 2, 3, 4, 5});
		System.out.println("lResult : " + lResult);	
				
		iResult = accumulator.add(new A());
		System.out.println("iResult : " + iResult);
		
		iResult = accumulator.divide(4, 2);
		System.out.println("iResult : " + iResult);
		
		dResult = accumulator.divide(10.0, 5.0);
		System.out.println("dResult : " + dResult);
	}

}

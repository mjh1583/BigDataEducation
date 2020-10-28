package kr.co.kihd.callstack;

public class CallStackTest {
	
	//콜스택(Stack, LIFO)은 후입선출. (동전통)
	//<--> 큐(Queue, FIFO)는 선입선출. (파이프, 수도호스)
	public static void main(String[] args) {
	
		System.out.println("main() 실행됨");
		CallStackTest.first();
		System.out.println("main() 종료됨");
		
	}
	
	public static void first() {
		System.out.println("first() 실행됨");
		second();  //같은 클래스내에 메서드라면 클래스명은 생략해도 무방함.
		System.out.println("first() 종료됨");
	}
	
	public static void second() {
		System.out.println("second() 실행됨");
		CallStackTest.third();
		System.out.println("second() 종료됨");
	}

	public static void third() {
		System.out.println("third() 실행됨");
		System.out.println("third() 종료됨");
	}
}

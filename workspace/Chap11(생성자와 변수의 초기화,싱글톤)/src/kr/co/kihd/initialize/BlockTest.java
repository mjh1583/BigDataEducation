package kr.co.kihd.initialize;

public class BlockTest {

	//인스턴스 초기화블럭 : 인스턴스가 생성될 때마다 호출됨(힙에 생성)
	{
		System.out.println("인스턴스 초기화블럭 실행됨.");
	}
	
	//정적 초기화블럭 : 단 한번 수행이 이루어짐(클래스 영역에 생성)
	static {
		System.out.println("정적 초기화블럭 실행됨");
	}
	
	public BlockTest() {
		System.out.println("생성자 호출됨");
	}
	
	/*
	 * 초기화 순서
	 * 1. 클래스 변수 초기화 순서
	 *    : 기본값 -> 명시적 초기화 -> 클래스 초기화블럭
	 * 2. 인스턴스 변수 초기화 순서
	 *    : 기본값 -> 명시적 초기화 -> 인스턴스 초기화블럭 -> 생성자
	 */
	public static void main(String[] args) {
		
		BlockTest blockTest = new BlockTest();
		System.out.println(blockTest);
		
	}

}

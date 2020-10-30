package kr.co.kihd.initialize;

public class Product {

	static int number = 0;       //공유
	int countNo;                 //인스턴스별 개별 생성
	int[] arr = new int[10];
	
	//정적 초기화 블럭(단, 한번만 실행됨)
	static {
		System.out.println("정적 초기화 블럭 호출됨");
	}
	
	//인스턴스 초기화 블럭(정적멤버 사용가능함)
	{
		System.out.println("인스턴스 초기화 블럭 호출됨");
		++number;
		this.countNo = Product.number;
		
		for(int i = 0; i < this.arr.length; i++)
		{
			this.arr[i] = (int)(Math.random() * 10) + 1; 
		}
	}
	
	public Product() {
		System.out.println("기본 생성자 호출됨");
	}
	
	
	
}

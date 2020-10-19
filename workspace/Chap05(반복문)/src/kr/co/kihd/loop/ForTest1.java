package kr.co.kihd.loop;

/*
 * 싱글루프 일때:
 * int i = 1 ==> 초기화하는 코드(최초 1번만 실행)
 * i <= 100  ==> 조건식 (참이어야만 코드블록 실행)
 * i++       ==> 증감식 
 */

public class ForTest1 {

	public static void main(String[] args) {
		// 1~100까지 합을 구하는 반복문
		
		int sum = 0;
		
		for(int i = 1; i <= 100; i++) {
			sum += i;
			//System.out.println("sum : " + sum);
		}
		
		System.out.println("1~100까지의 합 : " + sum);
				
	}
}

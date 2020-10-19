package kr.co.kihd.loop;

/*
 * 디버깅 : debug창으로 의도치 않게 넘어갔다면, 프로그램 문제 발생한것으로 에러를 잡아나가는 과정을 디버깅이라고 한다.
 * breakPoint(종단점) 설정 후, 실행시키면 F8을 누르면서 한 단계씩 진행시켜나가면서 변수의 값들을 살펴나가면 에러를 쉽게 잡을 수 있다.
 */

public class ForTest2 {

	public static void main(String[] args) {
		// 누적합계가 2000 이상일때 i의 값을 출력하시오.
		int sum = 0;
		int temp = 0;
		
		for(int i = 0; i <= 100; i++)
		{
			sum += i;
			
			if(sum >= 2000)
			{
				temp = i;
				//System.out.println("누적합계 2000 이상일때 i의 값 : " + i);
				break;
			}
		}
		
		System.out.println("누적합계 2000 이상일때 i의 값 : " + temp);
		System.out.println("누적합계 2000 이상일때 sum의 값 : " + sum);
		
	}

}

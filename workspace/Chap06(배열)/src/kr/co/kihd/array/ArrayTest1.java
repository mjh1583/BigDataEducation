package kr.co.kihd.array;

public class ArrayTest1 {

	public static void main(String[] args) {
		//score는 참조변수, int[]
		int[] score = null;
		//방도 만들지 않았는데, 값을 대입하고 있음(문법에러)
		//score = {100, 200};
		
		//score는 5개의 방을 힙에다가 생성하고 있음(20바이트)
		score = new int[5];
		//배열명은 곧 주소다.
		System.out.println("score의 주소값 : " + score);
		
		for(int i = 0; i < score.length; i++)
		{
			System.out.println("score[" + i + "] = " + score[i] );
		}
		System.out.println();
		
		//score[0]는 변수와 동일하다.
		//score는 주소다. []안에 들어가는 숫자를 인덱스(첨자)라고 한다.
		score[0] = 100;
		for(int i = 0; i < score.length; i++)
		{
			System.out.println("score[" + i + "] = " + score[i] );
		}
		System.out.println();
		
		//배열에다가 값을 대입시키고 있는 형태 + 배열의 각각의 방에 있는 값을 출력하는 형태
		for(int i = 0; i < score.length; i++)
		{
			score[i] = i + 10; 
			System.out.println("score[" + i + "] = " + score[i] );
		}
		
		
	}

}

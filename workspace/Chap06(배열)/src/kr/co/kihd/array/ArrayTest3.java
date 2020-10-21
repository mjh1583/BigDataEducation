package kr.co.kihd.array;

import java.util.Arrays;

public class ArrayTest3 {
	
	public static void main(String[] args) {

		//40바이트가 힙에 생성됨
		int[] arr1 = new int[10];
		
		//arr1배열에 난수를 10개 대입
		for(int i = 0; i < arr1.length; i++)
		{
			arr1[i] = (int)(Math.random()*10) + 1;
		}
		
		for(int i = 0; i < arr1.length; i++)
		{
			if(i != 9)
			{
				System.out.print(arr1[i] + ",");
			}
			else
				System.out.println(arr1[i]);
		}
		
		System.out.println();
		//Arrays클래스 : 배열을 조작하기 쉽게 만들어 놓은 유틸리티 클래스
		System.out.println(Arrays.toString(arr1));
		
		//6바이트가 힙에 생성됨
		char[] chArr = new char[] {'a', 'b', 'c'};
		String[] str = new String[10];
		boolean[] bool = new boolean[10];
		System.out.println(Arrays.toString(chArr));
		
		//주소값 출력
		//출력 스트림에다가 참조변수를 넣으면 자동적으로 toString() 호출이 됨
		System.out.println(arr1);
		//System.out.println(arr1.toString());    //타입@16진수
		System.out.println(str);
		System.out.println(bool);
		
		System.out.println(chArr);
		//char 타입은 주소를 출력하려면 toString()호출해야 함
		System.out.println(chArr.toString());
	}
	
}

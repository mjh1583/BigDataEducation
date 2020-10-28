package kr.co.kihd.practice03;

import java.util.Scanner;

public class GenerateArray {
	//실습문제 8번
	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		System.out.print("정수 몇개?");
		int n = scan.nextInt();
		
		if(n <= 1 || n > 100)
		{
			System.out.println("1~100 사이의 값을 입력하세요!");
			scan.close();
			return;
		}
		
		//n개의 배열 생성
		int[] arr = new int[n];
		
		for(int i = 0; i < arr.length; i++)
		{
			//1~100범위의 랜덤 정수
			int intNum = (int)(Math.random() * 100 + 1);
			
			if(exist(arr, i, intNum))
			{
				i--;
				continue;
			}
			arr[i] = intNum;
		}
		
		//배열 출력
		for(int i = 0; i < arr.length; i++)
		{
			if(i % 10 == 0)
			{
				System.out.println();  // 10개 출력 후 다음줄로
			}
			System.out.print(arr[i] + " ");
		}
		scan.close();
		
	}
	
	//정수 intNum이 이미 배열 array[0]~array[i-1]에 있는지 검사
	public static boolean exist(int[] arr, int to, int intNum) {
		for(int j = 0; j < to; j++)
		{
			if(arr[j] == intNum)
			{
				return true;     //일치하는 것이 존재한다.
			}
		}
		
		return false;
	}
}

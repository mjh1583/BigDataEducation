package kr.co.kihd.loop2;

import java.util.Scanner;

public class InputGugudanTest {

	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		
		System.out.println("구구단을 출력합니다.");
		System.out.print("몇 단부터 출력할까요? : ");
		
		int start = scan.nextInt();
		
		System.out.print("끝 단은 얼마인가요? : ");
		
		int end = scan.nextInt();
		
		for (/* int i = start */; start <= end; start++)
		{
			System.out.println("======" + start + "단 ======");
			for(int j = 1; j < 10; j++)
			{
				System.out.println(start + " * " + j + " = " + start * j);
			}
			System.out.println();	
		}
			
		scan.close();
	}
}

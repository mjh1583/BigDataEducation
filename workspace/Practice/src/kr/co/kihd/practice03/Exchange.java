package kr.co.kihd.practice03;

import java.util.Scanner;

public class Exchange {
	//실습문제 6번
	public static void main(String[] args) {
		
		int[] unit = {50000, 10000, 1000, 500, 100, 50, 10, 1};
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("금액을 입력하시오>>");
		int money = scan.nextInt();
		
		for(int i = 0; i < unit.length; i++)
		{
			if(money / unit[i] != 0) // 몫이 있는 경우
			{
				System.out.println(unit[i] + "원 짜리 : " + (money / unit[i]) + "개");
			}
			money = money % unit[i];
		}
	
		scan.close();
	}
	
}

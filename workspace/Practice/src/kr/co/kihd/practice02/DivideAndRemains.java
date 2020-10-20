package kr.co.kihd.practice02;

import java.util.Scanner;

public class DivideAndRemains {
	//실습문제 2번
	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("2자리수 정수 입력(10~99)>>");
		int num = scan.nextInt();
		
		if(num < 10 || num > 99)
		{
			System.out.println("10~99 사이의 정수만 입력하세요.");
			scan.close();
			return;
		}
		
		int quotient = num / 10;
		int reminder = num % 10;
		
		if (quotient == reminder)
		{
			System.out.println("Yes ! 10의 자리와 1의 자리가 같습니다.");
		}
		else
		{
			System.out.println("No ! 10의 자리와 1의 자리가 다릅니다.");
		}
		
		scan.close();
	}

}
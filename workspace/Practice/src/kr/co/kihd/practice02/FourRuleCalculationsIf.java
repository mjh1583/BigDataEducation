package kr.co.kihd.practice02;

import java.util.Scanner;

public class FourRuleCalculationsIf {
	//실습문제 12번
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		
		System.out.print("연산>>");
		double d1 = scan.nextDouble();
		String c = scan.next();
		double d2 = scan.nextDouble();
		
		if(c.equals("+"))
		{
			System.out.printf("%.2f + %.2f의 계산결과는 %.2f\n", d1, d2, d1 + d2);
		}
		else if(c.equals("-"))
		{
			System.out.printf("%.2f - %.2f의 계산결과는 %.2f\n", d1, d2, d1 - d2);
		}
		else if(c.equals("*"))
		{
			System.out.printf("%.2f * %.2f의 계산결과는 %.2f\n", d1, d2, d1 * d2);
		}
		else if(c.equals("/"))
		{
			if(d2 == 0)
			{
				System.out.println("0으로 나눌 수 없습니다.");
				scan.close();
				return;
			}
			System.out.printf("%.2f / %.2f의 계산결과는 %.2f\n", d1, d2, d1 / d2);
		}
		else
			System.out.println("올바른 연산자가 입력되지 않았습니다.");
		
		scan.close();

	}

}

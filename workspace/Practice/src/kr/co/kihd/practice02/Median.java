package kr.co.kihd.practice02;

import java.util.Scanner;

public class Median {
	//실습문제 4번
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		
		System.out.print("정수 3개를 입력하시오>>");
		
		int num1 = scan.nextInt();
		int num2 = scan.nextInt();
		int num3 = scan.nextInt();
		
		int median = num1;
		
		if((num1 >= num2 && num1 <= num3) || (num1 <= num2 && num1 >= num3))
		{
			median = num1;
		}
		else if((num2 >= num1 && num2 <= num3) || (num2 <= num1 && num2 >= num3))
		{
			median = num2;
		}
		else
		{
			median = num3;
		}
		System.out.println("중간 값은 " + median);
		
		scan.close();

	}

}

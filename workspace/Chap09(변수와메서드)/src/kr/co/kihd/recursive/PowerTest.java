package kr.co.kihd.recursive;

import java.util.Scanner;

public class PowerTest {

	public static void main(String[] args) {
		
		int x = 0;
		int n = 0;
		long result = 0L;
		
		System.out.println("제곱까지의 합을 계산합니다.");
		System.out.println("ex) 2의 3승 : 2의 1승 + 2의 2승 + 2의 3승은 14입니다!");
		Scanner scan = new Scanner(System.in);
		System.out.print("제곱하고 싶은 수를 입력 : ");
		x = scan.nextInt();
		System.out.print("몇 승을 더할까요?(입력) : ");
		n = scan.nextInt();
		
		for(int i = 1; i <= n; i++)
		{
			result += power(x, i);
		}
		
		System.out.printf("%d의 %d승까지의 합은 %d입니다!!\n", x, n, result);
		
		scan.close();
	}
	
	public static long power(int x, int n) {
		long result = 0;
		
		if(n == 1)
		{
			result = x * n;
		}
		else
		{
			result = x * power(x, n-1);
		}
		
		return result;
	}
	
}

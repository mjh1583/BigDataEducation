package kr.co.kihd.practice03;

import java.util.Scanner;

public class PrintAlphabet {
	//실습문제 4번
	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("소문자 알파벳 하나를 입력하시오>>");
		
		String str = scan.next();
		if(str.length() != 1)
		{
			System.out.println("알파벳 하나만 입력해야 합니다!");
			scan.close();
			return;
		}
		
		char c = str.charAt(0);
		if(c < 'a' || c > 'z') {
			System.out.println("소문자 알파벳이 아닙니다.");
			scan.close();
			return;
		}
		
		for(char i = c; i >= 'a'; i--)
		{
			for(char j = 'a'; j <= i; j++)
			{
				System.out.print(j);
			}
			System.out.println("");
		}
		scan.close();
	}

}

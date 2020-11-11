package kr.co.kihd.string;

import java.util.Arrays;
import java.util.Scanner;

public class ScannerTest {
	
	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		System.out.print("입력 : ");
		String str = scan.nextLine();
		System.out.println(str);
		
		byte[] b1 = str.getBytes();
		System.out.println(Arrays.toString(b1));
		
		//toCharArray() : 문자열을 char형 배열로 바꾼다.
		char[] c1 = str.toCharArray();  //한글출력
		System.out.println(c1.length);
		for(int i = 0; i < c1.length; i++) {
			System.out.print(c1[i]);
		}
		System.out.println();
		System.out.println(Arrays.toString(c1));  
		
		
		
		
		
		scan.close();
	}
	
}
